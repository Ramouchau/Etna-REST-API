import { Router } from 'express';
import { getDomains } from './controllers/etape_1'
import { getDomain } from './controllers/etape_2'

export default function (router: Router) {
	router.get('/domains.json', getDomains)

	router.get('/domains/:param\.json', getDomain)

	router.get('/domains.*', function (req, res) {
		res.status(400).json({
			"code": 400,
			"message": "error",
			"datas": []
		})
	})

	router.get('/domains/:param\.*', function (req, res) {
		res.status(400).json({
			"code": 400,
			"message": "error",
			"datas": []
		})
	})

	return router
}