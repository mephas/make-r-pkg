##******************************************************************************
##
## make R package
##
##******************************************************************************


library(usethis)
use_readme_rmd()
usethis::use_news_md()


## load data
dat <- load("data/dat.RData")
use_data(dat, overwrite = TRUE)

# IVD <- read.csv("../../GitHub/dtametasa-r/example-results/data-IVD.csv")

# Scheidler <- Scheidler[,-1]
use_data(dat, overwrite = TRUE)
# use_data(Scheidler, overwrite = TRUE)
# source("R/data.pre.R")
# IVD_2 <- .logit.data(.correction(IVD))
# Scheidler2 <- logit.data(correction(Scheidler))
# use_data(IVD_2, overwrite = TRUE)
# use_data(Scheidler2, overwrite = TRUE)

# use_data(CD64)
# CD64_2 <- .logit.data(.correction(CD64))
# use_data(CD64_2)
use_package("survival")



#build_news("../DTAsens/")



##******************************************************************************
##
## dtametasa PKG
##
##******************************************************************************


library(devtools)
library(roxygen2)
library(usethis)
#library(mathjaxr)
# vignette_roclet()
# devtools::document()


# pkg <- as.package("C:/Users/zhouy/Documents/Gitee-PKU/CSTE/CSTE-main/CSTE-main/")
pkg <- as.package("C:/Users/zhouy/Documents/GitHub-Phsoft/ICHe9r1/")

##***********
document(pkg)
load_all(pkg)
check(pkg, document = FALSE, vignettes = FALSE)
##***********

devtools::build_readme(pkg)

pkgdown::build_site()

pkgdown::build_news()

usethis::use_vignette("ICHer91")


##******************************************************************************
##
## net.meta PKG
##
##******************************************************************************

library(devtools)
library(roxygen2)
pkg <- as.package("../ICHe9r1/")

load_all(pkg)
document(pkg)
load_all()
check(document = FALSE, vignettes = FALSE)

library(pkgdown)


build_site()

update(dev_package_deps(dependencies=TRUE))



renv::init()
