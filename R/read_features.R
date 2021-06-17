# Created by: V. Moreno-González <vmorg@unileon.es>
# Creation date: 2021-06-16
# Modification date: 2021-06-17
# Last commit: I/O functions developed!
# TO-DO list: - think if i want s3 or s4 object....
#             - Develop methods.
#             - Create function documentation

# I/O functions ===============================================================
guess_type <- function(x){
  cls <- c()
  for(i in 2:ncol(x)){
    cls <- c(cls, class(as.data.frame(x)[,i]))
  }
  if(any(cls == "numeric")){
    return("raw")
  }
  if(length(grep("[0-9]+-[0-9]+", x[1,2])) > 0){
    return("range")
  }
  if(length(grep("[0-9];[0-9]+", x[1,2])) > 0){
    return("avg-sd")
  }
}
split_ds <- function(x, type){
  if(type == "range"){
    split = "-"
    dimnames_z <- c("min", "max")
  } else if(type == "avg-sd"){
    split = ";"
    dimnames_z <- c("avg", "sd")
  } else(
    stop("Non recognised type ", type)
  )
  a <- cbind(x$ID,
             apply(x[,2:ncol(x)], 2, function(x){
               as.numeric(sapply(strsplit(x, split = split), function(y) y[1]))
  }))
  b <- cbind(x$ID,
             apply(x[,2:ncol(x)], 2, function(x){
               as.numeric(sapply(strsplit(x, split = split), function(y) y[2]))
  }))
  x_array <- array(data = c(a, b), dim = c(nrow(x), ncol(x), 2),
                   dimnames = list(rownames(x), colnames(x), dimnames_z))
  return(x_array)
}

read_features <- function(file, type){
  if(!file.exists(file)){
    stop("file ", file, " not found")
  }
  if(missing(type)){
    type <- guess_type(features)
    if(is.null(type)){
      stop("Unable to guess type of FEATURES. Check formats and provide it.")
    }
  } else if(! type %in% c("raw", "range", "avg-sd")){
    stop("type must be one of: raw, range, avg-sd")
  }
  # Read sheets
  features <- as.data.frame(readxl::read_xlsx(path = file, sheet = "FEATURES", trim_ws = T))
  taxonomy <- as.data.frame(readxl::read_xlsx(path = file, sheet = "TAXONOMY", trim_ws = T))
  variables <- as.data.frame(readxl::read_xlsx(path = file, sheet = "VARIABLES", trim_ws = T))
  
  # Compatibility checks
  ## Check for duplicates
  if(any(duplicated(features$ID))){
    stop("There are ", sum(duplicated(features$ID)),
         " duplicated entries FEATURES")
  }
  if(any(duplicated(taxonomy$ID))){
    stop("There are ", sum(duplicated(taxonomy$ID)),
         " duplicated entries FEATURES")
  }
  if(any(duplicated(variables$var))){
    stop("There are ", sum(duplicated(variable$var)),
         " duplicated entries in VARIABLES")
  }
  ## Check for IDs matching
  if(!all(features$ID %in% taxonomy$ID)){
    stop("There are ", sum(!(features$ID %in% taxonomy$ID)),
         " missing entries in TAXONOMY")
  }
  if(!all(taxonomy$ID %in% features$ID)){
    warning(sum(!(taxonomy$ID %in% features$ID)), 
            " TAXONOMY entries are removed")
    taxonomy <- taxonomy[which(taxonomy$ID %in% features$ID), ]
  }
  ## Check for Variable matching
  if(!all(colnames(features)[-1] %in% variables$var)){
    stop("There are ", sum(!(colnames(features)[-1] %in% variables$var)),
         " missing variables in VARIABLES")
  }
  if(!all(variables$var %in% colnames(features)[-1])){
    warning(sum(!(variables$var %in% colnames(features)[-1])), 
            " VARIABLES entries are removed")
    variables <- variables[variables$var %in% colnames(features)[-1], ]
  }
  
  if(type %in% c("range", "avg-sd")){
    features <- split_ds(features, type)
  }
  
  # Construct the taxo-featuers object
  taxo_features <- list(features = features,
                        taxonomy = taxonomy,
                        variables = variables,
                        features_type = type)
  class(taxo_features) <- "taxo-features"
  
  return(taxo_features)
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