#pick out t chart data
dft <- data_list[["Spc_T"]]

#delete empty column 
dft <- dft %>% select(-X__2)

#create t chart
t_chart<-qic(dft$X__1,
             data  = dft,
             chart = 't',
             title = 'Days between deaths (T chart)',
             ylab  = 'Days',
             xlab  = 'Death #')

#extract data from t chart 
t_chart_data<-t_chart$data
t_chart

#save results from tchart 
t_chart_results<- t_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)
write_csv(t_chart_results, path = "data-out/t_chart_results.csv")
