test_that(".read_db works as expected when jsonlite is installed", {
  db <- .read_db()
  expect_s3_class(db, class = "epiparameterDB")
  expect_type(db, type = "list")
  expect_length(db, 125)
})


test_that(".read_db fails correctly when jsonlite is not installed", {
  with_mocked_bindings(
    .is_pkg_installed = function(package) FALSE,
    code = expect_error(
      .read_db(),
      regexp =
        "Cannot use this internal function without \\{jsonlite\\} installed" # nolint file.path
    )
  )
})

test_that(".is_pkg_installed works as expected", {
  expect_true(.is_pkg_installed(package = "methods"))
  expect_false(.is_pkg_installed(package = "jsonlit"))
})
