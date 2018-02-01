## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()

pax.wrangle <- read_csv('data/installed-packages.csv')

## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
## apt <- ipt %>%
##  filter(LibPath == .libPaths()[1]) %>%
##  select(Package, Built)

# which is my default library?
.Library

pax.wrangle <- pax.wrangle %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)


## write this new, smaller data frame to data/add-on-packages.csv
write_csv(pax.wrangle, 'data/add-on-packages.csv')


## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
## apt_freqtable <- apt %>%
##  count(Built) %>%
##  mutate(prop = n / sum(n))
pax.wrangle.freq <- pax.wrangle %>%
  count(Built) %>%
  mutate(proportion = round(n / sum(n), digits = 2))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples
write_csv(pax.wrangle.freq, 'data/add-on-packages-freqtable.csv')

## when this script works, stage & commit it and the csv files
## PUSH!
