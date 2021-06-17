\name{create_template}
\alias{create_template}

\title{
Template creation for taxonomical features data
}
\description{
Create a \code{xls} template to handle taxonomical data and morfological
features
}
\usage{
create_template(path=".")
}
\arguments{
  \item{path}{
    Path where the template \code{template.xls} is saved.
  }
}
\details{
The \code{xls} file contains three sheets:
\itemize
  \item{\bold{\code{FEATURES}}}{
  Stores the measured variables (absolute measures, relative measures,
  color, habitat, host, etc.). It can be in \bold{raw}, \bold{range} or 
  \bold{average} format. The first column must be \code{ID}.
  }
  \item{\bold{\code{TAXONOMY}}}{
  Stores the taxonomic position. \code{ID} column must have the same
  entries than \code{ID} column in \code{FEATURES}.
  }
  \item{\code{VARIABLES}}{
  Stores the information of the variables used in \code{FEATURES}. Names
  must agree.
  }
}
\author{
V. Moreno-González (\email{vmorg@unileon.es}).
}
\examples{
create_template()
