#' @title Plot a summary ROC plot for dtasenssa object
#'
#' @description Plot a single sROC plot
#'
#' @param object The object from function \code{dtasens1} or \code{dtasens2};
#' or a vector of \code{c(u1, u2, t1, t2, r)}
#'
#' @param add Whether to add the plot into an existed plot.
#' Default is \code{FALSE}, to create a new plot.
#'
#' @param roc.col The color of sROC.
#' Default is black.
#'
#' @param roc.lty The line type of sROC.
#' Default is solid.
#'
#' @param roc.lwd The line width of sROC.
#' Default is 1.
#'
#' @param add.sum.point Whether to add the summary point in the sROC plot.
#' Default it not the add.
#'
#' @param spoint.pch The type of the point.
#' Default is 19.
#'
#' @param spoint.col The color of the point.
#' Default is black.
#'
#' @param spoint.cex The size of the point.
#' Default is 1.
#'
#' @param xlab The label of x-axis.
#' Default is: 1-specificity.
#'
#' @param ylab The label of y-axis.
#' Default is Sensitivity.
#'
#' @param ... Other augments in function \code{\link{points}} or function \code{\link{curve}}
#'
#' @return sROC plot
#'
#' @importFrom grDevices gray.colors
#' @importFrom graphics curve lines points matplot
#' @importFrom stats qnorm
#'
#' @seealso
#' \code{\link[graphics]{points}},
#' \code{\link[graphics]{curve}},
#' \code{\link{dtametasa.fc}},
#' \code{\link{dtametasa.rc}}.
#'
#' @examples
#'
#' sa1 <- dtametasa.fc(IVD, p = 0.7)
#' sroc.dtametasa(sa1)
#'
#' @export

sroc.dtametasa <- function(object,
                           add = FALSE,
                           roc.col = 1,
                           roc.lty = 1,
                           roc.lwd = 1,
                           add.sum.point = TRUE,
                           spoint.pch = 19,
                           spoint.col = 1,
                           spoint.cex = 1,
                           xlab = "1-specificity",
                           ylab = "Sensitivity",
                           ...) {

  if(inherits(object,"dtametasa")) par.vec <- object$par[c(1,2,4,5)] else {

    if (is.vector(object) & length(object) >= 4) {

      par.vec <- object} else stop("PLEASE INPUT EITHER dtametasa OBJECTS OR A VECTOR OF c(u1, u2, t22, t12)")

  }

  u1  <- par.vec[1]
  u2  <- par.vec[2]
  t22 <- par.vec[3]
  t12 <- par.vec[4]

  roc   <- function(x) plogis(u1 - (t12/t22) * (qlogis(x) + u2))

  curve(roc, xlab = xlab, ylab = ylab, add = add, col = roc.col, lwd =roc.lwd,lty = roc.lty,
        xlim = c(0,1), ylim = c(0,1), ...)

  if(add.sum.point) points(plogis(-u2), plogis(u1), pch = spoint.pch, col = spoint.col, ...)


}


