const { sendResponse, handleError } = require('../utils/responseHandler');
const eventService = require('../services/eventService');

const createEvent = async (req, res) => {
  try {
    const eventMessage = 'New event created!';
    await eventService.sendEventMessage(eventMessage);
    sendResponse(res, 200, true, 'Event created and message sent!');
  } catch (error) {
    handleError(res, error, 'Error creating event');
  }
};

module.exports = { createEvent };
