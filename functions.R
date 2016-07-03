
#functions for the data generating process and the simulation
#===========================================================================================


#setting my working directory
direct<-"C:/Users/Jonas/Google Drive/R Projects/KIT courses/ML semi"
setwd(direct)


#libraries
#---------------------------
library(dplyr)
library(ggplot2)
library(lattice)
library(nnet)
library(rpart)
library(C50)
library(randomForest)
library(Metrics)
library(caTools)
library(reshape2)
#library(irr)
#library(caret)

#----------------------------






#create dgp functions
#==========================================================================================



#1
#------------------------------------------------------------------------------------------

#this function creates "nx" random vectors of length "n" from a normal distribution with a standard deviation of "sd"
generate_norm<-function(n=0,nx=0,sd=1){
  nv<-vector()
  for(i in 1:nx){
    nv<-cbind(nv,rnorm(n,0,sd))
  }
  
  if(n==0|nx==0){
    return(vector())
  } else {
    return(nv)
  } 
}



#2
#------------------------------------------------------------------------------------------

#this function creates "ux" random vectors of length "n" from a uniform distribution (with max and min)
generate_unif<-function(n=0,ux=0,
                        min=-1,max=1){
  uv<-vector()
  for(i in 1:ux){
    uv<-cbind(uv,runif(n,min,max))
  }
  
  if(n==0|ux==0){
    return(vector())
  } else {
    return(uv)
  } 
}



#3
#------------------------------------------------------------------------------------------

#this function creates 
#"c2x" random vectors of length "n" as a binary (integer) variable (with probability vector c2p)
#"c3x" random vectors of length "n" as categorical (integer) variable with 3 levels (with probability vector c3p)
#"c5x" random vectors of length "n" as categorical (integer) variable with 5 levels (with probability vector c5p)
generate_cat<-function(n=0,
                       c2x=0,c2p=c(1,1),
                       c3x=0,c3p=c(1,1,1),
                       c5x=0,c5p=c(1,1,1,1,1)){
  cv<-vector()
  
  if(c2x>0){
    for(i in 1:c2x){
      cv<-cbind(cv,sample(c(1,2),n, replace = TRUE, prob = c2p))
    }
  }
  
  if(c3x>0){
    for(j in 1:c3x){
      cv<-cbind(cv,sample(c(1,2,3),n, replace = TRUE, prob = c3p))
    }
  }
  
  if(c5x>0){  
    for(k in 1:c5x){
      cv<-cbind(cv,sample(c(1,2,3,4,5),n, replace = TRUE, prob = c5p))
    }
  }
    
  if(n==0|(c2x==0&c3x==0&c5x==0)){
    return(vector())
  } else {
    return(cv)
  } 
}





#4
#------------------------------------------------------------------------------------------

#this function creates the basic feature matrix M
create_basic_x<-function(n=500,
                            nx=1,sd=1,
                            ux=0,min=-1,max=1,
                            c2x=0,c2p=c(1,1),
                            c3x=0,c3p=c(1,1,1),
                            c5x=0,c5p=c(1,1,1,1,1)){
  
  #create feature matrix "M"
  M<-vector()
  
  nv<-generate_norm(n=n,nx=nx,sd=sd)
  uv<-generate_unif(n=n,ux=ux,
                    min=min,max=max)
  cv<-generate_cat(n=n,
                   c2x=c2x,c2p=c2p,
                   c3x=c3x,c3p=c3p,
                   c5x=c5x,c5p=c5p)
  

  M<-as.matrix(cbind(nv,uv,cv))
  
  #create output list consisting of matrix M 
  #and the number of every feature type as integer
  out<-list()
  
    out[[1]]<-M
    out[[2]]<-vector()
    out[[2]][1]<-as.integer(ifelse(is.integer(dim(nv)[2]),dim(nv)[2],0))
    out[[2]][2]<-as.integer(ifelse(is.integer(dim(uv)[2]),dim(uv)[2],0))
    out[[2]][3]<-as.integer(ifelse(is.integer(dim(cv)[2]),dim(cv)[2],0))
    out[[2]][4]<-0
    names(out[[2]])<-c("nx","ux","cx", "nrand")
    
    return(out)
  
}






