# Sixie Yu’s website

A Jekyll site at https://sixie-yu.org, hosted by GitHub Pages.

## Pages and content

- `/` is the blog homepage. `/notes` and `/notes.html` show the same listing.
- `/about` contains the bio and links to `/research` for publications.
- `_data/writing.yml` supplies essay titles, summaries, topics, and links.
- `_layouts/site.html` provides the shared header. There is no footer or contact section.
- `assets/css/editorial.css` supplies the responsive Editorial design and dark mode.
- Local posts use `_layouts/post.html`; their dates appear on the article, not the listing.

Use sentence case for titles. Preserve acronyms and product names such as SOC, GEPA, and PageRank.

The memory-agent essay currently has `preview_only: true`. It appears in development previews but is omitted from production builds. Confirm a publicly accessible Notion URL before removing that flag. Existing published links stay as supplied.

## Local preview on the desktop

Jekyll 4.3.2 is already installed on the desktop. Run:

```sh
cd ~/Dropbox/marsplus.github.io
JEKYLL_ENV=development jekyll serve --host 127.0.0.1 --port 4173 --destination /tmp/sixie-blog-preview --disable-disk-cache
```

To view that server from the laptop, keep this tunnel open in another terminal:

```sh
ssh -N -L 127.0.0.1:4173:127.0.0.1:4173 nanochat-gpu
```

Open http://127.0.0.1:4173. Source edits rebuild automatically. Restart the server after changing `_config.yml`.

## GitHub Pages compatibility

The production workflow uses GitHub’s `jekyll-build-pages` image, which supplies its own Pages dependencies. The desktop’s system Jekyll version differs, so validate production with the same image before publishing:

```sh
./scripts/check-pages-build.sh
```

This creates a static site in `~/.cache/sixie-blog-pages-check` using the official build image. It neither commits nor pushes. Docker must be available. The image version is pinned to the one used by the last successful Pages deployment; update it when the hosting workflow changes.

Keep `CNAME` as `sixie-yu.org`, `url` as `https://sixie-yu.org`, and `baseurl` empty. `build/` and `server/` are old generated copies; the configuration excludes them from new builds. Do not commit generated output.

GitHub currently deploys from `main`. Review local changes before merging or pushing to that branch. Publishing is a separate step from previewing.
