# Sitio Web de Posts Estático

Un sitio web estático elegante para mostrar posts, inspirado en el repositorio de javi-jimenez/posts.

## Características

- Diseño moderno y responsive
- Grid de posts adaptable
- Sistema de categorías y etiquetas
- Efectos de hover en tarjetas
- Código optimizado y semántico

## Estructura

- `index.html` - Página principal
- `posts/` - Directorio para posts individuales (futura expansión)

## Cómo usar

1. Descarga todos los archivos
2. Abre `index.html` en tu navegador
3. Personaliza el contenido según tus necesidades

## Personalización

Puedes modificar fácilmente:
- Colores cambiando las variables CSS en `:root`
- Contenido editando el HTML
- Estilos en la sección `<style>`

## Pasos

Create a complete single-page application (SPA) that loads and displays posts dynamically.
There will be only one file called index.html with all resources self-contained.

generate an index.html for a technical web site blog.
it read posts list in the main page.
the posts are in markdown format
on click on one listed post, post is showed as generated html from the markdown.
make a single page for all.

posts are inside the posts/ directory.
the date preces the post directory name.
posts are named as index.md inside each post directory.
inside the post directory, there is an index.md file.
index.md is the file that has to be rendered as the markdown post.
posts directory name format for the date is: YYYY-MM-DD or YYYY-MM-DD-HH-MM-SS or any variant.
the directory format can not include the HH-MM-SS or any of them.
inside the post directory, posts are named as index.md.
posts have a frontmatter that you do not have to show directly.
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
