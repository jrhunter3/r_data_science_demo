#install.packages('tidyverse')
#install.packages('forecast')

library('tidyverse')
library('forecast')

forecast::gas
forecast::gold
forecast::taylor
forecast::wineind
forecast::woolyrnq

plot(forecast::gas)

gas_fit_1 <- auto.arima(forecast::gas)
gas_forecast_1 <- forecast(gas_fit_1, h = 60)

plot(gas_forecast_1)
