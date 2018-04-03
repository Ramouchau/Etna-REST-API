import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let getTranslations = (req, res, next) => {
	let query = "SELECT id 	FROM domain WHERE name = '" + req.params.domain + "' LIMIT 1"
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

		query = "SELECT lang_id FROM domain_lang WHERE domain_id = '" + domain.id + "'"
		con.query(query, function (err, lang) {
			if (err) {
				console.log(err)
				res.status(500).json({ "message": "db request error." })
				return
			}

			query = "SELECT id, lang_id, `code`, trans from translation LEFT OUTER JOIN translation_to_lang ON translation.id = translation_to_lang.translation_id WHERE translation.domain_id = '" + domain.id + "' "
			con.query(query, function (err, translations) {
				if (err) {
					console.log(err)
					res.status(500).json({ "message": "db request error." })
					return
				}

				let result = new Array<any>()
				let i = 0
				for (let key in translations) {
					if (!result.some(el => el.id == translations[key].id)) {
						let trans = translations[key].trans
						result[i] = translations[key]
						result[i].trans = {}
						lang.forEach(element => {
							result[i].trans[element.lang_id] = translations[key].code
						});
						result[i].trans[translations[key].lang_id] = trans
						delete result[i].lang_id
						i++
					}
					else {
						let curr = result.findIndex(el => el.id == translations[key].id)
						result[curr].trans[translations[key].lang_id] = translations[key].trans
					}
				}
				res.status(200).json({
					code: 200,
					message: "success",
					datas: result
				})
			})
		})
	})
}
