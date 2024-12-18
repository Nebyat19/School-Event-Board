const { publishMessage } = require('../config/rabbitmq');

const createEvent = async (req, res) => {
    const event = req.body;

    // Example logic for saving event (in database)
    console.log('Event created:', event);

    // Publish to RabbitMQ
    try {
        await publishMessage('eventQueue', event);
        res.status(201).send({ message: 'Event created and sent to queue' });
    } catch (error) {
        res.status(500).send({ message: 'Error creating event', error });
    }
};

module.exports = { createEvent };
