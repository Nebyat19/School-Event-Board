const amqp = require('amqplib');

let channel, connection;

async function connectToRabbitMQ() {
    try {
        connection = await amqp.connect(process.env.RABBITMQ_URL);
        channel = await connection.createChannel();
        console.log('Connected to RabbitMQ');
    } catch (error) {
        console.error('RabbitMQ connection error:', error);
        process.exit(1);
    }
}

async function publishMessage(queue, message) {
    if (!channel) throw new Error('RabbitMQ channel not initialized');
    await channel.assertQueue(queue);
    channel.sendToQueue(queue, Buffer.from(JSON.stringify(message)));
    console.log(`Message sent to queue ${queue}`);
}

module.exports = { connectToRabbitMQ, publishMessage };
