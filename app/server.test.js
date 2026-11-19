const path = require('path');
const fs = require('fs')

test('main index.html file exists', () => {
  const filePath = path.join(__dirname, "index.html")
  expect(fs.existsSync(filePath)).toBeTruthy();
});

test('GET /health returns status ok', (done) => {
  const http = require('http');
  const app = require('./server');
  const server = app.listen(0, () => {
    http.get({ port: server.address().port, path: '/health' }, (res) => {
      let body = '';
      res.on('data', (d) => (body += d));
      res.on('end', () => {
        server.close();
        expect(res.statusCode).toBe(200);
        expect(JSON.parse(body)).toEqual({ status: 'ok' });
        done();
      });
    });
  });
});
