##******************************************************************************
##
## make R package
##
##******************************************************************************


library(usethis)
use_readme_rmd()

load("../meeting/Data(application)/rdata.RData")
Scheidler <- Scheidler[,-1]
use_data(IVD, overwrite = TRUE)
use_data(Scheidler, overwrite = TRUE)
source("R/data.pre.R")
IVD2 <- logit.data(correction(IVD))
Scheidler2 <- logit.data(correction(Scheidler))
use_data(IVD2, overwrite = TRUE)
use_data(Scheidler2, overwrite = TRUE)


use_package("mvtnorm")



#build_news("../DTAsens/")



##******************************************************************************
##
## dtametasa PKG
##
##******************************************************************************


library(devtools)
library(roxygen2)
#library(mathjaxr)
#vignette_roclet()
#devtools::document()


pkg <- as.package("../dtametasa/")

load_all(pkg)
document(pkg)
load_all()
check(document = FALSE, vignettes = FALSE)


devtools::build_readme()
usethis::use_news_md()

library(pkgdown)
build_site()


##******************************************************************************
##
## net.meta PKG
##
##******************************************************************************

library(devtools)
library(roxygen2)
pkg <- as.package("../net.meta/")

load_all(pkg)
document(pkg)
load_all()
check(document = FALSE, vignettes = FALSE)

library(pkgdown)
build_site()

update(dev_package_deps(dependencies=TRUE))