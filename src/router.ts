import { Router } from 'express';
import { getDomains } from './controllers/etape_1'
import { getDomain } from './controllers/etape_2'
import { getTranslations } from './controllers/etape_3'
import { postTranslation } from './controllers/etape_4'
import { putTranslation } from './controllers/etape_5'

let err400 = (req, res) => {
	res.status(400).json({
		"code": 400,
		"message": "error",
		"datas": []
	})
}

export default function (router: Router) {
	router.get('/domains.json', getDomains)

	router.get('/domains/:param\.json', getDomain)

	router.get('/domains/:domain/translations.json', getTranslations)

	router.post('/domains/:domain/translations.json', postTranslation)

	router.put('/domains/:domain/translations/:id.json', putTranslation)

	router.get('/domains.*', err400)

	router.get('/domains/:param\.*', err400)

	router.get('/domains/:domain/translations.*', err400)

	router.post('/domains/:domain/translations.*', err400)

	router.put('/domains/:domain/translations/id\.*', err400)
	return router
}