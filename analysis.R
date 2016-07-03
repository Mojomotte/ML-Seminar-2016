

#Analysis of simulation results
#============================================================================================




#scenario 1 (1)
#---------------------------------------------------------

#metric means
metrics_s1$accuracy_mean
metrics_s1$kappa_mean

#histogramms
vis_hist(metrics_s1$accuracy, binWidth = 0.02)
vis_hist(metrics_s1$kappa)



#scenario 2 ()
#---------------------------------------------------------

#metric means
metrics_s2$accuracy_mean
metrics_s2$kappa_mean

#histogramms
vis_hist(metrics_s2$accuracy)
vis_hist(metrics_s2$kappa)



#scenario 3 (2)
#---------------------------------------------------------

#metric means
metrics_s3.1$accuracy_mean
metrics_s3.1$kappa_mean
metrics_s3.2$accuracy_mean
metrics_s3.2$kappa_mean
metrics_s3.3$accuracy_mean
metrics_s3.3$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s3.1$accuracy_mean,metrics_s3.2$accuracy_mean,metrics_s3.3$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s3.1$kappa_mean,metrics_s3.2$kappa_mean,metrics_s3.3$kappa_mean))
vis_change(acc,kap)



#scenario 4 (3)
#---------------------------------------------------------

#metric means
metrics_s4.1$accuracy_mean
metrics_s4.1$kappa_mean
metrics_s4.2$accuracy_mean
metrics_s4.2$kappa_mean
metrics_s4.3$accuracy_mean
metrics_s4.3$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s4.1$accuracy_mean,metrics_s4.2$accuracy_mean,metrics_s4.3$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s4.1$kappa_mean,metrics_s4.2$kappa_mean,metrics_s4.3$kappa_mean))
vis_change(acc,kap)



#scenario 5 ()
#---------------------------------------------------------

#metric means
metrics_s5$accuracy_mean
metrics_s5$kappa_mean

#histogramms
vis_hist(metrics_s5$accuracy)
vis_hist(metrics_s5$kappa)



#scenario 6 (4)
#---------------------------------------------------------

#metric means
metrics_s6.1$accuracy_mean
metrics_s6.1$kappa_mean
metrics_s6.2$accuracy_mean
metrics_s6.2$kappa_mean
metrics_s6.3$accuracy_mean
metrics_s6.3$kappa_mean
metrics_s6.4$accuracy_mean
metrics_s6.4$kappa_mean
metrics_s6.5$accuracy_mean
metrics_s6.5$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s6.1$accuracy_mean,metrics_s6.2$accuracy_mean,metrics_s6.3$accuracy_mean,metrics_s6.4$accuracy_mean,metrics_s6.5$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s6.1$kappa_mean,metrics_s6.2$kappa_mean,metrics_s6.3$kappa_mean,metrics_s6.4$kappa_mean,metrics_s6.5$kappa_mean))
vis_change(acc,kap)



#scenario 7 (5)
#---------------------------------------------------------

#metric means
metrics_s7$accuracy_mean
metrics_s7$kappa_mean

#histogramms
vis_hist(metrics_s7$accuracy)
vis_hist(metrics_s7$kappa)



#scenario 8 ()
#---------------------------------------------------------

#metric means
metrics_s8$accuracy_mean
metrics_s8$kappa_mean

#histogramms
vis_hist(metrics_s8$accuracy)
vis_hist(metrics_s8$kappa)



#scenario 9 (6)
#---------------------------------------------------------

#metric means
metrics_s9.1$accuracy_mean
metrics_s9.1$kappa_mean
metrics_s9.2$accuracy_mean
metrics_s9.2$kappa_mean
metrics_s9.3$accuracy_mean
metrics_s9.3$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s9.1$accuracy_mean,metrics_s9.2$accuracy_mean,metrics_s9.3$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s9.1$kappa_mean,metrics_s9.2$kappa_mean,metrics_s9.3$kappa_mean))
vis_change(acc,kap)



#scenario 10 (7)
#---------------------------------------------------------

#metric means
metrics_s10.1$accuracy_mean
metrics_s10.1$kappa_mean
metrics_s10.2$accuracy_mean
metrics_s10.2$kappa_mean
metrics_s10.3$accuracy_mean
metrics_s10.3$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s10.1$accuracy_mean,metrics_s10.2$accuracy_mean,metrics_s10.3$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s10.1$kappa_mean,metrics_s10.2$kappa_mean,metrics_s10.3$kappa_mean))
vis_change(acc,kap)



#scenario 11 (8)
#---------------------------------------------------------

#metric means
metrics_s11.1$accuracy_mean
metrics_s11.1$kappa_mean
metrics_s11.2$accuracy_mean
metrics_s11.2$kappa_mean
metrics_s11.3$accuracy_mean
metrics_s11.3$kappa_mean
metrics_s11.4$accuracy_mean
metrics_s11.4$kappa_mean
metrics_s11.5$accuracy_mean
metrics_s11.5$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s11.1$accuracy_mean,metrics_s11.2$accuracy_mean,metrics_s11.3$accuracy_mean,metrics_s11.4$accuracy_mean,metrics_s11.5$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s11.1$kappa_mean,metrics_s11.2$kappa_mean,metrics_s11.3$kappa_mean,metrics_s11.4$kappa_mean,metrics_s11.5$kappa_mean))
vis_change(acc,kap)




#scenario 12 (?)
#---------------------------------------------------------

#metric means
metrics_s12.1$accuracy_mean
metrics_s12.1$kappa_mean
metrics_s12.2$accuracy_mean
metrics_s12.2$kappa_mean
metrics_s12.3$accuracy_mean
metrics_s12.3$kappa_mean

#histogramms
#...

#metric change through out sub-scenarios
acc<-as.data.frame(rbind(metrics_s12.1$accuracy_mean,metrics_s12.2$accuracy_mean,metrics_s12.3$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s12.1$kappa_mean,metrics_s12.2$kappa_mean,metrics_s12.3$kappa_mean))
vis_change(acc,kap)



