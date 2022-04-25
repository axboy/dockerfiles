const express = require('express')
const proxy = require('http-proxy-middleware') 
const app = express()

/*
 * node app.js arg1 arg2
 * arg1 -> port, default:5000
 * arg2 -> apiUrl, default:http://http://192.168.1.40:8082
 * 
 **/
const defaultApi = 'http://127.0.0.1:80'
const args = process.argv
const port = Number(args[2]) || 4000
const apiUrl = args[3] || defaultApi

//app.use(cookieParser())

const apiProxy = proxy('/api', { target: apiUrl, changeOrigin: true })
app.use('/api/*', function(req, res) {
  apiProxy(req, res)
})

app.use(express.static(__dirname + '/www'))
app.get('/', function(req, res) {
   res.sendFile(__dirname + '/www/index.html')
})

app.listen(port, () => {
  console.log('Listening on: http://localhost:' + port)
})