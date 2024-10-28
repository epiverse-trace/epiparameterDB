{
  db <- .read_db()
}

test_that(".cite_author works as expected for 1 author", {
  expect_identical(.cite_author(db[[27]]), "Pavlin")
})

test_that(".cite_author works as expected for 2 authors", {
  expect_identical(.cite_author(db[[15]]), "Nishiura & Inaba")
})

test_that(".cite_author works as expected for > 2 authors", {
  expect_identical(.cite_author(db[[1]]), "Lessler et al.")
})

test_that(".cite_author works as expected for org author", {
  expect_identical(.cite_author(db[[64]]), "The Ebola Outbreak Epidemiology Team et al.")
})
