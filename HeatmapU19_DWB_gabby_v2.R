##########################################################

# Heat Map of Variance/CoV Matrix for weight in aged mice stratified by cross

##########################################################

# setwd("/Users/choonoo/aged_mice_covariance")

# save.image("~/aged_mice_cov.RData")

# load("~/aged_mice_cov.RData")

library(gdata)

##########################################################

# read in most recent cleaned aged mice data
read.xls(xls="cleaned_aged_mice_data_3_26_2015.xlsx", header=T, sheet=1, na.strings=c("","NA")) -> dat

# subset ID, cross and weights only
dat[,c(1,2,17:22,36)] -> dat_v2

# set DFA and DIC weights to NA
dat_v2[which(dat_v2[,"death_coding"] == "DFA"),]
dat_v2[which(dat_v2[,"death_coding"] == "DIC"),3:8] <- NA

row.names(dat_v2) <- dat_v2[,"unique_id"]
dat_v2[,3:8] -> dat_v3

na_full = sapply(1:dim(dat_v3)[1],function(x)sum(is.na(dat_v3[x,]))/length(dat_v3[x,]))

dat_v3[-which(na_full == 1),] -> dat_v4

# variance of weight
V <- var(dat_v4, na.rm=TRUE)

#Log transform
cov.cor <- cov2cor(V)
cov.cor.m <- data.matrix(cov.cor)

# full covariance heatmap
# hmn <- heatmap(cov.cor.m, col=heat.colors(256))
# image(as.matrix(1:6), col=topo.colors(256),axes=F)
# axis(side=1,at=c(0,.25,.5,.75,1),labels=round(seq(range(cov.cor.m)[1],range(cov.cor.m)[2],length.out=5), 2))

# stratify by strain
dat_v4[which(substring(row.names(dat_v4),1,2) == names(summary(as.factor(substring(row.names(dat_v4),1,2)))[1])),] -> dat_v4_aa
V2 <- var(dat_v4_aa, na.rm=TRUE)
cov.cor2 <- cov2cor(V2)
cov.cor.m2 <- data.matrix(cov.cor2)
# hmn2 <- heatmap(cov.cor.m2, col=heat.colors(256))




