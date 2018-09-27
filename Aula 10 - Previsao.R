> install.packages("Forecast")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
Warning in install.packages :
  package 'Forecast' is not available (for R version 3.5.1)
Warning in install.packages :
  Perhaps you meant 'forecast' ?
  > library(forecast)
This is forecast 8.4 
Want to stay up-to-date? Read the Hyndsight blog:
  https://robjhyndman.com/hyndsight/
  > library(readxl)
> IPCA <- read_excel("C:/EconometriaA/IPCA.xls", col_types = c("date","numeric")) 
> Inflacao <- ts(IPCA$IPCA,start = 2008, frequency = 12)
> AR1 <- arima(Inflacao,order = c(1,0,0))
> AR1

Call:
  arima(x = Inflacao, order = c(1, 0, 0))

Coefficients:
  ar1  intercept
0.4648     0.4404
s.e.  0.0781     0.0513

sigma^2 estimated as 0.09696:  log likelihood = -32.15,  aic = 70.3
> AR2 <- arima(Inflacao, order=c(2,0,0))
> AR2

Call:
  arima(x = Inflacao, order = c(2, 0, 0))

Coefficients:
  ar1     ar2  intercept
0.4342  0.0636     0.4405
s.e.  0.0891  0.0899     0.0544

sigma^2 estimated as 0.09657:  log likelihood = -31.9,  aic = 71.8
> previsao1 <- forecast(AR1, 4)
> previsao1
Point Forecast       Lo 80     Hi 80      Lo 95     Hi 95
Aug 2018      0.3417960 -0.05725649 0.7408485 -0.2685021 0.9520942
Sep 2018      0.3945460 -0.04550140 0.8345934 -0.2784484 1.0675405
Oct 2018      0.4190628 -0.02934812 0.8674738 -0.2667225 1.1048482
Nov 2018      0.4304576 -0.01973958 0.8806548 -0.2580596 1.1189748
> previstoAR1 <- previsao1$fitted
> modelo1 <- data.frame(previstoAR1,Inflacao)
> modelo1 <- ts(modelo1,start = 2008-01, frequency = 12)
> plot(modelo1, main="Previsto e Observado - AR1",
       + plot.type="single",
       + ylab="Data",
       + xlab="Inflação",
       + col=c("Blue","Black"))
> previsao2 <- forecast(AR2, 4)
> previsao2
Point Forecast       Lo 80     Hi 80      Lo 95     Hi 95
Aug 2018      0.3846003 -0.01365917 0.7828597 -0.2244850 0.9936855
Sep 2018      0.4027537 -0.03142739 0.8369347 -0.2612690 1.0667763
Oct 2018      0.4205732 -0.02506585 0.8662122 -0.2609729 1.1021193
Nov 2018      0.4294645 -0.01950556 0.8784346 -0.2571760 1.1161051
> previstoAR2 <- previsao2$fitted
> modelo2 <- data.frame(previstoAR2,Inflacao)
> modelo2 <- ts(modelo2,start = 2008-01, frequency = 12)
> plot(modelo2, main="Previsto e Observado AR2",
       + plot.type="single",
       + ylab="Data",
       + xlab="Inflação",
       + col=c("Red","Black"))
> modeloconjunto <- data.frame(previstoAR1,previstoAR2,Inflacao)
> modeloconjunto <- ts(modeloconjunto,start = 2008-01, frequency = 12)
> plot(modeloconjunto, main="Previsto e Observado AR1, AR2",
       + plot.type="single",
       + ylab="Data",
       + xlab="Inflação",
       + col=c("Blue", "Red","Black"))
> MA1 <- arima(Inflacao,order = c(0,0,1))
> MA2 <- arima(Inflacao,order=c(0,0,2))
> previsao01 <- forecast(MA1, 4)
> previsao01
Point Forecast        Lo 80     Hi 80      Lo 95     Hi 95
Aug 2018      0.2309465 -0.175670998 0.6375640 -0.3909213 0.8528143
Sep 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
Oct 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
Nov 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
> previstoMA1 <- previsao01$fitted
> modelo01 <- data.frame(previstoMA1,Inflacao)
> modelo01 <- ts(modelo01,start = 2008-01, frequency = 12)
> plot(modelo01, main="Previsto e Observado - MA1",
       + t(modelo01, main="Previsto e Observado - MA1", 
           +      plot.type="single",
           + plot.type="single",
           + ylab="Data",
           + xlab="Inflação",
           + col=c("Green","Black"))
       + previsao02 <- forecast(MA2, 4)
       Error: unexpected symbol in:
         "col=c("Green","Black"))
       previsao02"
       > previsao01
       Point Forecast        Lo 80     Hi 80      Lo 95     Hi 95
       Aug 2018      0.2309465 -0.175670998 0.6375640 -0.3909213 0.8528143
       Sep 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
       Oct 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
       Nov 2018      0.4402271 -0.004262149 0.8847164 -0.2395606 1.1200148
       > previstoMA1 <- previsao01$fitted
       > modelo01 <- data.frame(previstoMA1,Inflacao)
       > modelo01 <- ts(modelo01,start = 2008-01, frequency = 12)
       > plot(modelo01, main="Previsto e Observado - MA1",
              + plot.type="single",
              + ylab="Data",
              + xlab="Inflação",
              + col=c("Green","Black"))
       > previsao02 <- forecast(MA2, 4)
       > previsao02
       Point Forecast        Lo 80     Hi 80      Lo 95     Hi 95
       Aug 2018      0.2868967 -0.117941770 0.6917352 -0.3322503 0.9060438
       Sep 2018      0.3954440 -0.046597736 0.8374858 -0.2806005 1.0714885
       Oct 2018      0.4402753 -0.003349799 0.8839004 -0.2381907 1.1187413
       Nov 2018      0.4402753 -0.003349799 0.8839004 -0.2381907 1.1187413
       > previstoMA2 <- previsao02$fitted
       > modelo02 <- data.frame(previstoMA2,Inflacao)
       > modelo02 <- ts(modelo02,start = 2008-01, frequency = 12)
       > plot(modelo02, main="Previsto e Observado AR2", plot.type="single",ylab="Data", xlab="Inflação", col=c("Yellow","Black"))
       > modeloconjunto2 <- data.frame(previstoMA1,previstoMA2,Inflacao)
       > modeloconjunto2 <- ts(modeloconjunto2,start = 2008-01, frequency = 12)
       > plot(modeloconjunto2, main="Previsto e Observado AR1, AR2", plot.type="single",ylab="Data", xlab="Inflação", col=c("Green", "Yellow","Black"))
       > plot(forecast(AR1, 4), main ="Previsao da Inflacao para 2017 - AR1", xlim=c(2017,2019))
       > plot(forecast(AR2, 4), main ="Previsao da Inflacao para 2017 -AR2", xlim=c(2017,2019))
       > save.image("C:/EconometriaA/AULA 10/Comandos.RData")