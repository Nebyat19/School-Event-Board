const express = require('express');
const eventRoutes = require('./routes/eventRoutes');
const { authenticate } = require('./middlewares/authenticate');
const app = express();

// Middleware
app.use(express.json());

// Public route
app.get('/health', (req, res) => {
    res.status(200).send('Service is healthy!');
  });

// Routes
app.use('/api/events',authenticate, eventRoutes);

module.exports = app;