#5
#------------------------------------------------------------------------------------------

#this function creates the response y for the feature matrix M
create_response<-function(feature_list){
  
  M<-feature_list[[1]]
  
  #create coefficient vector "beta" as normal distributed random vector (mean=0, sd=1)
  beta<-vector(length = dim(M)[2])
  
  for (i in 1:dim(M)[2]) {
    beta[i]<-rnorm(1,0)
  }
  
  
  #calculate denominator term
  denom<-1
  for (i in 1:dim(M)[2]) {
    denom<-(denom+exp(M[,i]*beta[i]))
  }
  
  
  #calculate probability matrix via softmax 
  prob<-as.vector(1/denom)
  for (i in 1:dim(M)[2]) {
    prob<-cbind(prob,exp(M[,i]*beta[i])/denom)
  }
  
  
  #draw binomials from the probability matrix
  draw_mult = t(apply(prob, 1, rmultinom, n = 1, size = 1))
  
  #compute vector y from the draw assignments
  y<-apply(draw_mult, 1, function(x) which(x==1))
  
  
  return(as.factor(y))
  
}







#6
#------------------------------------------------------------------------------------------

#this function generates the second level type seperation of the featurematrices M,
#that is 
#a) data with some to (categorical) factors transformed variables; 
#b) data with additional random variables;
#c) multi-collinear data
generate_x_lvl2<-function(feature_list,
                          model_type=c("categorical","random","multi"),
                          nrand=2){

  model_type<-match.arg(model_type)
  
  M<-feature_list[[1]]
  
  
  #a)
  if(model_type=="categorical"){
    
    if(feature_list[[2]][3]==0){
      stop("no categorical variables found", call. = FALSE)
      
    } else {
      
      #calculate column interval of non-categorical variables
      d1<-as.integer(feature_list[[2]][1]+feature_list[[2]][2])
      
      #get number of categorical variables
      d2<-as.integer(feature_list[[2]][3])
      
      M<-as.data.frame(M)
      
      #convert all categorical variables to factors
      for (i in (d1+1):(d1+d2)) {
        M[,i]<-as.factor(M[,i])
      }
      
      feature_list[[1]]<-M
      
      return(feature_list)
      
    }
  }
  
  
  
  #b)
  if(model_type=="random"){
    
    for (i in 1:nrand) {
      M<-cbind(M, rnorm(dim(M)[1],0))
    }
    
    feature_list[[1]]<-M
    feature_list[[2]][4]<-nrand
    
    return(feature_list)
    
  }
  
  
  
  #c)
  if(model_type=="multi"){
    
    #caluclate dimension of the correlation matrix
    d<-as.integer(dim(M)[2])
    
    #calculate correlation matrix sigma
    sigma<-matrix(0,nrow = d, ncol = d)
    
    for(i in 1:d){
      for(j in 1:d){
        sigma[i,j]<-0.5^(abs(i-j))
      }
    }
    
    
    #create correlated variables via cholesky decomposition
    M<-M%*%solve(chol(var(M)))%*%chol(sigma)
    
    feature_list[[1]]<-M
    
    return(feature_list)
  
  }
  

}





#7
#------------------------------------------------------------------------------------------

#this functions names the variables of a data frame with "x1", "x2", ...
#(because some methods, e.g. randomForest, need "named" variables)

names_df<-function(df){
  d<-dim(df)[2]
  v<-rep("x0",d)
  for (i in 1:d) {
    v[i]<-gsub("0",as.character(i),v[i])
  }
  v[i]<-"y"
  
  return(v)
}





#8
#------------------------------------------------------------------------------------------

