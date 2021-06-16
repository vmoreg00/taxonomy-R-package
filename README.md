# title of the project
# Author

# Input description:

Data must be stored in a provided `xls` template that is composed by three
sheets: `FEATURES`, `TAXONOMY` and `VARIABLES`.

  * `FEATURES`: Is the taxonomic features dataset itself. The first
    column contains the ID of the individual, while the others are the
    measured characteristics. [Note that the header must match with the
    `VARIABLE` sheet]. This sheet can be fullfilled in three possible formats:
    * ***Raw values***: The best option for working in taxonomy in
      which each row contains the information of only one individual.
    * ***Ranges***: This is a kind of dataset that is very frequent
      in taxonomical publications: it only contain maximum,
      minimum and outlyiers for each feature of each species.
      For the purpose of this package, only maximum and minimum
      values are allowed (omit outlyiers) in the format `min-max`.
    * ***Averages & deviations***: other common dataset
      in taxonomic literature and databases that only contains
      the information of the mean and standard deviation of
      each feature in each species. The allowed format is
      `mean;sd`.
  * `TAXONOMY`: This table contains the taxonomic information
    of each `FEATURES` entry. Thus, the number of rows of
    `TAXONOMY` is the same as the number of rows of `FEATURES`
    and the `ID` column must match.
  * `VARIABLE`: It contains the necessary information of the variables
    (name used in `FEATURES`, real variable name, measure units, description).
    The number of rows of `VARIABLE` table must be the same as the number
    of feature columns in `FEATURES` (`ID` column excluded), and the names
    must match.

# possible functions:
  * **Para inputs**:
    * Simular distribución de datos para generar rangos en función de medias y desviaciones
    * Dividir datasets de rangos en max y min

  * **Previos al análisis**
    * Seleccionar las mejores varialbes (factoextra::catdes)... pueden utilizarse algoritmos de selección de
      variables propios de aprendizaje supervisado
    * Gráficos de variables

  * **Para el análisis**
    * Diferenciar grupos por rangos no solapantes
    * Diferenciar grupos en función de LDA
    * Función que lo haga todo (pipeline)

  * **Representación**
    * Clave dicotómica: tex; pdf; html; ¿word?

  * **Possible shinny apps**
    * A shiny app for non-expert R users can be provided
