##******************************************************************************
##
## make R package
##
##******************************************************************************


library(usethis)
use_readme_rmd()
usethis::use_news_md()

CD64 <- read.csv("../../GitHub/dtametasa-r/example-results/data-CD64.csv")
IVD <- read.csv("../../GitHub/dtametasa-r/example-results/data-IVD.csv")

# Scheidler <- Scheidler[,-1]
use_data(IVD, overwrite = TRUE)
use_data(Scheidler, overwrite = TRUE)
# source("R/data.pre.R")
IVD_2 <- .logit.data(.correction(IVD))
Scheidler2 <- logit.data(correction(Scheidler))
use_data(IVD_2, overwrite = TRUE)
use_data(Scheidler2, overwrite = TRUE)

use_data(CD64)
CD64_2 <- .logit.data(.correction(CD64))
use_data(CD64_2)
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
pkg <- as.package("../net.meta/")

##***********
document(pkg)
load_all(pkg)
check(document = FALSE, vignettes = FALSE)
##***********

devtools::build_readme()

pkgdown::build_site()

pkgdown::build_news()



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
