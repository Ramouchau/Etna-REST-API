import * as path from 'path'
import * as express from 'express'
import * as logger from 'morgan'
import * as bodyParser from 'body-parser'
import routerInit from './router'

// Creates and configures an ExpressJS web server.
class App {

  // ref to Express instance
  public express: express.Application

  //Run configuration methods on the Express instance.
  constructor() {
    this.express = express()
    this.middleware()
    this.routes()
  }

  // Configure Express middleware.
  private middleware(): void {
    this.express.use(logger('dev'))
    this.express.use(bodyParser.json())
    this.express.use(bodyParser.urlencoded({ extended: true }))
  }

  // Configure API endpoints.
  private routes(): void {
    let router = routerInit(express.Router())
    // placeholder route handler
		this.express.use('/api', router)

		this.express.use('/*', function (req, res) {
			res.status(404).json({
				"code": 404,
				"message": "not found"
			})
		})

  }

}

export default new App().express