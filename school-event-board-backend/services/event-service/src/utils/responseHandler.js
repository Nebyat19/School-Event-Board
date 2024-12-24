// responseHandler.js
const sendResponse = (res, statusCode, success, message, data = null) => {
    const response = {
      success,
      message,
    };
    if (data) {
      response.data = data;
    }
    res.status(statusCode).json(response);
  };
  
  const handleError = (res, error, defaultMessage = 'An error occurred') => {
    console.error('Error:', error); // Optionally log errors for debugging
    const statusCode = error.statusCode || 500; // Default to 500 if no status code provided
    const message = error.message || defaultMessage;
  
    // Send a standardized error response
    sendResponse(res, statusCode, false, message);
  };
  
  module.exports = { sendResponse, handleError };
  