#PCA analysis on my weather data



#'''ctqdata <- read.csv("CTQ_FA.csv")
#ctqdatawrangled <- ctqdata %>% 
 # mutate_each(funs(replace(., .<= 0,3))) %>%
 # mutate_each(funs(replace(., .>= 6, 3))) %>%
 # select( -c(1))'''


#'''##cumulative variance explained 
#cumsum(pcacrimedata$values/sum(pcacrimedata$values)
#)'''

#'''scree(crimedata2, fa=F, main= "Figure Two: Scree Plot Question 2")'''

install.packages("readxl")
library("readxl")
library(pacman)
install.packages("ggplot")
#install.packages("ggbiplot")
#library("ggbiplot")
install.packages("rgl")
library(rgl)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("corrplot")
library(corrplot)
install.packages("scatterplot3d")
library(scatterplot3d)
p_load(tidyverse, magrittr, psych, car,sjstats, janitor, patchwork, ggrepel, haven, emmeans, readxl, jtools, Metrics, qwraps2,bda, kableExtra,pwr, sjPlot,rstatix,rio, ggpubr, lme4, skimr, BiocManager, GPArotation)

#install.packages(c("FactoMineR", "factoextra"))
#library("FactoMineR")
#library("factoextra")
#94MHz_RSSI-copy.xlsx
#89MHz_RSSI - Copy (4).xlsx
#DAB_RSSI-copy.xlsx


my_data<- read_excel("DAB_RSSI-copy.xlsx", sheet = 5)
data <- my_data

head(my_data)

col1 <- colorRampPalette(c("#7F0000", "red", "#FF7F00", "yellow", "white",
                           "cyan", "#007FFF", "blue", "#00007F"))

p <- par(xpd=TRUE)

corrmatrix <- cor.plot(my_data[, 1:16], main = "A Correlation Matrix Showing the Correlations Between the Measured Variables", stars = T, show.legend = T)

bartlett.test(data[,1:16])
KMO(corrmatrix)

myPr <- prcomp(my_data[, 1:16], scale = TRUE )#scaling by standard deviation and mean centering
summary(myPr)
biplot(myPr, scale = 0,main = "A Plot of Data Points on the New Principal Component Axes")
str(myPr)
myPr$x

my_data2 <- cbind(my_data, myPr$x)

dev.new(width=10, height=10)
scree(my_data[,1:16], fa=F, main= 'A Scree Plot Describing How Many Principal Components Are Needed')



ggplot(my_data2, aes(PC1, PC2, col = RxDescriptor, fill = RxDescriptor )) +
  stat_ellipse(geom = "polygon", col = "black", alpha = 0.5) +
  geom_point(shape = 21, col = "black")+ggtitle("A Plot of the Weather Data on The New Principal Axes")+
  theme(plot.title = element_text(hjust = 0.5))+labs(y="Principal Component 2", x = "Principal Component 1")
  

cor(my_data[, 1:16], my_data2[, 20:23])



showCols <- function(cl=colors(), bg = "grey",
                     cex = 0.75, rot = 30) {
  m <- ceiling(sqrt(n <-length(cl)))
  length(cl) <- m*m; cm <- matrix(cl, m)
  require("grid")
  grid.newpage(); vp <- viewport(w = .92, h = .92)
  grid.rect(gp=gpar(fill=bg))
  grid.text(cm, x = col(cm)/m, y = rev(row(cm))/m, rot = rot,
            vp=vp, gp=gpar(cex = cex, col = cm))
}


myColorScale <- brewer.pal(14,"Set1")
myColorScale

names(myColorScale) <- levels(my_data2$RxDescriptor)

colScale <- scale_colour_manual(name = "group",values = myColorScale)

colors <- c("#999999", "#E69F00", "#56B4E9")
showCols(bg="gray20",cl=colors()[1:6], rot=30, cex=0.9)
colors <- colors[as.numeric(my_data2$RxDescriptor)]
scatterplot3d(my_data2[,20:22], pch = 16, color=colors()[1:160])

#color_easy = c("red", "blue", "yellow", "green","orange","black")[my_data2[,17]]
color_easy = c("red", "blue", "yellow", "green","orange","black")[my_data2$descriptor...17]

categories <- unique(my_data2$RxDescriptor)
color_easy2 = c("red", "blue", "purple", "green","orange","black","brown","pink")


colorarr <- array(0,dim = c(length(my_data2$RxDescriptor)))

for (i in 1:length(my_data2$RxDescriptor)){
  for (j in 1:length(categories)){
    if (my_data$RxDescriptor[i]==categories[j])
      colorarr <- append(colorarr,color_easy2[j])
  }
}

#for (i in 1:length(my_data2$descriptor)){
#  for (j in 1:length(categories)){
#    if (all(my_data2$descriptor[i]==(categories[j]))){
#      colorarr[i]<-append(colorarr,color_easy2[j])
#    }
#    else{
      
#    }
#  }
#}
#open3d()
plot3d(my_data2[,20:22],col = colorarr[211:420],size=5)
legend3d("topright",legend = paste("Type",categories), pch = 16, col =color_easy2 ,cex=1.5,inset=c(0.0))




# create the plot, you can be more adventurous with colour if you wish
s3d <- with(my_data2[,20:22], scatterplot3d(PC1, PC2, PC3, pch = 19))

# add the legend using `xyz.convert` to locate it 
# juggle the coordinates to get something that works.
legend(s3d$xyz.convert(0.5, 0.7, 0.5), pch = 19, yjust=0,
       legend = levels(my_data2$descriptor...17), col = seq_along(levels(my_data2$descriptor...17)))
         