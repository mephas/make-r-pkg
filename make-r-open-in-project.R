##******************************************************************************
##
## make R package
## Open in the project
##
##******************************************************************************

library(devtools)
library(roxygen2)
library(usethis)
library(pkgdown)

# pkg <- as.package("C:/Users/zhouy/Documents/GitHub-Phsoft/ICHe9r1/")

# use_gpl_license(version = 3, include_future = TRUE)

## main: load pkg document and check pkg
document()
load_all()
check(document = T, vignettes = F,build_args = "--no-build-vignettes")

system("R CMD build C:/Users/zhouy/Documents/GitHub-Phsoft/ICHe9r1")

system("R CMD Rd2pdf . --title='ICHe9r1.pdf'")

# Sys.setenv(TZ = "UTC")

## create documents --> need manual revision
# use_readme_rmd()
# use_news_md()



## load data --> /data
# dat <- load("data/bmt.rda")
# use_data(bmt, overwrite = TRUE)
# use_package("DT")
# use_package("psych", type = "Depends")
# use_package("cmprsk", type = "Depends")


## build github website --> /docs
build_readme()
build_site()
build_news()
# use_build_ignore("docs")


## build vignette --> /doc
# use_vignette("ICHer91")
# build_vignettes()
# vignette(pkgdown::metadata)

## check and update environment
## https://rstudio.github.io/renv/articles/renv.html
# library(renv)
# renv::update()
# renv::snapshot()
# renv::status()
# renv::restore()
