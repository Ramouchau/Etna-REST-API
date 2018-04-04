import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let deleteDomainLang = (req, res, next) => {
	let query = "SELECT *	FROM domain WHERE slug = '" + req.params.domain + "' LIMIT 1"
	con.query(query, function (err, domain) {
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

			let query = "DELETE FROM domain_lang WHERE domain_id = '" + domain.id + "' && lang_id = '" + req.params.id + "'"
			con.query(query, function (err, lang) {
				if (!lang.affectedRows) {
					res.status(404).json({
						code: 404,
						message: "langue introuvable."
					})
					return
				}
				let query = "SELECT * FROM domain_lang WHERE domain_id = '" + domain.id + "'"
				con.query(query, function (err, langs) {
					let reslang = []
					langs.forEach(element => {
						reslang.push(element.lang_id)
					});
					res.status(200).json({
						message: "success",
						datas: {
							langs: reslang,
							id: domain.id,
							slug: domain.slug,
							name: domain.name,
							description: domain.description,
							creator: {
								id: user[0].id,
								username: user[0].username,
								email: user[0].email
							},
							created_at: domain.created_at
						}
					})
				})
			})
		})
	})
}