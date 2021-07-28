
### Generació d'informe




rmarkdown::render("codi/2_analisi_COVID2C.Rmd", 
                  output_file = here::here("resultats",paste0("InformeCOVID_",Sys.Date()))
                  
                  )