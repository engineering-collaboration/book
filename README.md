<p align="center">
  <a href="https://www.engineering-collaboration.io/">
    <img src="https://www.engineering-collaboration.io/assets/logo.png" width="64" alt="Engineering Collaboration">
  </a>
</p>
<br>

The book *Engineering Collaboration* presents a vertical slice of strategies that have proven useful for a broad spectrum of organizations. This brief literary excursion provides the foundation for building an autonomous, flexible, and collaborative environment at the core of our company.

## Roadmap

*Engineering Collaboration* is under heavy development and undergoes continuous editing and restructuring. The main development currently focuses on rewriting the published chapters for coherent tone and interdependency. The additional roadmap for the v1 release currently looks as follows.

- [x] Write *Introduction*
- [x] Write *Part I*
- [x] Write *Part II*
- [ ] Improve website
  - [x] Design landing page
  - [x] Design social cards
  - [ ] Include analytics
- [ ] Rewrite *Part I* (in progress)
- [ ] Rewrite *Part II*

## Running locally

*Engineering Collaboration* is written in Markdown and built to HTML via [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). In order to start working locally, follow the instructions to [install Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/).

Once installed, we create and render a book using `mkdocs serve`. This command automatically detects and hot reloads changes to the Markdown source.

## Contributing

The [contribution guidelines](CONTRIBUTING.md) document strategies regarding prose and successfully integrating changes.

## Versioning

*Engineering Collaboration* follows the [semantic versioning](http://semver.org/) scheme.

- Patches include fixes to orthography, grammar, and punctuation.
- Minor version bumps cover larger edits and new chapters.
- Major version bumps contain changes to the content distribution or dramatic changes to the structure of the book.

## Licensing

*Engineering Collaboration* is licensed under the **CC-BY-4.0** license, please review the [LICENSE file](LICENSE) for further details.

## Built with ❤️ and

- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Flowbite](https://flowbite.com/)
- [vale.sh](https://vale.sh/)

## Helpful commands

```bash
# render and serve book
mkdocs serve

# lint using vale.sh
bash ci/vale.bash

# word count
find ./docs/book/ -type f -exec cat {} + | wc -w

# tailwind
npx tailwindcss -i ./input.css -o ./src/overrides/style.html
```
