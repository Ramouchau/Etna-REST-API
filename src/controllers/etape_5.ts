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

			query = "SELECT * FROM user WHERE password = '" + req.headers.authorization + "' LIMIT 1"
			con.query(query, function (err, user) {
				if (!user[0]) {
					res.status(401).json({
						code: 401,
						message: "authorisation invalide."
					})
					return
				}

				if ( domain.user_id != user[0].id){
					res.status(403).json({
						code: 403,
						message: "Forbidden."
					})
					return
				}

				query = "SELECT lang_id FROM domain_lang WHERE domain_id = '" + domain.id + "'"
				con.query(query, function (err, langs) {
					if (req.headers['content-type'] != 'application/x-www-form-urlencoded') {
						res.status(400).json({
							code: 400,
							message: "Content-type invalide.",
							datas: []
						})
						return
					}

					if (!req.body.trans) {
						res.status(400).json({
							code: 400,
							message: "requete invalide.",
							datas: []
						})
						return
					}

					let trans = []
					for (let element in req.body.trans) {
						if (!langs.some(function (el) { return el.lang_id === element })){
							res.status(400).json({
								code: 400,
								message: "langue non existante",
								datas: []
							})
							return
						}
						trans.push([translation[0].id, element, req.body.trans[element]])
					}

					query = `INSERT INTO translation_to_lang (translation_id, lang_id, trans)
					VALUES ? ON DUPLICATE KEY UPDATE
					lang_id = VALUES(lang_id),
					trans = VALUES(trans)`
					con.query(query, [trans], function (err, result) {
						if (err) {
							console.log(err)
							res.status(500).json({ "message": "db request error." })
							return
						}

						query = "SELECT * FROM translation_to_lang WHERE translation_id = '" + translation[0].id + "'"
						con.query(query, function (err, transLangs) {
							let resLangs = {}
							transLangs.forEach(element => {
								resLangs[element.lang_id] = element.trans
							});
							langs.forEach(element => {
								if (!resLangs[element.lang_id])
								resLangs[element.lang_id] = translation[0].code
							});
							res.status(200).json({
								code: 200,
								message: "success",
								datas: {
									code: translation[0].code,
									id: translation[0].id,
									trans: resLangs
								}
							})
						})
					})
				})
			})
		})
	})
}