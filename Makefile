# --- Configuration Variables ---
# The base directory where all post folders reside.
POSTS_DIR := posts

# The name of the dynamic index file the client-side app reads.
INDEX_FILE := $(POSTS_DIR)/post_list.json

# The name of the Node.js script that generates the index file.
INDEX_SCRIPT := scripts/generate_index.js

# Command for starting a simple local web server.
# Python 3 is highly recommended for cross-platform local serving.
SERVE_COMMAND := python3 -m http.server 8000

# --- Setup and Index Generation Rules ---

.PHONY: all clean setup index serve help

all: setup index serve

# Create the necessary directories and the essential index generation script.
setup:
	@echo "✨ Setting up environment and generating required script..."
	mkdir -p $(POSTS_DIR) scripts
	
	# --- START OF EMBEDDED SCRIPT CREATION USING ECHO ---
	@echo "Creating required file: $(INDEX_SCRIPT)"
	@echo "/**" > $(INDEX_SCRIPT)
	@echo " * scripts/generate_index.js" >> $(INDEX_SCRIPT)
	@echo " * Node.js script to dynamically read the 'posts/' directory and output" >> $(INDEX_SCRIPT)
	@echo " * a JSON array of post slugs (folder names) to standard output." >> $(INDEX_SCRIPT)
	@echo " */" >> $(INDEX_SCRIPT)
	@echo "" >> $(INDEX_SCRIPT)
	@echo "const fs = require('fs');" >> $(INDEX_SCRIPT)
	@echo "const path = require('path');" >> $(INDEX_SCRIPT)
	@echo "" >> $(INDEX_SCRIPT)
	@echo "const POSTS_DIR = 'posts'; // Must match POSTS_DIR in the Makefile" >> $(INDEX_SCRIPT)
	@echo "" >> $(INDEX_SCRIPT)
	@echo "try {" >> $(INDEX_SCRIPT)
	@echo "    // 1. Read the posts directory" >> $(INDEX_SCRIPT)
	@echo "    const slugs = fs.readdirSync(POSTS_DIR)" >> $(INDEX_SCRIPT)
	@echo "        .filter(name => {" >> $(INDEX_SCRIPT)
	@echo "            const fullPath = path.join(POSTS_DIR, name);" >> $(INDEX_SCRIPT)
	@echo "            // 2. Filter for actual directories" >> $(INDEX_SCRIPT)
	@echo "            if (fs.statSync(fullPath).isDirectory()) {" >> $(INDEX_SCRIPT)
	@echo "                // 3. Ensure the folder contains the required index.md file" >> $(INDEX_SCRIPT)
	@echo "                return fs.existsSync(path.join(fullPath, 'index.md'));" >> $(INDEX_SCRIPT)
	@echo "            }" >> $(INDEX_SCRIPT)
	@echo "            return false;" >> $(INDEX_SCRIPT)
	@echo "        })" >> $(INDEX_SCRIPT)
	@echo "        .sort((a, b) => b.localeCompare(a)); // Sort posts by folder name (date descending)" >> $(INDEX_SCRIPT)
	@echo "" >> $(INDEX_SCRIPT)
	@echo "    // Output the resulting array as a JSON string" >> $(INDEX_SCRIPT)
	@echo "    console.log(JSON.stringify(slugs, null, 4));" >> $(INDEX_SCRIPT)
	@echo "" >> $(INDEX_SCRIPT)
	@echo "} catch (error) {" >> $(INDEX_SCRIPT)
	@echo "    if (error.code === 'ENOENT') {" >> $(INDEX_SCRIPT)
	@echo "        console.error(\`Error: The directory '\${POSTS_DIR}' was not found. Please create it.\`);" >> $(INDEX_SCRIPT)
	@echo "        console.log('[]');" >> $(INDEX_SCRIPT)
	@echo "    } else {" >> $(INDEX_SCRIPT)
	@echo "        console.error('An unexpected error occurred during index generation:', error.message);" >> $(INDEX_SCRIPT)
	@echo "        console.log('[]');" >> $(INDEX_SCRIPT)
	@echo "    }" >> $(INDEX_SCRIPT)
	@echo "}" >> $(INDEX_SCRIPT)
	# --- END OF EMBEDDED SCRIPT CREATION ---
	@echo "✅ Setup complete."


# Rule for generating the posts/post_list.json file dynamically.
# This rule depends on the $(INDEX_SCRIPT) being created in 'make setup'.
index: $(INDEX_SCRIPT)
	@echo "📜 Generating $(INDEX_FILE)..."
	node $(INDEX_SCRIPT) > $(INDEX_FILE)
	@echo "✅ Index generated successfully."

# --- Development and Serving Rules ---

# Serve the application locally at http://localhost:8000
serve:
	@echo "🌍 Serving SPA at http://localhost:8000"
	@echo "Press Ctrl+C to stop the server."
	$(SERVE_COMMAND)

# Rule for cleaning up generated files.
clean:
	@echo "🗑️ Cleaning up generated files..."
	rm -f $(INDEX_FILE)
	rm -f $(INDEX_SCRIPT)
	rmdir $(POSTS_DIR) 2>/dev/null || true
	rmdir scripts 2>/dev/null || true
	@echo "Done."

# Display help information
help:
	@echo "--- Blog SPA Makefile Commands ---"
	@echo "make all     : setup environment, generate index, and serve the site (default)."
	@echo "make setup   : Creates directories and generates the index script ($(INDEX_SCRIPT))."
	@echo "make index   : Dynamically generates $(INDEX_FILE) from $(POSTS_DIR) subfolders."
	@echo "make serve   : Starts a local web server (http://localhost:8000)."
	@echo "make clean   : Removes the generated index file and directories."
	@echo "-----------------------------------"
