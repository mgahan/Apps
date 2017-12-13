
# Bring in libraries
library(jsonlite)
library(data.table)

# Read in topojson
africa_topojson <- read_json(path="./data/africa.topojson")
#write_json(africa_topojson, path="./data/africa.topojson")

tmp <- africa_topojson$objects[[1]]$geometries
tmpDat <- rbindlist(lapply(1:length(tmp), function(x) as.data.table(tmp[[x]]$properties)), fill=TRUE)

# Read in data
fertility_long_africa <- fread("~/Apps/07_Africa_Map/data/fertility_long_africa.csv")
fertility_long_africa[, Fertility := 1000*Fertility]
#fertility_long_africa[, Year := Year - 1960]
fertility_long_africaMore <- copy(fertility_long_africa)
fertility_long_africaMore[, Year := Year + 54]
fertility_long_africa <- rbindlist(list(fertility_long_africa,fertility_long_africaMore), fill=TRUE)
fwrite(fertility_long_africa, "./data/fertility_long_africa.csv")
