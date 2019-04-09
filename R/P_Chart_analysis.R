dfp <- data_list[["Spc_P"]]
dfp <- dfp %>% select(-X__1)
dfp$month<- 1:nrow(dfp) 
testa<-qic(month, dfp$`Numerator (COUNT)`, dfp$`Denominator (COUNT)`,
    data      = dfp,
    chart     = 'p',
    y.percent = TRUE,
    title     = 'Harmed patients (P chart)',
    ylab      = NULL,
    xlab      = 'Month')
testaa<-testa$data
