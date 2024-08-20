const fs = require('fs');
const path = require('path');

module.exports = (dir, foldersOnly = false) => {
    const files = fs.readdirSync(dir);
    let allFiles = [];

    for (const file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            if (foldersOnly) {
                allFiles.push(fullPath);
            } else {
                allFiles = allFiles.concat(module.exports(fullPath));
            }
        } else {
            allFiles.push(fullPath);
        }
    }
    return allFiles;
}