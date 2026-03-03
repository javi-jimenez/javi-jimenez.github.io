Third-Party Notices
===================

This project contains or references third-party components, libraries, and assets.
This file summarizes notable licenses and sources that apply to those components.

Included third-party items (non-exhaustive):

- `assets/js/dist/*.min.js` — these bundled scripts include headers that indicate "MIT Licensed".
  Keep the original license headers in place. If you redistribute modified bundles, preserve
  the original license notices.

- Fonts and icons:
  - See `assets/images/favicons/about.txt` which references font licensing (SIL Open Font License, 1.1).
  - Some fonts are loaded from Google Fonts via CSS `@import`; verify each font's upstream license
    when redistributing fonts locally.

- External CDN libraries referenced by `index.html`:
  - `marked` (Markdown parser) — included via jsDelivr. Verify upstream license before local redistribution.
  - `DOMPurify` — included via jsDelivr. Verify upstream license before local redistribution.

Recommendations:

- Do not remove or alter existing third-party license headers in `assets/js/dist/` files.
- If you vendor any external libraries (download them into the repo), include their license files
  alongside the vendored code.
- If you plan to redistribute fonts or other media, make sure to comply with the original font/media licenses.

If you want, I can generate a more detailed `THIRD_PARTY_NOTICES.md` by scanning all files and
inlining license headers and links for each third-party file found in the repository.
