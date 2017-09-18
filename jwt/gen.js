var jwt = require('jsonwebtoken');

var issuedAt = Math.floor(Date.now() / 1000);
var payload = {
  iss: process.env.AMO_JWT_ISSUER,
  jti: Math.random().toString(),
  iat: issuedAt,
  exp: issuedAt + 60,
};

var secret = process.env.AMO_JWT_SECRET;  // store this securely.
var token = jwt.sign(payload, secret, {
  algorithm: 'HS256',  // HMAC-SHA256 signing algorithm
});

console.log(token);
