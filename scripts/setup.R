install.packages("Rcpp", dependencies=TRUE)
options(repos=c(
            inlabruorg = "https://inlabru-org.r-universe.dev",
            INLA = "https://inla.r-inla-download.org/R/testing",
            CRAN = "https://cran.rstudio.com"))
install.packages("fmesher")
install.packages("INLA",repos=c(getOption("repos"),INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)
