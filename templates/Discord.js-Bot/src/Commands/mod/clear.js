const {PermissionsBitField, EmbedBuilder} = require("discord.js");
const { logsChannel} = require('../../json/tools.json');

module.exports = {
    name: "clear",
    description: "Clear messages in the chat",
    testOnly: false,
    options: [
        {
            name: "amount",
            description: "The amount of messages who will be deleted.",
            type: 4,
            required: true
        }
    ],
    callback: (client, interaction) => {
        const amount = interaction.options.getInteger('amount') || 0;
        const member = interaction.member;

        if (!member.permissions.has([PermissionsBitField.Flags.ManageMessages, PermissionsBitField.Flags.ManageChannels])) {
            return interaction.reply({
                ephemeral: true,
                content: "You don't have permissions."
            });
        }
        if (!amount) {
            return interaction.reply({
                ephemeral: true,
                content: "Amount not provided"
            });
        }
        if (amount < 1 || amount > 100) {
            return interaction.reply({
                ephemeral: true,
                content: "Amount isn't valid. (must be between 1 and 100)"
            })
        }

        return interaction.channel.bulkDelete(amount, false).then( () => {
            interaction.reply({
                ephemeral: true,
                content: `${amount} message(s) were deleted. 🗑`
            });
            if (logsChannel) {
                const logChannel = interaction.guild.channels.cache.get(logsChannel);
                const logEmbed = new EmbedBuilder()
                    .setTitle("Messages deleted")
                    .setDescription(`**${amount}** message(s) were deleted by **${member.user.tag}**`)
                    .setTimestamp()
                    .setColor(0xFF0000);
                logChannel.send({embeds: [logEmbed]});
            }
        });
    }
}