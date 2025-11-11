# Check whether a package is installed

Check whether a package is installed

## Usage

``` r
.is_pkg_installed(package)
```

## Arguments

- package:

  string naming the package/name space to load.

## Value

Invisibly returns a boolean `logical`.

## Details

This functions allows testing for when a suggested package dependency is
not installed to check if conditional code can be run.
