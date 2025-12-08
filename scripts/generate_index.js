/**
 * scripts/generate_index.js
 * Node.js script to dynamically read the 'posts/' directory and output
 * a JSON array of post slugs (folder names) to standard output.
 */

const fs = require('fs');
const path = require('path');

const POSTS_DIR = 'posts'; // Must match POSTS_DIR in the Makefile

try {
    // 1. Read the posts directory
    const slugs = fs.readdirSync(POSTS_DIR)
        .filter(name => {
            const fullPath = path.join(POSTS_DIR, name);
            // 2. Filter for actual directories
            if (fs.statSync(fullPath).isDirectory()) {
                // 3. Ensure the folder contains the required index.md file
                return fs.existsSync(path.join(fullPath, 'index.md'));
            }
            return false;
        })
        .sort((a, b) => b.localeCompare(a)); // Sort posts by folder name (date descending)

    // Output the resulting array as a JSON string
    console.log(JSON.stringify(slugs, null, 4));

} catch (error) {
    if (error.code === 'ENOENT') {
        console.error(`Error: The directory '\posts' was not found. Please create it.`);
        console.log('[]');
    } else {
        console.error('An unexpected error occurred during index generation:', error.message);
        console.log('[]');
    }
}
