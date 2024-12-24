const express = require('express');
const { createEvent } = require('../controllers/eventController');

const router = express.Router();

router.get('/', createEvent);
// router.get('/', (req, res) => {
//     res.send('Event Service is running');
// }
// )

module.exports = router;
