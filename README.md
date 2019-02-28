# react-color Shiny input

This example demonstrates creating a [Shiny
input](https://shiny.rstudio.com/articles/building-inputs.html) wrapper around
the [react-color](https://github.com/casesandberg/react-color) library.

# Building

Because this package includes JavaScript source code that requires a compilation
step, package installation is in two phases: JavaScript tools build the
JavaScript, and R tools build and install the package. The R package includes
the built JavaScript files in the `inst/` directory.

## JavaScript Build Requirements

Building JavaScript should work on macOS, Linux, and Windows. The following
tools are necessary regardless of your platform:

- [Node.js](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/en/)

## R Build Requirements

You should install the `reactR` package if you haven't, as this widget depends
on it.

## Development Workflow

After you've installed Node.js and Yarn, run the following command to resolve
and download dependencies:

```
yarn install
```

Now, run `yarn` to build `www/colorpicker/colorpicker/colorpicker.js`:

```
yarn run webpack --mode=development
```

> To run `yarn webpack` automatically whenever sources change, use the command
> `yarn run webpack --watch`

Now that the JavaScript is built, you can install the R package:

```
devtools::document()
devtools::install()
```

Finally you can try the example app by running [app.R](app.R).
