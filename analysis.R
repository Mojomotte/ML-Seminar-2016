

#Analysis of simulation results
#============================================================================================

#(general number of scenario, () number of scenario in thesis pdf)


#scenario 1 (1)
#---------------------------------------------------------

#metric means
metrics_s1$accuracy_mean
metrics_s1$kappa_mean

#histogramms
vis_hist(metrics_s1$accuracy, binWidth = 0.02)
vis_hist(metrics_s1$kappa)



#scenario 2 (-)
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



#scenario 5 (-)
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
vis_hist(metrics_s6.3$accuracy)
vis_hist(metrics_s6.3$kappa)

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



#scenario 8 (-)
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



#scenario 11 (-)
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




#scenario 12 (-)
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







#==========================================================================================

#create tables with mean and sd values of the metrics

#for accuracy
acc_tab<-round(rbind(form_dat(metrics_s1, "accuracy"),
               form_dat(metrics_s3.1, "accuracy"),form_dat(metrics_s3.2, "accuracy"),form_dat(metrics_s3.3, "accuracy"),
               form_dat(metrics_s4.1, "accuracy"),form_dat(metrics_s4.2, "accuracy"),form_dat(metrics_s4.3, "accuracy"),
               form_dat(metrics_s6.1, "accuracy"),form_dat(metrics_s6.2, "accuracy"),form_dat(metrics_s6.3, "accuracy"),form_dat(metrics_s6.4, "accuracy"),form_dat(metrics_s6.5, "accuracy"),
               form_dat(metrics_s7, "accuracy"),
               form_dat(metrics_s9.1, "accuracy"),form_dat(metrics_s9.2, "accuracy"),form_dat(metrics_s9.3, "accuracy"),
               form_dat(metrics_s10.1, "accuracy"),form_dat(metrics_s10.2, "accuracy"),form_dat(metrics_s10.3, "accuracy"),
               form_dat(metrics_s11.1, "accuracy"),form_dat(metrics_s11.2, "accuracy"),form_dat(metrics_s11.3, "accuracy"),form_dat(metrics_s11.4, "accuracy"),form_dat(metrics_s11.5, "accuracy")
               ),digits = 4)
acc_tab<-cbind(c("1","2.1","2.2","2.3","3.1","3.2","3.3","4.1","4.2","4.3","4.4","4.5","5","6.1","6.2","6.3","7.1","7.2","7.3","8.1","8.2","8.3","8.4","8.5"),acc_tab)
names(acc_tab)<-c("Szenario",names(acc_tab)[-1])


#and for kappa
kap_tab<-round(rbind(form_dat(metrics_s1, "kappa"),
                     form_dat(metrics_s3.1, "kappa"),form_dat(metrics_s3.2, "kappa"),form_dat(metrics_s3.3, "kappa"),
                     form_dat(metrics_s4.1, "kappa"),form_dat(metrics_s4.2, "kappa"),form_dat(metrics_s4.3, "kappa"),
                     form_dat(metrics_s6.1, "kappa"),form_dat(metrics_s6.2, "kappa"),form_dat(metrics_s6.3, "kappa"),form_dat(metrics_s6.4, "kappa"),form_dat(metrics_s6.5, "kappa"),
                     form_dat(metrics_s7, "kappa"),
                     form_dat(metrics_s9.1, "kappa"),form_dat(metrics_s9.2, "kappa"),form_dat(metrics_s9.3, "kappa"),
                     form_dat(metrics_s10.1, "kappa"),form_dat(metrics_s10.2, "kappa"),form_dat(metrics_s10.3, "kappa"),
                     form_dat(metrics_s11.1, "kappa"),form_dat(metrics_s11.2, "kappa"),form_dat(metrics_s11.3, "kappa"),form_dat(metrics_s11.4, "kappa"),form_dat(metrics_s11.5, "kappa")
                      ),digits = 4)
kap_tab<-cbind(c("1","2.1","2.2","2.3","3.1","3.2","3.3","4.1","4.2","4.3","4.4","4.5","5","6.1","6.2","6.3","7.1","7.2","7.3","8.1","8.2","8.3","8.4","8.5"),kap_tab)
names(kap_tab)<-c("Szenario",names(kap_tab)[-1])


#get output as latex table
xtable(acc_tab,digits = 4)
xtable(kap_tab,digits = 4)




#show change from reference scenario in case of multi-collinearity
acc<-as.data.frame(rbind(metrics_s1$accuracy_mean,metrics_s7$accuracy_mean))
kap<-as.data.frame(rbind(metrics_s1$kappa_mean,metrics_s7$kappa_mean))
vis_change(acc,kap)

