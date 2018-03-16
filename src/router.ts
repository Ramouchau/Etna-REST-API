import { Router } from 'express';

export default function(router: Router){

	router.get('/', (req, res, next) => {
		res.json({
			message: 'Hello World!'
		})
	})

	router.get('*', function(req, res){
		res.status(404).json({
			"message": "not found"
		})
	})

	return router
}