#since the used simulation produces c = (#x variables + 1)  classes for the response y,
#there is an increasing number of classes if we use more x variables. 
#to compensate that, this function reduces c to its rounded squareroot
restrict_factorlvl<-function(y){
  c<-length(unique(y))
  split<-ceiling(sqrt(c))
  
  y<-as.integer(y)
  
  for (i in 1:length(y)) {
    y[i]<-((y[i]%%split)+1)
  }
  
  return(as.factor(y))
}





#9
#------------------------------------------------------------------------------------------

#this function calculates metrics for the predicted and the real values
#it is able to calculate the accuracy and cohen's kappa
get_metrics<-function(actual, predicted, 
                      metric=c("accuracy", "kappa")){
  
  metric<-match.arg(metric)
  
  #compute confusion matrix
  cm<-as.matrix(table(actual, predicted))
  n<-sum(cm)
  
  #calculate accuracy
  Acc<-(sum(diag(cm))/n)
  
  if(metric=="accuracy"){
    
    return(Acc)
    
  } else {
    #calculate expected accuracy
    expAcc<-sum((rowSums(cm)/n)*(colSums(cm)/n))
    #calculate kappa
    kappa<-((Acc-expAcc)/(1-expAcc))
    
    return(kappa)
  }
}







#simulation function
#==================================================================================

#number of averaged simulations per scenario default k=100

simulate_com<-function(k=100,
                       lvl2=c("n","y"), #lvl2 transformation "yes" or "no"
                       restrict_lvl=FALSE, #restrict number of levels of y
                       model_type=c("categorical","random","multi"),
                       nrand=2,
                       ...){

  
  lvl2<-match.arg(lvl2)
  model_type<-match.arg(model_type)
  
  
  #create data frames for evaluation metrics
  accuracy<-data.frame(vector(),vector(),vector(),vector())
  names(accuracy)<-c("rpart","c50","randomForest","multinom")
  
  Kappa<-data.frame(vector(),vector(),vector(),vector())
  names(Kappa)<-c("rpart","c50","randomForest","multinom")
  
  
  #simulation loop
  for(i in 1:k){
    
    #create data
    #functions with (...) take their arguments from the call of the super function
    x_list<-create_basic_x(...)
    
    
    #cases for lvl2 transformations
    if(lvl2=="y"){
      
      if(model_type=="multi"){
        x_list<-generate_x_lvl2(x_list,"multi")
        y<-create_response(x_list)
        
      } else {
        y<-create_response(x_list)
        x_list<-generate_x_lvl2(x_list,
                                model_type=model_type,
                                nrand=nrand)
      }
    } else {
      y<-create_response(x_list)
      
    }
    
    
    #restrict levels of y?
    if(restrict_lvl){
      y<-restrict_factorlvl(y)
      
    }
    
    
    #combine data to data frame
    data<-cbind.data.frame(x_list[[1]],y)
    names(data)<-names_df(data)
    
    #split into train and test set (ratio 0.7/0.3)
    sample<-sample.split(data$y, 0.7)
    train<-subset(data, sample==TRUE)
    test<-subset(data, sample==FALSE)
    
    #fit models
    fit_rpart<-rpart(y~.,data=train, method = "class") #decision tree "CART" algorithm; uses internal 10-fold c.v. for automatical pruning
    fit_c50<-C5.0(y~.,data=train) #decision tree C5.0 algorithm; with implicit pruning rules
    fit_randomForest<-randomForest(y~.,data=train,ntree=1000)  #random forest with 1000 trees
    fit_multinom<-multinom(y~.,data=train, trace=FALSE)  #multinomial logistic regression
    
    
    #calculate predictions
    predict_rpart<-predict(fit_rpart, test[1:(dim(test)[2]-1)], type = "class")
    predict_c50<-predict.C5.0(fit_c50, test[1:(dim(test)[2]-1)], type = "class")
    predict_randomForest<-predict(fit_randomForest, test[1:(dim(test)[2]-1)], type = "class")
    predict_multinom<-predict(fit_multinom, test[1:(dim(test)[2]-1)], type = "class")
    ##predict_multinom_prob<-predict(fit_multinom, test[1:(dim(test)[2]-1)], type = "probs")
    
    
    #calculate accuracy
    accuracy[i,1]<-get_metrics(test$y, predict_rpart,"accuracy")
    accuracy[i,2]<-get_metrics(test$y, predict_c50,"accuracy")
    accuracy[i,3]<-get_metrics(test$y, predict_randomForest,"accuracy")
    accuracy[i,4]<-get_metrics(test$y, predict_multinom,"accuracy")
    
    #Compute kappa
    #kappa is a better metric in case of an inbalanced class distribution of y, what is often the case here
    Kappa[i,1]<-get_metrics(test$y, predict_rpart,"kappa")
    Kappa[i,2]<-get_metrics(test$y, predict_c50,"kappa")
    Kappa[i,3]<-get_metrics(test$y, predict_randomForest,"kappa")
    Kappa[i,4]<-get_metrics(test$y, predict_multinom,"kappa")
    
    
  }
  
  #calculate the mean accuracy and mean kappa as well as their variances for the k-fold simulation of each algorithm
  accuracy_mean<-accuracy%>%
    summarise(rpart=mean(rpart),
              c50=mean(c50),
              randomForest=mean(randomForest),
              multinom=mean(multinom))
  
  accuracy_var<-accuracy%>%
    summarise(rpart=var(rpart),
              c50=var(c50),
              randomForest=var(randomForest),
              multinom=var(multinom))
  
  Kappa_mean<-Kappa%>%
    summarise(rpart=mean(rpart),
              c50=mean(c50),
              randomForest=mean(randomForest),
              multinom=mean(multinom))
  
  Kappa_var<-Kappa%>%
    summarise(rpart=var(rpart),
              c50=var(c50),
              randomForest=var(randomForest),
              multinom=var(multinom))
  
  
  #create list of metrics
  metrics_list<-list(accuracy,accuracy_mean,accuracy_var,Kappa,Kappa_mean,Kappa_var)
  names(metrics_list)<-c("accuracy", "accuracy_mean","accuracy_var","kappa","kappa_mean","kappa_var")
  
  return(metrics_list)
  
}








