# María del Rocío Cabello Toscano
# 16-05-2019

library(snow)
library(treemap)
start.time <- Sys.time()
print("loading file")
exp_to_tree_map <- read.csv("COMMON_GENES_exp_to_chromosome_tree_map.csv")#
print("file loaded")
end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)

samples_col <- grep("TCGA", colnames(exp_to_tree_map))

maxi <- 15.8823 #max(exp_to_tree_map[,samples_col])
mini <- -9.9658 #min(exp_to_tree_map[,samples_col])

print(ncol(exp_to_tree_map))
print(nrow(exp_to_tree_map))

print(maxi)
print(mini)

exp_generate_treemap <- function(i){
	require(treemap)
	colnams <- colnames(exp_to_tree_map)
	sample <- colnams[samples_col[i]]
    png(filename=trimws(paste("../data/COMMON_GENES_CHR_TREEMAPS/", sample, "_TREEMAP.png")))
    par(bty = 'n') # reduce white background around plot in png image
    treemap(exp_to_tree_map,
        index=c("chromosome","ensId"),
        vSize="tamPixel",vColor=sample,sortID = "order",fontsize.labels = 0,border.lwds = 0,
        position.legend = "none",fontsize.title = 0,aspRatio = 1,type="value",palette="RdYlBu",
        frame.plot=FALSE, mapping = c(mini, (maxi+mini)/2, maxi))
    dev.off()
}
clus <- makeCluster(9)
clusterExport(clus, "exp_to_tree_map")
clusterExport(clus, "samples_col")
clusterExport(clus, "mini")
clusterExport(clus, "maxi")
parSapply(clus,seq(1, length(samples_col)), exp_generate_treemap)
