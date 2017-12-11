conSQLite <- dbConnect(RSQLite::SQLite(), dbname="athletes.sqlite")
resultsHandle <- dbGetQuery(conSQLite, "select wt from athletes_table")
d <- fetch(resultsHandle, n=20)

