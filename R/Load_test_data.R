library(readxl)

#loaded the excel data and skipped the 2 first rows 
raw_data_sheets<-excel_sheets("data/SpcTestData.xlsx")
data_list <- lapply(raw_data_sheets, read_excel, path = "data/SpcTestData.xlsx", skip = 2)

#named the elements of the list to correspond to the sheets in the data
names(data_list) <- raw_data_sheets
