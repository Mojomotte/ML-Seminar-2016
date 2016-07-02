

#simulation scenarios
#============================================================================================


#seed
set.seed(42)

#n is number of observations that is again split into training and test set by ratio 0.7/0.3

#(general number of scenario, () number of scenario in thesis pdf)

#scenario 1 (1)
#---------------------------------------------------------
#base line with only normal distributed data
#n=500
#nx=5
#y with c=6 classes
metrics_s1<-simulate_com(lvl2 = "n",n=500,nx=5)


#scenario 2 ()
#---------------------------------------------------------
#only data from uniform distribution
#n=500
#ux=5
#y with c=6 classes
metrics_s2<-simulate_com(lvl2 = "n",n=500,ux=5)


#scenario 3 (2)
#---------------------------------------------------------
#only integer data (2/3/5 different values, discretely uniform distributed)
#n=500
#c2x=5/c3x=5/c5x=5
#y with c=6 classes
metrics_s3.1<-simulate_com(lvl2 = "n",n=500,c2x=5)
metrics_s3.2<-simulate_com(lvl2 = "n",n=500,c3x=5)
metrics_s3.3<-simulate_com(lvl2 = "n",n=500,c5x=5)


#scenario 4 (3)
#---------------------------------------------------------
#only categorical (discretely uniform distributed) data (2/3/5 classes)
#n=500
#c2x=5/c3x=5/c5x=5
#y with c=6 classes
metrics_s4.1<-simulate_com(lvl2 = "y",model_type = "categorical",n=500,c2x=5)
metrics_s4.2<-simulate_com(lvl2 = "y",model_type = "categorical",n=500,c3x=5)
metrics_s4.3<-simulate_com(lvl2 = "y",model_type = "categorical",n=500,c5x=5)


#scenario 5 ()
#---------------------------------------------------------
#mixed class categorical data (discretely uniform distributed)
#n=500
#c2x=1
#c3x=2
#c5x=2
#y with c=6 classes
metrics_s5<-simulate_com(lvl2 = "y",model_type = "categorical",n=500,c2x=1,c3x=2,c5x=2)


#scenario 6 (4)
#---------------------------------------------------------
#normal distributed data + (1/2/3/5) additional random vectors without information
#n=500
#nx=5
#nrand=1/2/3/5
#y with c=6 classes
metrics_s6.1<-simulate_com(lvl2 = "y", model_type = "random",nrand = 1, n=500, nx=5)
metrics_s6.2<-simulate_com(lvl2 = "y", model_type = "random",nrand = 2, n=500, nx=5)
metrics_s6.3<-simulate_com(lvl2 = "y", model_type = "random",nrand = 3, n=500, nx=5)
metrics_s6.4<-simulate_com(lvl2 = "y", model_type = "random",nrand = 5, n=500, nx=5)


#scenario 7 (5)
#---------------------------------------------------------
#normal distributed data with multi-collinearity
#n=500
#nx=5
#y with c=6 classes
metrics_s7<-simulate_com(lvl2 = "y",model_type = "multi",n=500,nx=5)


#scenario 8 ()
#---------------------------------------------------------
#uniform distributed data with multi-collinearity
#n=500
#ux=5
#y with c=6 classes
metrics_s8<-simulate_com(lvl2 = "y",model_type = "multi",n=500,ux=5)


#scenario 9 (6)
#---------------------------------------------------------
#increase number of variables (normally distributed),
#restrict number of classes of y
#n=500
#nx=10/25/50/(100)
#y with c= 4/6/8/(11) classes
metrics_s9.1<-simulate_com(lvl2 = "n",restrict_lvl = TRUE,n=500,nx=10)
metrics_s9.2<-simulate_com(lvl2 = "n",restrict_lvl = TRUE,n=500,nx=25)
metrics_s9.3<-simulate_com(lvl2 = "n",restrict_lvl = TRUE,n=500,nx=50)

#metrics_s9.4<-simulate_com(lvl2 = "n",restrict_lvl = TRUE,n=500,nx=100)
#multinom of package nnet can't predict for nx=100 (error: too many weights)


#scenario 10 (7)
#---------------------------------------------------------
#increase number of variables (normally distributed),
#don't restrict number of classes of y, that means we increase c equivalent to nx 
#n=500
#nx=10/20/30/(50)
#y with c= 11/21/31/(51) classes
metrics_s10.1<-simulate_com(lvl2 = "n",n=500,nx=10)
metrics_s10.2<-simulate_com(lvl2 = "n",n=500,nx=20)
metrics_s10.3<-simulate_com(lvl2 = "n",n=500,nx=30)

#metrics_s10.3<-simulate_com(lvl2 = "n",n=500,nx=50)
#multinom of package nnet can't predict for nx=50 in unrestricted case (error: too many weights)


#scenario 11 (8)
#---------------------------------------------------------
#decrease number of observations (normal distribution)
#n=300/100/50/30
#nx=5
#y with c=6 classes
metrics_s11.1<-simulate_com(lvl2 = "n",n=300,nx=5)
metrics_s11.2<-simulate_com(lvl2 = "n",n=100,nx=5)
metrics_s11.3<-simulate_com(lvl2 = "n",n=50,nx=5)
metrics_s11.4<-simulate_com(lvl2 = "n",n=30,nx=5)



















