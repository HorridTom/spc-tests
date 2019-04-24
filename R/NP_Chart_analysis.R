dfnp <- data_list[["Spc_NP"]]
dfnp <- dfnp %>% select(-X__1)
dfnp$month<- 1:nrow(dfnp) 
np_chart<-qic(month, dfnp$`Numerator (COUNT)`, dfnp$`Denominator (COUNT)`,
             data      = dfnp,
             chart     = 'p',
             multiply = 20,
             y.percent = TRUE,
             title     = 'Harmed patients (P chart)',
             ylab      = NULL,
             xlab      = 'Month')
np_chart_data<-np_chart$data


#save results 
np_chart_results<- np_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(np_chart_results, path = "data-out/np_chart_results.csv")


