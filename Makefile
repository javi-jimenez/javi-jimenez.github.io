# Jekyll Blog Makefile
# Development commands for the Jekyll site

.PHONY: all help install build serve clean rebuild watch

# Default command: build the site from a clean state
all: rebuild

# Display help information
help:
	@echo "=== Jekyll Blog Makefile Commands ==="
	@echo ""
	@echo "Development:"
	@echo "  make install    - Install Ruby dependencies (bundle install)"
	@echo "  make serve      - Build and serve locally at http://localhost:4000"
	@echo "  make build      - Build the static site (_site directory)"
	@echo "  make watch      - Watch for changes and rebuild automatically"
	@echo ""
	@echo "Maintenance:"
	@echo "  make rebuild    - Clean and rebuild the site"
	@echo "  make clean      - Remove generated _site directory"
	@echo ""
	@echo "=== Quick Start ==="
	@echo "  1. make install"
	@echo "  2. make serve"
	@echo "  3. Open http://localhost:4000 in your browser"
	@echo ""

# Install dependencies
install:
	@echo "📦 Installing Ruby gems..."
	bundle install
	@echo "✅ Dependencies installed"

# Serve the site locally with auto-reload
serve:
	@echo "🚀 Starting Jekyll development server..."
	@echo "📍 Site available at http://localhost:4000"
	@echo "🔄 Auto-reloading enabled - changes will appear automatically"
	@echo "⏹️  Press Ctrl+C to stop"
	@echo ""
	bundle exec jekyll serve --livereload --livereload-port 35730

# Build the site
build:
	@echo "🔨 Building Jekyll site..."
	bundle exec jekyll build
	@echo "✅ Build complete - output in _site/"

# Watch for changes and rebuild
watch:
	@echo "👁️  Watching for changes..."
	@echo "⏹️  Press Ctrl+C to stop"
	bundle exec jekyll build --watch

# Clean up generated files
clean:
	@echo "🗑️  Cleaning up generated files..."
	rm -rf _site
	rm -rf .jekyll-cache
	rm -rf .jekyll-metadata
	@echo "✅ Cleanup complete"

# Rebuild from scratch
rebuild: clean build
	@echo "✅ Site rebuilt from scratch"
