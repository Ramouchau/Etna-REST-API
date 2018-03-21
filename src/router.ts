import { Router } from 'express';
import { domains } from './controllers/etape_1'

export default function(router: Router){

	router.get('/domains.json', domains)

	router.get('/domains.*', function(req, res){
		res.status(400).json({
			"code": 400,
			"message": "error",
			"datas": []
		})
	})

	router.get('*', function(req, res){
		res.status(404).json({
			"message": "not found"
		})
	})

	return router
}