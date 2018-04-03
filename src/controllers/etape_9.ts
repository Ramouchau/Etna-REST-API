import { db } from '../config'
import { Connection, createConnection } from 'mysql'
let con = createConnection({
	host: db,
	user: "root",
	password: "",
	database: "tic_rest"
})

export let postDomain = (req, res, next) => {
}