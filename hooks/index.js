'use strict';

const express = require('express');
const bodyparse = require('body-parser');
const app = express();
const redis = require('redis');

let client = redis.createClient('redis://' + process.env['REDIS_PORT_6379_TCP_ADDR'] + ':6379');

app.use(bodyparse.json());

app.post('/', (req, res) => {
  client.publish('test', 'build for ' + req.body.repository.name + ' has finished');  
  res.send(req.body.push_data.tag);
});

const server = app.listen(process.env.PORT || 3000, () => {
  console.log('Express server listening on port ' + server.address().port);
});

