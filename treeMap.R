#library
library(treemap)
#setting working directory
setwd("~/INGENIERIA_DE_LA_SALUD/4CUARTO/SEGUNDO_CUATRIMESTRE/TFG/CODE/DL_CancerSurvivalPrediction")

#reading pat1 csv
pat1 <- read.csv("pat1.csv")
#pat1$TCGA.19.1787.01 <- pat1$TCGA.19.1787.01-min(pat1$TCGA.19.1787.01)
pat1$freq <- rep(1, nrow(pat1))
#pat1$colors <- rainbow(nlevels(pat1$TCGA.19.1787.01))[pat1$TCGA.19.1787.01]

# treemap
png(filename="prueba3.png")
par(bty = 'n') 
treemap(pat1[seq(1,1900),],
        index=c("Functional.Annotation.Subgroup","Functional.Annotation","geneName"),
        vSize="freq",
        #type="value",
        vColor="TCGA.19.1787.01",
        sortID = "TCGA.19.1787.01",
        fontsize.labels = 0,
        border.lwds = 0,
        position.legend = "none",
        fontsize.title = 0,
        aspRatio = 1,
        type="value",
        palette="RdYlBu",
        frame.plot=FALSE
)

dev.off()


library(plyr)
counts <- ddply(pat1, .(pat1$Functional.Annotation.Subgroup, pat1$Functional.Annotation), nrow)
colnames(counts) <- c("sub", "annot", "freq")

b =treemap(counts,
           index=c("sub","annot"),
           vSize="freq",
           type="index",
           #fontsize.labels = 0,
           border.lwds = 0,
           position.legend = "none",
           fontsize.title = 0
)

########## BRCA AND NON BRCA ########################

#library
library(treemap)
#setting working directory
setwd("~/INGENIERIA_DE_LA_SALUD/4CUARTO/SEGUNDO_CUATRIMESTRE/TFG/CODE/DL_CancerSurvivalPrediction")

#reading pat_brca csv
pat_brca <- read.csv("pat_brca.csv")

#adding freq for each gene; all genes have freq = 1
pat_brca$freq <- rep(1, nrow(pat_brca))

# treemap
png(filename="pr_brca.png")
par(bty = 'n') # reduce white background around plot in png image
treemap(pat_brca,
        index=c("Functional.Annotation.Subgroup","Functional.Annotation","geneName"),
        vSize="freq",
        vColor="TCGA.3C.AAAU.01_BRCA",
        sortID = "order",
        fontsize.labels = 0,
        border.lwds = 0,
        position.legend = "none",
        fontsize.title = 0,
        aspRatio = 1,
        type="value",
        palette="RdYlBu",
        frame.plot=FALSE
)

dev.off()

#reading pat_non_brca csv
pat_non_brca <- read.csv("pat_non_brca.csv")

#adding freq for each gene; all genes have freq = 1
pat_non_brca$freq <- rep(1, nrow(pat_non_brca))

# treemap
png(filename="pr_non_brca_2.png")
par(bty = 'n') # reduce white background around plot in png image
treemap(pat_non_brca,
        index=c("Functional.Annotation.Subgroup","Functional.Annotation","geneName"),
        vSize="freq",
        vColor="TCGA.02.0047.01_NON_BRCA",
        sortID = "order",
        fontsize.labels = 0,
        border.lwds = 0,
        position.legend = "none",
        fontsize.title = 0,
        aspRatio = 1,
        type="value",
        palette="RdYlBu",
        frame.plot=FALSE
)

dev.off()
