module.exports = {
    name: 'help',
    description: 'Need Help!',
    // devOnly: Boolean,
    testOnly: true,
    // options: Object[],
    // deleted: Boolean,

    callback: (client, interaction) => {
        interaction.reply(`HELLPPPP! ${client.ws.ping}ms`);
    },
};