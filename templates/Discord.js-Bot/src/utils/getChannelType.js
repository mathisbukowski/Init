module.exports = (type) => {
    switch (type) {
        case 0: return 'GUILD_TEXT';
        case 2: return 'GUILD_VOICE';
        case 4: return 'GUILD_CATEGORY';
        case 5: return 'GUILD_NEWS';
        case 13: return 'GUILD_STAGE_VOICE';
        default: return 'GUILD_TEXT';
    }
}