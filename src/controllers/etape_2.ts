import { db } from '../config'
import { Connection, createConnection } from 'mysql'
let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let getDomain = (req, res, next) => {
	let param = req.params.param
	let query = "SELECT * FROM domain WHERE name = '" + param + "' LIMIT 1"
	con.query(query, function (err, domain) {
		if (err) {
			console.log(err)
			res.status(500).json({ "message": "db request error." })
			return
		}

		domain = domain[0]
		if (!domain){
			res.status(404).json({
				code: 404,
				message: "parametre introuvable."
			})
			return
		}

		query = "SELECT lang_id FROM domain_lang WHERE domain_id = '" + domain.id + "'"
		con.query(query, function (err, langs) {
			if (err) {
				console.log(err)
				res.status(500).json({ "message": "db lang request error." })
				return
			}

			query = "SELECT id, username FROM user WHERE id = '" + domain.user_id + "'"
			con.query(query, function (err, user) {
				if (err) {
					console.log(err)
					res.status(500).json({ "message": "db lang request error." })
					return
				}

				domain.langs = langs.map(function (item) { return item.lang_id })
				domain.creator = user[0]
				delete domain.user_id
				res.status(200).json({
					code: 200,
					message: "success",
					datas: domain
				})
			})
		})
	})
}
