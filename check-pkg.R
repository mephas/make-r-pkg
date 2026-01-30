##******************************************************************************
##
## make R package
## Open in the project
##
##******************************************************************************

library(devtools)
library(pkgdown)
library(roxygen2)

# pkg <- as.package("C:\\Users\\zhouy\\Documents\\GitHub-Phsoft\\pkg\\tteICE")

# check(document = TRUE, vignettes = FALSE,build_args = "--no-build-vignettes")


#### create manual

# system("R CMD Rd2pdf .")
#
## source package path (outside the package)
setwd("C:\\Users\\zhouy\\Documents\\GitHub-Phsoft\\pkg")


system("R CMD check --as-cran tteICE")
devtools::check("tteICE")

# devtools::build()
# devtools::check_built("C:\\Users\\zhouy\\Documents\\GitHub-Phsoft\\pkg\\tteICE_1.1.0.tar.gz")

system("R CMD build tteICE")
system("R CMD check tteICE_1.1.0.tar.gz")

library(spelling)
setwd("~/GitHub-Phsoft/pkg/tteICE")
spelling::spell_check_package()
# get_wordlist()
update_wordlist()
desc::desc_validate()
spelling::spell_check_text(readLines("DESCRIPTION"))
