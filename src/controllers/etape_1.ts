import { db } from '../config'
import { Connection, createConnection } from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let getDomains = (req, res, next) => {
	con.query("SELECT id, slug, name, description FROM domain", function (err, domains) {
		if (err) {
			res.status(500).json({ "message": "db request error." })
			return
		}

		res.status(200).json({
			code: 200,
			message: "success",
			datas: domains
		})
	})
}

