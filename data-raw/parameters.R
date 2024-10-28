usethis::use_data(parameters, overwrite = TRUE)

## code to prepare `parameters` dataset goes here

epiparameterDB <- epiparameterDB:::.read_db()
usethis::use_data(
  epiparameterDB,
  overwrite = TRUE,
  version = 3
)
