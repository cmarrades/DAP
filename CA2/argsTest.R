#define funcs

days <- 5 
args = commandArgs(trailingOnly = TRUE)
if (length(args) != 0)
{
  print("1 arg")
  days <- args[1]
}

print (days)
