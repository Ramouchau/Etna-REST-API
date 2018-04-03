import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let putTranslation = (req, res, next) => {
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

		let query = "SELECT *	FROM translation WHERE id = " + req.params.id + " && domain_id = '" + domain.id + "' LIMIT 1"
		con.query(query, function (err, translation) {
			if (err) {
				console.log(err)
				res.status(500).json({ "message": "db request error." })
				return
			}

			if (!translation[0]){
				res.status(404).json({
					code: 404,
					message: "translation introuvable."
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

					if (!req.body.trans) {
						res.status(400).json({
							code: 400,
							message: "requete invalide."
						})
						return
					}
				})
			})
		})
	})
}