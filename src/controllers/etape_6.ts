import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let deleteTranslation = (req, res, next) => {
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

			if (!translation[0]) {
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

			query = "SELECT * FROM user WHERE password = '" + req.headers.authorization + "' LIMIT 1"
			con.query(query, function (err, user) {
				if (!user[0]) {
					res.status(401).json({
						code: 401,
						message: "authorisation invalide."
					})
					return
				}

				if (domain.user_id != user[0].id) {
					res.status(403).json({
						code: 403,
						message: "Forbidden."
					})
					return
				}

				query = "DELETE FROM translation_to_lang WHERE translation_id = '" + translation[0].id + "'"
				con.query(query, function (err, transLangs) {
					if (err) {
						console.log(err)
						res.status(500).json({ "message": "db request error." })
						return
					}

					query = "DELETE FROM translation WHERE id = '" + translation[0].id + "'"
					con.query(query, function (err, trans) {
						if (err) {
							console.log(err)
							res.status(500).json({ "message": "db request error." })
							return
						}
						res.status(200).json({
							code: 200,
							message: "success",
							datas: {
								id: translation[0].id,
							}
						})
					})
				})
			})
		})
	})
}