import { db } from '../config'
import { Connection, createConnection } from 'mysql'
let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest",
	multipleStatements: true
})

export let postDomain = (req, res, next) => {
	if (!req.headers.authorization) {
		res.status(401).json({
			code: 401,
			message: "pas d'authorisation."
		})
		return
	}

	let query = "SELECT * FROM user WHERE password = '" + req.headers.authorization + "' LIMIT 1"
	con.query(query, function (err, user) {
		if (!user[0]) {
			res.status(401).json({
				code: 401,
				message: "authorisation invalide."
			})
			return
		}
		if (!req.body || !req.body.name || !req.body.description || !req.body.lang) {
			res.status(400).json({
				code: 400,
				message: "bad request",
				datas: []
			})
			return
		}
		query = "SELECT *	FROM domain WHERE name = '" + req.body.name + "'"
		con.query(query, function (err, domain) {
			let slug = req.body.name.replace(/\ /g,'-')
			if (domain[0]) {
				slug += domain.length
			}

			query = "SELECT *	FROM lang"
			con.query(query, function (err, lang) {
				req.body.lang.forEach(element => {
					if (!lang.some(function (el) { return el.code === element })) {
						res.status(400).json({
							code: 400,
							message: "langue non existante",
							datas: []
						})
						return
					}
				})
				let created_at = new Date()
				let dom = [[req.body.name, req.body.description, slug, user[0].id, created_at]]
				query = "INSERT INTO domain (name, description, slug, user_id, created_at) VALUES ?"
				con.query(query, [dom], function (err, newDomain) {
					if (err) {
						console.log(err)
						res.status(500).json({ "message": "db request error." })
						return
					}
					var langs = []
					req.body.lang.forEach(element => {
						langs.push([newDomain.insertId, element])
					});
					query = "INSERT INTO domain_lang (domain_id, lang_id) VALUES ?"
					con.query(query, [langs], function (err, newLangs) {
						res.status(201).json({
							code: 201,
							message: "success",
							datas: {
								langs: req.body.lang,
								id: newDomain.insertId,
								slug: slug,
								name: req.body.name,
								description: req.body.description,
								creator: {
									id: user[0].id,
									username: user[0].username,
									email: user[0].email
								},
								created_at: created_at
							}
						})
					})
				})
			})
		})
	})
}