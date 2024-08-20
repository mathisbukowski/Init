
module.exports = async (client, guildId) => {
    let commands = [];

    if (guildId) {
        const guild = await client.guilds.fetch(guildId);
        commands = guild.commands;
    } else {
        commands = await client.application.commands;
    }

    await commands.fetch();
    return commands;
}