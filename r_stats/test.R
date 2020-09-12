# installed 
# remotes::install_github("r-dbi/RPostgres")

# run with: Rscript test.R
library(DBI)
# Connect to a specific postgres database i.e. Heroku
cat("# # # Connecting to Database \n" )
con <- dbConnect(RPostgres::Postgres(),dbname = 'angio_dev', 
                 host = 'localhost', 
                 port = 5432, # or any other port specified by your DBA
                 user = 'postgres',
                 password = 'postgres') 

cat("# # # Listing Tables \n")
#dbListTables(con) 
# Create a vector. 
#x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find Mean.
#result.mean <- mean(x)
#print(result.mean) 

#defs <- dbSendQuery(con, "SELECT name FROM definitions")
#dbFetch(defs)

#dbClearResult(defs)
#library()

#dbReadTable(con, name="definitions")
library(shiny)
runExample("01_hello") 
