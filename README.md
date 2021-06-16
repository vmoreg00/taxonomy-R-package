# title of the project
# Author

# Input description:
  * Features:
    * **Raw values**: The best option for working in taxonomy.
      This kind of datasets will be `matrix` or `data.frame` objects
      in which the first column contain the ID of the individual
      and the rest will correspond with the measured features.
    * **Ranges**: This is a kind of datasets that are very frequent
      in taxonomical publications. They only contain maximum,
      minimum and outlyiers. For the purpose of this package,
      this dataset will have a very similar structure as
      the `raw values` dataset: the firs column contain the
      ID of the species (even the scientific name), and
      the rest of them are the features (min - max; no outliers allowed)
    * **Averages +- deviations**: other common dataset
      in taxonomic literature and databases. The structure
      is the same as in `ranges` dataset, but with
      the format (mean; sd).
  * **Taxonomic position**: Table with the taxonomic positions
    of each row of the features table. It has the same number
    of rows.
  * **Variable description**:
    Table containing --in rows-- the name of the variable
    used in the features table, the real name of the variable,
    the units, and a brief description.

All data must be labelled
Maybe it is advisable to include a template excel file

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
