% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotFluxHist.R
\name{plotFluxHist}
\alias{plotFluxHist}
\title{Graph of annual flux and flow normalized flux versus year}
\usage{
plotFluxHist(eList, yearStart = NA, yearEnd = NA, flowNormYears = "all",
  waterYear = TRUE, fluxUnit = 9, fluxMax = NA, printTitle = TRUE,
  plotFlowNorm = TRUE, tinyPlot = FALSE, col = "black",
  col.pred = "green", cex = 0.8, cex.axis = 1.1, cex.main = 1.1,
  lwd = 2, customPar = FALSE, ...)
}
\arguments{
\item{eList}{named list with at least the Daily and INFO dataframes}

\item{yearStart}{numeric is the calendar year containing the first estimated annual value to be plotted, default is NA (which allows it to be set automatically by the data)}

\item{yearEnd}{numeric is the calendar year just after the last estimated annual value to be plotted, default is NA (which allows it to be set automatically by the data)}

\item{flowNormYears}{vector of flow years}

\item{waterYear}{logical. Should years be water years (\code{TRUE}) or calendar years (\code{FALSE})}

\item{fluxUnit}{number representing entry in pre-defined fluxUnit class array. \code{\link{printFluxUnitCheatSheet}}}

\item{fluxMax}{number specifying the maximum value to be used on the vertical axis, default is NA (which allows it to be set automatically by the data)}

\item{printTitle}{logical variable if TRUE title is printed, if FALSE title is not printed (this is best for a multi-plot figure)}

\item{plotFlowNorm}{logical variable if TRUE the flow normalized line is plotted, if FALSE not plotted}

\item{tinyPlot}{logical variable, if TRUE plot is designed to be plotted small, as a part of a multipart figure, default is FALSE}

\item{col}{color of points on plot, see ?par 'Color Specification'}

\item{col.pred}{color of flow normalized line on plot, see ?par 'Color Specification'}

\item{cex}{numerical value giving the amount by which plotting symbols should be magnified}

\item{cex.axis}{magnification to be used for axis annotation relative to the current setting of cex}

\item{cex.main}{magnification to be used for main titles relative to the current setting of cex}

\item{lwd}{number line width}

\item{customPar}{logical defaults to FALSE. If TRUE, par() should be set by user before calling this function 
(for example, adjusting margins with par(mar=c(5,5,5,5))). If customPar FALSE, EGRET chooses the best margins depending on tinyPlot.}

\item{\dots}{arbitrary graphical parameters that will be passed to genericEGRETDotPlot function (see ?par for options)}
}
\description{
The annual results reported are for a specified "period of analysis" which can be 
an entire water year, a calendar, a season or even an individual month. 
The user specifies this period of analysis in the call to setupYears.

Although there are a lot of optional arguments to this function, most are set to a logical default.

Data come from named list, which contains a Daily dataframe with the daily flow data,
and an INFO dataframe with metadata.
}
\examples{
yearStart <- 2001
yearEnd <- 2010
eList <- Choptank_eList
# Water year:
\dontrun{
plotFluxHist(eList)
plotFluxHist(eList, yearStart, yearEnd, fluxUnit = 1)
plotFluxHist(eList, yearStart, yearEnd, fluxUnit = 'kgDay')
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotFluxHist(eList) 

# Flow normalized (excluding extremes from 2003-04):
yearVector <- c(1980:2002, 2005:2015)
plotFluxHist(eList, flowNormYears=yearVector)

#Alternative:
sampleSegStart <- c(1980,1985,2000)
flowSegStart <- c(1980,1990,2000)
flowSegEnd <- c(1990,2000,2010)
dateInfo <- data.frame(sampleSegStart,
                       flowSegStart,
                       flowSegEnd)
eList1 <- flexFN(eList, dateInfo)
plotFluxHist(eList1)  
flexPlotAddOn(eList1)

}
}
\seealso{
\code{\link{setupYears}}
}
\keyword{graphics}
\keyword{statistics}
\keyword{water-quality}