#create functions that help with analysis
#==========================================================================================


#1
#------------------------------------------------------------------------------------------

#"multiplot" function from cookbook-r (  http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/  )
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}







#2
#------------------------------------------------------------------------------------------

#this function makes it faster and easier to draw some standard plot for comparison
vis_change<-function(acc,kap){
  #add variable "scenario"
  acc<-cbind(acc,variation=as.character(1:dim(acc)[1]))
  #bring ("melt") into "long format"
  acc<-melt(acc,variation=index)
  #create connected scatterplot for each method
  p1<-ggplot(acc,aes(x=variation,y=value,group=variable, colour=variable))+geom_line(size=1)+geom_point(size=2)+ggtitle("accuracy")
  
  #do same for kap
  kap<-cbind(kap,variation=as.character(1:dim(kap)[1]))
  kap<-melt(kap,variation=index)
  p2<-ggplot(kap,aes(x=variation,y=value,group=variable, colour=variable))+geom_line(size=1)+geom_point(size=2)+ggtitle("kappa")
  
  #plot as multiplot
  multiplot(p1,p2,cols=2)
}




#3
#------------------------------------------------------------------------------------------

#this function plots a histogram of the metrics mean for the simulation of each algorithm
vis_hist<-function(data, binWidth=0.025){
  gg<-ggplot(data)
  p1<-gg+geom_histogram(aes(x=rpart),binwidth = binWidth)+ggtitle("rpart")
  p2<-gg+geom_histogram(aes(x=c50),binwidth = binWidth)+ggtitle("c50")
  p3<-gg+geom_histogram(aes(x=randomForest),binwidth = binWidth)+ggtitle("randomForest")
  p4<-gg+geom_histogram(aes(x=multinom),binwidth = binWidth)+ggtitle("multinom")
  
  #plot all histogramms as multiplot
  multiplot(p1,p2,p3,p4,cols=2)
}









