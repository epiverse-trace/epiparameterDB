# Design Principles for {epiparameterDB}

This vignette outlines the design decisions that have been taken during
the development of the
[epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/) R
package, and provides some of the reasoning, and possible pros and cons
of each decision.

This document is primarily intended to be read by those interested in
understanding the code within the package and for potential package
contributors.

## Scope

[epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/)
provides a database of epidemiological parameters available in R. It is
the data component of the
[epiparameter](https://github.com/epiverse-trace/epiparameter/) R
package, and is in a separate R package to appropriately license the
data (stored in this package) and the code for working with
epidemiological parameters (stored in
[epiparameter](https://github.com/epiverse-trace/epiparameter/)).

This R package only exports data, it does not export any R functions. It
contains a few internal functions that are used for data processing and
vignettes.

## Input/Output/Interoperability

The epidemiological parameter database is exported by the package as
[`epiparameterDB::epiparameterDB`](https://epiverse-trace.github.io/epiparameterDB/dev/reference/epiparameterDB.md).
The `epiparameterDB` data object is a list for flexible hierarchical
parameter data.

The raw epidemiological parameter data is stored within this package as
a `.json` file to enable structured and nested data objects and the file
is read into R using
[`jsonlite::read_json()`](https://jeroen.r-universe.dev/jsonlite/reference/read_json.html)
in the
[`.read_db()`](https://epiverse-trace.github.io/epiparameterDB/dev/reference/dot-read_db.md)
internal function.

The `epiparameterDB` data object is then used within the
[epiparameter](https://github.com/epiverse-trace/epiparameter/) package
and converted to a list of `<epiparameter>` objects, with a
`<multi_epiparameter>` class attribute to enable custom methods for
multiple `<epiparameter>` objects. This conversion and class
specification all takes place in
[epiparameter](https://github.com/epiverse-trace/epiparameter/) to
prevent duplicating code across packages and to keep
[epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/) to
remain a minimal and data-focused as possible.

## Design decisions

- The package exports the raw JSON list not a `<multi_epiparameter>`
  formatted object due to the dependencies
  (e.g. [distributional](https://pkg.mitchelloharawild.com/distributional/)
  and [checkmate](https://mllg.github.io/checkmate/)) and
  [epiparameter](https://github.com/epiverse-trace/epiparameter/)
  functions (e.g. `create_prob_distribution()`).

- [`.cite_author()`](https://epiverse-trace.github.io/epiparameterDB/dev/reference/dot-cite_author.md)
  is a simpler version of the internal `.citet()` function in
  [epiparameter](https://github.com/epiverse-trace/epiparameter/). In
  [epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/)
  the parameter database is validated by the `json-validate.yaml`
  workflow so the format is consistent and the individual elements for
  the short citation in the `database.Rmd` vignette can be extracted and
  only the author formatting needs to be packaged into a function.

- the `<epiparameterDB>` class attribute attached to the epidemiological
  parameter list is to ensure the `parameters.json` file has been read
  using
  [`.read_db()`](https://epiverse-trace.github.io/epiparameterDB/dev/reference/dot-read_db.md)
  and suggests the file has not be read or invalidated using other
  functions. It has no role in for object-oriented programming
  (e.g. class methods).

## Dependencies

The [epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/)
package has no imported (i.e. hard) dependencies. It is a data package
and does not require any imported functionality.

There are a handful of suggested (i.e. soft) dependencies. These enable
the data to be read from file and to render the vignettes.

- [`{jsonlite}`](https://CRAN.R-project.org/package=jsonlite): used by
  [`.read_db()`](https://epiverse-trace.github.io/epiparameterDB/dev/reference/dot-read_db.md)
  to load the `parameters.json` parameter library into memory.
- [`{DT}`](https://CRAN.R-project.org/package=DT): used by the
  `database.Rmd` to render a [`DataTables`](https://datatables.net/) on
  the vignette.

There are some additional suggested dependencies for vignette rendering
and testing the package: [knitr](https://yihui.org/knitr/),
[rmarkdown](https://github.com/rstudio/rmarkdown),
[spelling](https://ropensci.r-universe.dev/spelling),
[testthat](https://testthat.r-lib.org).

## Development journey

The data exported in this package was original included in the
[epiparameter](https://github.com/epiverse-trace/epiparameter/) R
package. Due to CRAN regulations, it was not possible to dual license
[epiparameter](https://github.com/epiverse-trace/epiparameter/) with MIT
and CC0 for the code and data respectively. Therefore,
[epiparameterDB](https://github.com/epiverse-trace/epiparameterDB/) is
the data storage and distribution component of the
[epiparameter](https://github.com/epiverse-trace/epiparameter/) project.
