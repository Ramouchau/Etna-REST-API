import {db} from '../config'
import {Connection, createConnection} from 'mysql'

let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let getDomains = (req, res, next) => {
	con.connect(function(err) {
		if (err) res.status(500).json({ "message": "db connexion error." })

		con.query("SELECT * FROM domain", function (err, result) {
			if (err) res.status(500).json({ "message": "db request error." })

			res.status(200).json({
				code: 200,
				message: "success",
				datas: result
			})
		})
	})
}