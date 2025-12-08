# Javi Jiménez Personal Blog

A Jekyll-powered blog using the Chirpy theme, customized with a "Stellar" subtheme and hosted on GitHub Pages.

## Features

- **Jekyll Static Site Generator** - Built for GitHub Pages
- **Responsive Design** - Beautiful on all devices
- **Dark Theme** - Modern space-inspired color scheme
- **Markdown Posts** - Easy to write and maintain
- **SEO Optimized** - Built-in Jekyll SEO tag support
- **Automated Deployment** - GitHub Actions workflow included

## Quick Start

### Local Development

1. **Install Ruby** (3.2+ recommended)
   - macOS: `brew install ruby`
   - Ubuntu: `sudo apt-get install ruby-full`
   - Windows: Download from [ruby-lang.org](https://www.ruby-lang.org)

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Serve locally**
   ```bash
   bundle exec jekyll serve
   ```
   Site will be available at `http://localhost:4000`

### Creating Posts

Posts go in the `_posts/` directory with the format: `YYYY-MM-DD-title.md`

Example post structure:
```markdown
---
layout: post
title: "My First Post"
date: 2025-12-08 10:30:00 +0100
author: "Your Name"
excerpt: "A brief description of your post"
---

Your content here...
```

### Configuration

Most configuration is done in `_config.yml`. For theme-specific options like navigation and social links, refer to the Chirpy theme documentation.

## Directory Structure

```
.
├── _posts/              # Blog posts
├── _layouts/            # Page templates
├── assets/css/          # Stylesheets
├── _config.yml          # Jekyll configuration
├── Gemfile              # Ruby dependencies
├── index.md             # Homepage
└── README.md            # This file
```

## Deployment

The site automatically deploys to GitHub Pages when you push to the `main` branch. The GitHub Actions workflow (`.github/workflows/jekyll.yml`) handles the build and deployment.

### Manual Deployment Steps

1. Push changes to the `main` branch:
   ```bash
   git add .
   git commit -m "Update content"
   git push origin main
   ```

2. GitHub Actions will automatically:
   - Build the Jekyll site
   - Generate static HTML
   - Deploy to GitHub Pages

Your site will be live at: `https://javi-jimenez.github.io`

## Customization

### Styling

Main styles are in `assets/css/style.css`. Key CSS variables:

```css
--color-primary: #8cc6ff      /* Blue */
--color-secondary: #ffb087    /* Orange */
--color-text: #f0f0f0         /* Light text */
--color-background: #15152a   /* Dark blue background */
```

### Layouts

- `_layouts/default.html` - Base layout with header/footer
- `_layouts/home.html` - Homepage with post list
- `_layouts/post.html` - Individual post pages

## Troubleshooting

### Build fails locally

```bash
# Update gems
bundle update

# Clear cache
rm -rf .jekyll-cache/
rm -rf _site/

# Try again
bundle exec jekyll serve
```

### Posts not showing up

- Ensure filename format: `YYYY-MM-DD-title.md`
- Check post has YAML front matter (between `---`)
- Verify date is not in the future
- Rebuild site with `bundle exec jekyll build`

## License

MIT License - Feel free to use this template for your own blog!

there is no manual post listing.
posts listing must be dynamic, allowing to add or remove posts and they are detected.

images are in the same directory as the posts.
the images link in the post is relative to the place where the file index.md is.

show posts in a grid in the main page.
the main page have to have a top frame with images from pleiades and andromeda.
the background is lightly referring stars.

handle cases where href is not a string.
add date validation and fallback formatting

in the post image preview, show as image the first image found in the post, if there are no images, show a random tech icon or emoji.
if it is defined an image in the frontmatter as image preview for the post use it.

parse markdown before showing the post preview in the main page.
Show only parsed text in the post text preview field in the main page.

do your own test before delivering the release to me.

hardcoded parameters, must go in variables. See what is hardcoded and put it in parameters.

The theme for the blog is: andromeda, pleyades, Spain, and Europe.

Fetch the metadata from site-metadata.json.
