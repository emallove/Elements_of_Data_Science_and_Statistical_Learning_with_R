##############################################################################
##############################################################################
habDat <- read.table("/Users/hmdcadministrator/Elements_of_Data_Science_and_Statistical_Learning_with_R/assignment-2/haberman.data",sep=",")
colnames(habDat) <- c("age","year","nodes","surv")
summary(habDat$surv)
habDat$surv <- c("yes","no")[habDat$surv]
summary(habDat$surv)
habDat$surv <- factor(habDat$surv)
summary(habDat$surv)
##############################################################################
##############################################################################
oldPar <- par(mfrow=c(1:2),ps=16)
for ( iSurv in sort(unique(habDat$surv)) ) {
    plot(habDat[,c("age","nodes")],type="n",
        main=paste("Survival:",iSurv))
    iTmp <- (1:length( levels ( habDat$surv )))[ levels(habDat$surv) == iSurv ]
    points( habDat[ habDat$surv==iSurv,c("age","nodes")], col=iTmp, pch=iTmp )
}
par(oldPar)
##############################################################################
##############################################################################
ggplot(habDat,aes(x=age,y=nodes,colour=surv,shape=surv)) + 
geom_point() + facet_wrap(~surv) + theme_bw()
##############################################################################
##############################################################################
habDat$nodes0 <- habDat$nodes==0
table(habDat[, c("surv","nodes0")])
habDat$nodes75 <- habDat$nodes>=quantile(habDat$nodes,probs=0.75)
table(habDat[, c("surv","nodes75")])
##############################################################################
##############################################################################
#habDat <- read.table("haberman.data",sep=",")
wifiDat <- read.table("wifi_localization.txt",sep="\t")

#colnames(habDat) <- c("age","year","nodes","surv")
colnames(wifiDat) <- c("WS1", "WS2", "WS3", "WS4", "WS5", "WS6", "WS7", "Class")
summary(wifiDat$Class)

# habDat$surv <- c("yes","no")[habDat$surv]
wifiDat$Class <- c(1,2,3,4)[wifiDat$Class]

#summary(habDat$surv)
summary(wifiDat$Class)

#habDat$surv <- factor(habDat$surv)
wifiDat$Class <- factor(wifiDat$Class)

#summary(habDat$surv)
summary(wifiDat$Class)
##############################################################################
##############################################################################
oldPar <- par(mfrow=c(1:2),ps=16)
for ( iClass in sort(unique(wifiDat$Class)) ) {
    plot(wifiDat[,c("age","nodes")],type="n",
        main=paste("Classival:",iClass))
    iTmp <- (1:length(levels(wifiDat$Class)))[levels(wifiDat$Class)==iClass]
    points(wifiDat[wifiDat$Class==iClass,c("age","nodes")],col=iTmp,pch=iTmp)
}
par(oldPar)
##############################################################################
##############################################################################
ggplot(wifiDat,aes(x=age,y=nodes,colour=surv,shape=surv)) + 
geom_point() + facet_wrap(~surv) + theme_bw()
##############################################################################
