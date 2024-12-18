const express = require('express');
const eventRoutes = require('./routes/eventRoutes');

const app = express();

// Middleware
app.use(express.json());

// Routes
app.use('/api/events', eventRoutes);

module.exports = app;
