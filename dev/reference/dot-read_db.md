# Reads in parameter library from JSON

Read epidemiological parameter database from JSON using
[`jsonlite::read_json()`](https://jeroen.r-universe.dev/jsonlite/reference/read_json.html)
and returns the list with a `<epiparameterDB>` class attribute to
validate it has been read using this function.

## Usage

``` r
.read_db()
```

## Value

`list`.
