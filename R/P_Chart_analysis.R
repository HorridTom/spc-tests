dfp <- data_list[["Spc_P"]]
dfp <- dfp %>% select(-X__1)
dfp$month<- 1:nrow(dfp) 
p_chart<-qic(month, dfp$`Numerator (COUNT)`, dfp$`Denominator (COUNT)`,
    data      = dfp,
    chart     = 'p',
    y.percent = TRUE,
    title     = 'Harmed patients (P chart)',
    ylab      = NULL,
    xlab      = 'Month')
p_chart_data<-p_chart$data


#save results 
p_chart_results<- p_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(p_chart_results, path = "data-out/p_chart_results.csv")


