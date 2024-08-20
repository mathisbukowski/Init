const getAllFiles = require('./getAllFiles');
const path = require('path');

module.exports = (exceptions) => {
    let commands = [];

    const commandsFolders = getAllFiles(path.join(__dirname, '..', 'Commands'), true);

    for (const commandsFolder of commandsFolders) {
        const commandFiles = getAllFiles(commandsFolder);

        for (const commandFile of commandFiles) {
            if (exceptions && exceptions.includes(commandFile)) continue;

            const command = require(commandFile);
            commands.push(command);

        }
    }

    return commands;
}