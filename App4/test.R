
library(jsonlite)

state_json <- jsonlite::read_json("./data/states.json")
state_json[[1]]$objects$stdin$geometries[[14]]$properties
