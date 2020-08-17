#install.packages('tidyverse')
#install.packages('forecast')
#install.packages('prophet')
#data(package = .packages(all.available = T))

library('tidyverse')
library('forecast')
options(scipen = 999, stringsAsFactors = F)

##### auto.arima #####
plot(co2)

autoarima_fit <- auto.arima(co2)
autoarima_forecast <- forecast(autoarima_fit, h = 60)

plot(autoarima_forecast)

##### arima #####
acf(co2)
pacf(co2)
ar(co2)

arima_fit <- arima(co2, order = c(1L, 1L, 1L),
                   seasonal = list(order = c(1L, 1L, 1L), period = 12))
arima_forecast <- forecast(arima_fit, h = 60)

plot(arima_forecast)

##### prophet #####
library('prophet')

data <- read_csv('https://raw.githubusercontent.com/jbrownlee/Datasets/master/daily-total-female-births.csv')

plot(data, type = 'l')

prophet_model <- prophet(yearly.seasonality = T, daily.seasonality = F,
                         select(data, ds = Date, y = Births))
#fit.prophet(prophet_model)
prophet_forecast <- predict(prophet_model, make_future_dataframe(prophet_model, periods = 50, freq = 'day'))
plot(prophet_model, prophet_forecast)
