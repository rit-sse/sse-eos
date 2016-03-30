'use strict';

const express = require('express');
const bodyparse = require('body-parser');
const app = express();
const redis = require('redis');

let client = redis.createClient('redis://127.0.0.1:6379');

app.use(bodyparse.json());

app.post('/', (req, res) => {
  client.publish('test', 'build for ' + req.body.push_data.tag + ' has finished');  
  res.send(req.body.push_data.tag);
});

const server = app.listen(process.env.PORT || 3000, () => {
  console.log('Express server listening on port ' + server.address().port);
});

