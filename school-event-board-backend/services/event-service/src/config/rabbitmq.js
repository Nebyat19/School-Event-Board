const amqp = require('amqplib');

const RABBITMQ_HOST = process.env.RABBITMQ_HOST || 'rabbitmq';
const RABBITMQ_PORT = process.env.RABBITMQ_PORT || 5672;

const connectRabbitMQ = async () => {
    try {
        const connection = await amqp.connect(`amqp://${RABBITMQ_HOST}:${RABBITMQ_PORT}`);
        console.log('Connected to RabbitMQ server');
        return connection;
    } catch (error) {
        console.error('RabbitMQ connection failed:', error);
        throw error;
    }

};

module.exports = connectRabbitMQ;
