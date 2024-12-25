// middlewares/authenticate.js
const jwt = require('jsonwebtoken');
const axios = require('axios');
const {handleError} = require('../utils/responseHandler');


const authenticate = async (req, res, next) => {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        handleError(res, { statusCode: 401, message: 'Authorization token is required' })
        return
    }

    const token = authHeader.split(' ')[1];

    try {
        const publicKeyResponse = await axios.get('http://user-service-url.com/public-key');
        const publicKey = publicKeyResponse.data.publicKey;

        const decoded = jwt.verify(token, publicKey);

        req.user = decoded; // Attach user info to the request
        next();
    } catch (error) {

        handleError(res, error)
    }
};

module.exports = { authenticate };
