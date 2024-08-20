module.exports = {
    name: 'ping',
    description: 'Pong!',
    testOnly: true,
    deleted: false,

    callback: (client, interaction) => {
        interaction.reply(`Pong! ${client.ws.ping}ms`);
    },
};