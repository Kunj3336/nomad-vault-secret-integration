const http = require('http');
const fs = require('fs');

const PORT = process.env.PORT || 3000;
const DB_PASSWORD = process.env.DB_PASSWORD || 'NOT_FOUND';

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      status: 'healthy',
      service: 'auth-service',
      secret_loaded: DB_PASSWORD !== 'NOT_FOUND',
      timestamp: new Date().toISOString()
    }));
    return;
  }

  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Auth Service running with Nomad + Vault dynamic secrets.');
});

server.listen(PORT, () => {
  console.log(`Auth Service listening on port ${PORT}`);
  console.log(`Dynamic secret loaded from Vault: ${DB_PASSWORD !== 'NOT_FOUND' ? 'YES' : 'NO'}`);
});