% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GSDisplay.R
\name{rowDataPlot}
\alias{rowDataPlot}
\title{The Visualization of Evaluation Result and Data Structure}
\usage{
rowDataPlot(y,show.line = T,barCol = "blue",lineCol = "red")
       rowDataPlot(markers,y,plot.type = "PCA")
       scatterPlot(predmat,x1 ,x2 = ,show.line = F,color_szie = T,make.plotly = F,sizeRange = c(4,6))
       linePlot(evalMat,size = 1)
       barPlot(data,other = "sector")
       heatmapEval <- heatMapDataProcess(x,highBound = 0,lowBound = -30,alpha = 15, basedMethod = "best")
}
\value{
plotd of result
}
\description{
This function is designed for visualization of multiple results of G2P.
}
\examples{
\dontrun{
############# PCA analysis ############
data(GYSS)
G2PCVRes <-  G2PCrossValidation(cross = 10,seed = 1 , cpus = 3, markers = Markers,
pheVal = phenotype, modelMethods = c("BayesA", "BayesB", "BayesC", "BL", "BRR","RR",
                     "RKHS","rrBLUP","LASSO","SPLS","bigRR","SVC","RFC","SVR","RFR"),
outputModel = FALSE)
CVres <- resultsMerge(predList = G2PCVRes)
evalTest <- evaluateGS(realScores = CVres[,1], predScores = CVres[,2:20], 
                      evalMethod = c( "pearson", "kendall","spearman", "RE", "Kappa",
                                      "AUC", "AUCpr", "NDCG", "meanNDCG",
                                      "MSE", "R2", "F1", "accuracy"), topAlpha = 1:90)
### row data visulization
## phenotype distribution  plot
rowDataPlot(y = phenotype,show.line = T,barCol = "blue",lineCol = "red")
## PCA 3-D plot 
htmlwidgets::saveWidget(as_widget(rowDataPlot(markers = Markers,y = phenotype,
                      plot.type = "PCA")), file="3-D_PCA.html",selfcontained=T)

### scatter plot 
scatterPlot(CVres,x1 = "BayesA",x2 = "RFC",show.line = F,color_szie = T,make.plotly = F,
           sizeRange = c(4,6))
### lines plot 
linePlot(evalMat = evalTest$RE,size = 1)
### bar plot 
barPlot(evalTest$corMethosds,other = "sector")
### heat map 
#### pred res heatmap 
heatmapPlot(predmat = CVres,make.plotly = F,col.low = "green",col.high = "red")
#### eval res heatmap 
heatmapEval <- heatMapDataProcess(x = evalTest,highBound = 0,lowBound = -30,alpha = 15,
                                 basedMethod = "best")
heatmapPlot(predmat = heatmapEval,make.plotly = F,col.low = "green",col.high = "red")
}
}
\author{
Chuang Ma, Qian Cheng, Zhixu Qiu, Jie Song
}
\keyword{plot,result}
\keyword{visualization}
