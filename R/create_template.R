# Created by: V. Moreno-González <vmorg@unileon.es>
# Creation date: 2021-06-16
# Modification date: 2021-06-16
# Last commit: creation. IT IS A DRAFT !!!
# TO-DO list: - test
#             - Create function documentation

create_template <- function(path){
  features <- data.frame(ID = c(1:10),
                         V1 = rep("", 10),
                         V2 = rep("", 10),
                         V3 = rep("", 10))
  taxonomy <- data.frame(ID = c(1:10),
                         tax.range1 = rep("", 10),
                         tax.range2 = rep("", 10),
                         tax.range3 = rep("", 10))
  variables <- data.frame(var = c("V1", "V2", "V3"),
                          var.name = c("variable 1", "variable 2", "variable 3"),
                          units = c("mm", "µm", "times"),
                          description = rep("", 3))
  template <- list(FEATURES = features,
                   TAXONOMY = taxonomy,
                   VARIABLES = variables)
  template_wb <- openxlsx::createWorkbook()
  for(i in seq_along(template)){
    openxlsx::addWorksheet(wb = template_wb, sheetName = names(template)[i])
    openxlsx::writeData(wb = template_wb, sheet = i,
                        template[[i]])
  }
  openxlsx::saveWorkbook(wb = template_wb, file = path)
  
  cat("\n", rep("*", 80), sep = "")
  cat("\nTEMPLATE CREATION")
  cat("\n", rep("*", 80), sep = "")
  cat("\n")
  cat("\nTemplate has been created and stored in", path)
  cat("\nREMEMBER")
  cat("\n\t-> Number of rows of FEATURES and TAXONOMY must be the same")
  cat("\n\t-> IDs of FEATURES and TAXONOMY must match")
  cat("\n\t-> Number of rows of VARIABLES must be the same as number of columns in FEATURES (ID excluded)")
}
