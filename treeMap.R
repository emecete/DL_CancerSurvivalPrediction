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
png(filename="prueba2.png")
treemap(pat1[seq(1,1000),],
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
        palette="RdYlBu"
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


