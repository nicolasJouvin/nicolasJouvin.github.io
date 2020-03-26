library(FactoMineR)
setwd("~/These/Enseignements/Analyse_des_donnee/2019_2020/Supports ACM-20200319")

###################################################################################
#     Exemple 1 : Analyse des correspondances multiples sur les donnees "chiens"  #
###################################################################################

chiens <- read.csv("chiens.csv", header=F)
row.names(chiens) <- chiens[,1]
chiens <- chiens[,-1]
names(chiens) <- c("Taille","Poids","Velocite","Intell","Affect","Agress","Fonction")
chiens

chiens.acm <- MCA(chiens,ncp=4,axes=c(1,2))

#TDC : 
Z = as.matrix(chiens.acm$call$Xtot)
Z
# Tableau de Burt :
burt.table = t(Z) %*% Z
burt.table

chiens.acm$eig
names(chiens.acm$var)
chiens.acm$var$contrib
chiens.acm$var$cos2

plot(chiens.acm,axes=c(1,2),select="cos2 0.4",selectMod="cos2 0.4")

###################################################################################
#     Exemple 2 : Analyse des correspondances multiples sur les donnees "jeux"    #
###################################################################################
jeux <- read.table(file="jeux.txt",header=T)
dim(jeux)
jeux[1:10,]

summary(jeux)

jeux.acm <- MCA(jeux[,2:7],ncp=4,axes=c(1,2))

#TDC :
Z = as.matrix(jeux.acm$call$Xtot)
# Burt :
B = t(Z) %*% Z

jeux.acm$eig
names(jeux.acm$var)
jeux.acm$var$contrib
jeux.acm$var$cos2

plot(jeux.acm,axes=c(1,2),invisible="ind",selectMod="cos2 0.4")

####################################################################################
#    Exemple 2 : Analyse des correspondances multiples sur les donnees "ronfle"    #
####################################################################################
ronfle <- read.table(file="ronfle.txt",header=T)
dim(ronfle)
ronfle[1:10,]
summary(ronfle)

# On discretise les variables age, poids et taille
x.age <- quantile(ronfle[,2],probs=c(0.2,0.4,0.6,0.8))
age <- as.factor((ronfle[,2]>=x.age[1])+(ronfle[,2]>=x.age[2])+(ronfle[,2]>=x.age[3])+(ronfle[,2]>=x.age[4]))

x.poids <- quantile(ronfle[,3],probs=c(0.2,0.4,0.6,0.8))
poids <- as.factor((ronfle[,3]>=x.poids[1])+(ronfle[,3]>=x.poids[2])+(ronfle[,3]>=x.poids[3])+(ronfle[,3]>=x.poids[4]))

x.taille <- quantile(ronfle[,4],probs=c(0.2,0.4,0.6,0.8))
taille <- as.factor((ronfle[,4]>=x.taille[1])+(ronfle[,4]>=x.taille[2])+(ronfle[,4]>=x.taille[3])+(ronfle[,4]>=x.taille[4]))

alcool <- as.factor((ronfle[,5]>=1)+(ronfle[,5]>=4)+(ronfle[,5]>=6))

ronfle.disc <- data.frame(age, poids, taille, alcool, sexe=as.factor(ronfle[,6]), ronfle=as.factor(ronfle[,7]),
taba=as.factor(ronfle[,8]))

ronfle.acm <- MCA(ronfle.disc,ncp=5,axes=c(1,2))
ronfle.acm$eig
ronfle.acm$var$contrib
ronfle.acm$var$cos2
plot(ronfle.acm,axes=c(1,2),invisible="ind",selectMod="cos2 0.3")
plot(ronfle.acm,axes=c(1,2),choix="var")

# On supprime la taille
ronfle.disc <- ronfle.disc[,-3]
ronfle.acm <- MCA(ronfle.disc,ncp=5,axes=c(1,2))
ronfle.acm$eig
ronfle.acm$var$contrib
ronfle.acm$var$cos2

plot(ronfle.acm,axes=c(1,2),invisible="ind",selectMod="cos2 0.2")
plot(ronfle.acm,axes=c(1,2),choix="var")
ronfle.acm$var$eta2

#################################################################################
#    Exemple 3 : Analyse des correspondances multiples sur les donnees "bio"    #
#################################################################################
bio <- read.table(file="bio.txt",header=T)
dim(bio)
bio[1:10,]

summary(bio)

for (i in 2:dim(bio)[2])
 bio[,i] <- as.factor(bio[,i])
summary(bio)

bio.acm <- MCA(bio[,2:12],ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")



# Suppression des modalités à très faible effectif
Z = bio.acm$call$Xtot
mod.effectifs = apply(Z, 2, sum)
which(mod.effectifs <= 5)

bio <- bio[bio[,2]!=0,]
bio <- bio[bio[,3]!=0,]
bio <- bio[bio[,5]!=1,]
bio <- bio[bio[,5]!=6,]
bio <- bio[bio[,11]!=0,]
bio <- bio[bio[,11]!=1,]
bio <- bio[bio[,12]!=0,]


bio.acm <- MCA(bio[,2:12],ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")

# Le jeu de données est réduit

bio <- bio[,c(2,4,7:12)]

bio.acm <- MCA(bio,ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")

# On supprime l'état civil
bio <- bio[,-5]

# On supprime les retraités
bio <- bio[bio[,4]!=6,]
bio <- bio[bio[,6]!=7,]

bio.acm <- MCA(bio,ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")
plot.MCA(bio.acm,axes=c(1,3),choix="ind",invisible="ind")

# on supprime la variable "connaitre" 
bio <- bio[,-1]
bio <- bio[bio[,1]!=7,]

bio.acm <- MCA(bio,ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")

# on supprime d'autres modalités inutiles
bio <- bio[,-2]
bio <- bio[bio[,2]!=1,]
bio <- bio[bio[,4]!=8,]
bio <- bio[bio[,5]!=1,]
bio <- bio[bio[,5]!=2,]

bio.acm <- MCA(bio,ncp=5,axes=c(1,2))
bio.acm$eig
bio.acm$var

plot.MCA(bio.acm,axes=c(1,2),choix="ind",invisible="ind")

