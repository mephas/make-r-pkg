##******************************************************************************
##
## make R package
## Open in the project
##
##******************************************************************************

library(devtools)
library(pkgdown)
library(roxygen2)
# library(usethis)
# pkg <- as.package("C:/Users/zhouy/Documents/GitHub-Phsoft/tteICE")

# use_gpl_license(version = 3, include_future = TRUE)

#### check the whole package
## main: load pkg document and check pkg
document()
load_all()

# Sys.which("quarto") == ""
# Sys.setenv("_R_CHECK_BUILD_VIGNETTES_" = "false")
check(document = TRUE, vignettes = FALSE,build_args = "--no-build-vignettes")


#### check container
install()

help(package="tteICE")
help("tteICE")
methods(class="tteICE")

# library(tteICE)
example("surv.tteICE")
example("plot.tteICE")
exists("surv.tteICE")
example("surv.tteICE", package = "tteICE")


#### create manual
# system("R CMD build .")
system("R CMD Rd2pdf .")
system("R CMD check --as-cran .")

# devtools::build()
# devtools::check_built(pkg)

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

#### build website
## build github website --> /docs
## build this after installing the pkg


# library(usethis)
## First of the first, install the latest pkg
## run Rmd to create MD
## then, reproduce md based on the revised Rmd
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
library(renv)
renv::update()
renv::snapshot()
renv::status()
renv::restore()

# install.packages("pak")
# pak::pak("mephas/tteICE")


# system2("quarto", args = "--version", stdout = TRUE)

devtools::spell_check()   # review & add accepted words

# R CMD check --as-cran tteICE_1.0.1.tar.gz


#### create website

# Install released version from CRAN
# install.packages("pkgdown")
# Run once to configure your package to use and deploy pkgdown
# usethis::use_pkgdown_github_pages()


# Preview your site locally before publishing
# change MD and then create website
library(pkgdown)
build_site()

# usethis::use_github_actions()          # ensures the workflow exists
# usethis::use_github_actions_badge()    # inserts the badge in README
use_github_action("pkgdown")
# usethis::use_lifecycle()        # adds lifecycle + copies badge images

## check downloads
library(cranlogs)
cran_downloads(packages = "tteICE", when = "last-month")

## add badge into MD
# [![CRAN status](https://www.r-pkg.org/badges/version/tteICE)](https://cran.r-project.org/package=tteICE)
# [![CRAN downloads total](https://cranlogs.r-pkg.org/badges/grand-total/tteICE)](https://cran.r-project.org/package=tteICE)
# [![CRAN downloads last month](https://cranlogs.r-pkg.org/badges/last-month/tteICE)](https://cran.r-project.org/package=tteICE)
