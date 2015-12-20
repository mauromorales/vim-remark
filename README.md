# vim-remark
Generate [remarkjs](http://remarkjs.com) slides from your markdown files.

If like me you enjoy using remarkjs to give presentations but don't want to edit
html files in order to update the information in the slides. Then you will enjoy
using `vim-remark`.

This plugin helps you separate content from style when creating or updating
markdown slides.

## Requirements

  * Vim compiled with Ruby support
  * xdg-open
  * Markdown must follow [remarkjs conventions](https://github.com/gnab/remark/wiki/Markdown)

## Installing

Via [Vundle](https://github.com/VundleVim/Vundle.vim): `Plugin 'mauromorales/vim-remark'`

## Using vim-remark

While editing a markdown have two commands:

  * `:RemarkBuild` will create a file based on the html layout and the content
    in the file currently being edited. It will be named after the file you are
    editing but with an html extension.
  * `:RemarkPrview` will run RemarkBuild and then open the html file in your
    browser.

## Using a different layout

If you don't like the default layout just create a file with your desired layout
inside the folder where your markdown slides are located.  Call it
`layout.html.erb` and place this: `<%= @markdown %>` where you want your content
to be displayed.

## Contributing

You can contribute to `vim-remark` by opening issues in github or forking and
submitting pull requests.

## License

`vim-remark` is licensed under the MIT license.

## Contact

If you have any questions, comments or issues running `vim-remark` either open
a github issue or send me an email to <contact@mauromorales.com>.
