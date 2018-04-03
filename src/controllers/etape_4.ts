import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let postTranslation = (req, res, next) => {
	let query = "SELECT *	FROM domain WHERE name = '" + req.params.domain + "' LIMIT 1"
	con.query(query, function (err, domain) {
		if (err) {
			console.log(err)
			res.status(500).json({ "message": "db request error." })
			return
		}

		domain = domain[0]
		if (!domain) {
			res.status(404).json({
				code: 404,
				message: "domain introuvable."
			})
			return
		}

		if (!req.headers.authorization) {
			res.status(401).json({
				code: 401,
				message: "pas d'authorisation."
			})
			return
		}

		query = "SELECT id FROM user WHERE id = '" + domain.user_id + "' && password = '" + req.headers.authorization + "' LIMIT 1"
		con.query(query, function (err, user) {
			if (!user[0]) {
				res.status(401).json({
					code: 401,
					message: "authorisation invalide."
				})
				return
			}

			query = "SELECT lang_id FROM domain_lang WHERE domain_id = '" + domain.id + "'"
			con.query(query, function (err, lang) {
				if (req.headers['content-type'] != 'application/x-www-form-urlencoded') {
					res.status(400).json({
						code: 400,
						message: "Content-type invalide."
					})
					return
				}

				if (!req.body.code || !req.body.trans) {
					res.status(400).json({
						code: 400,
						message: "requete invalide."
					})
					return
				}

				lang.forEach(element => {
					if (!req.body.trans[element.lang_id])
						req.body.trans[element.lang_id] = req.body.code
				});

				query = "INSERT INTO translation (domain_id, code) VALUES ('" + user[0].id + "', '" + req.body.code + "')"
				con.query(query, function (err, translation) {
					if (err) {
						console.log(err)
						res.status(400).json({code: 400, "message": "translation already exist" })
						return
					}
					let values = []
					let i = 0;
					lang.forEach(element => {
						values[i] = [translation.insertId, element.lang_id, req.body.trans[element.lang_id]]
						i++
					})

					query = "INSERT INTO translation_to_lang (translation_id, lang_id, trans) VALUES ?"
					con.query(query, [values], function (err, translations) {
						if (err) {
							console.log(err)
							res.status(500).json({ "message": "db request error." })
							return
						}

						res.status(201).json({
							code: 201,
							datas: {
								code: req.body.code,
								trans: req.body.trans,
								id: translation.insertId
							}
						})
					})
				})
			})
		})
	})
}