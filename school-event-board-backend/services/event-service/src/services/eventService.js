const connectRabbitMQ = require('../config/rabbitmq');

const sendEventMessage = async (message) => {
  const channel = await connectRabbitMQ();
  if (channel) {
    const exchange = 'event_exchange';
    const queue = 'event_queue';

    channel.sendToQueue(queue, Buffer.from(message));
    console.log('Message sent to RabbitMQ:', message);
  }
  else{
    throw new Error('Failed to send message to RabbitMQ');
  }
};

//read from the queue
const receiveEventMessage = async () => {
  const channel = await connectRabbitMQ();
  if (channel) {
    const queue = 'event_queue';

    channel.consume(queue, (message) => {
      console.log('Message received from RabbitMQ:', message.content.toString());
    });
  }
  else{
    throw new Error('Failed to receive message from RabbitMQ');
  }
};

module.exports = { sendEventMessage, receiveEventMessage };
