# Created by: V. Moreno-González <vmorg@unileon.es>
# Creation date: 2021-06-16
# Modification date: 2021-06-16
# Last commit: creation. IT IS A DRAFT !!!
# TO-DO list: - think if i want s3 or s4 object....
#             - Develop all functions.
#             - Create function documentation

# I/O functions ===============================================================
guess_type <- function(x){
  # type <- raw | range | avg-sd
}
split_min_max <- function(x){
  # returns a 3d array; the first is min the second is max
}
split_mean_sd <- function(x){
  # returs a 3d array; the first is the mean; the second is the sd
}

read_features <- function(path, type){
  features <- readxl::read_excel(path = path, sheet = "FEATURES")
  taxonomy <- readxl::read_excel(path = path, sheet = "TAXONOMY")
  variables <- readsl::read_excel(path = path, sheet = "VARIABLES")
  
  # Compatibility checks:
  ## nrow(features) == nrow(taxonomy)
  ## ncol(variables) == (ncol(features)-1)
  ## all(colnames(features)[-1] %in% variables$var) ......... 
  ####  Else: If there are more variables in variables; remove as needed (with WARNING);
  ####        Else raise error
  ## all(features$ID %in% taxonomy$ID) ......................
  ####  Else: If there are more IDs in taxonomy, remove as needed (with WARNING);
  ####        Else: raise error
  ## Think about a "force" argument to remove all non-coincident variables and
  ## entries and only raise a warning
  if(missing(type)){
    # type <- guess_type(features)
  } else if(! type %in% c("raw", "range", "avg-sd")){
    # # Raise error
  }
  
  if(type == "range"){
    # split_min_max
  } else if(type == "avg-sd"){
    # split_mean_sd
  }
  
  # Construct the taxo-featuers object
  taxo-features <- list(features = features,
                        taxonomy = taxonomy,
                        variables = variables,
                        features_type = type)
  class(taxo-features) <- "taxo-features"
  
  return(taxo-features)
}

# METHODS drafts ==============================================================
plot.taxo-features <- function(x){
  # Plot different plots depending on features_type:
  ## For features_type == raw: boxplots
  ## For features_type == range: modified boxplots
  ## For features_type == avg-sd: dotplots with error bars
}

print.taxo-features <- function(x){
  # Prints tha taxo-features
}

summary.taxo-features <- function(x){
  # Prints a summary of the taxo-feature object
}