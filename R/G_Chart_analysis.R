dfg <- data_list[["Spc_G"]]
dfg <- dfg %>% select(-X__2)

g_chart<- qic(dfg$X__1,
                  data  = dfg,
                  chart = 'g',
                  title = 'Surgeries between deaths (G chart)',
                  ylab  = 'Count',
                  xlab  = 'Death #')
g_chart_data<-g_chart$data
g_chart


g_chart_results<- g_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(g_chart_results, path = "data-out/g_chart_results.csv")
