
agregar_vars_covid<-function(dt=ANALITIQUES){
  
  dt =dt_plana_covid3_B 
  
  dt$valor<-ifelse(dt$valor==0,NA,dt$valor)
  #
  ##  Selecciono un unic registre i agrego amb valor valid més proper dins de la finestra 
  
  paco<- dt %>% 
    dplyr::group_by(PATIENT.ID,cod) %>%                                    # Agafo fila tal que dies sigui mínim (Valor mes proper)         
    mutate(
      basal_valor=first(valor),
      mean_valor=mean(valor,na.rm=TRUE),
      max_valor=max(valor,na.rm=TRUE),
      min_valor=min(valor,na.rm=TRUE),
      median_valor=median(valor,na.rm=TRUE),
      count=n())%>%slice(1) %>% 
    dplyr::ungroup()  
  
  
  variable.names(paco)
  
  paco$basal_valor<-ifelse(paco$basal_valor==Inf,NA,paco$basal_valor)
  paco$basal_valor<-ifelse(paco$basal_valor==-Inf,NA,paco$basal_valor)
  
  paco$mean_valor<-ifelse(paco$mean_valor==Inf,NA,paco$mean_valor)
  paco$mean_valor<-ifelse(paco$mean_valor==-Inf,NA,paco$mean_valor)
  
  paco$max_valor<-ifelse(paco$max_valor==Inf,NA,paco$max_valor)
  paco$max_valor<-ifelse(paco$max_valor==-Inf,NA,paco$max_valor)
  
  paco$min_valor<-ifelse(paco$min_valor==Inf,NA,paco$min_valor)
  paco$min_valor<-ifelse(paco$min_valor==-Inf,NA,paco$min_valor)
  
  paco$median_valor<-ifelse(paco$median_valor==Inf,NA,paco$median_valor)
  paco$median_valor<-ifelse(paco$median_valor==-Inf,NA,paco$median_valor)
  
  
  #basal_valor
  #mean_valor
  #max_valor
  #min_valor
  #median_valor
  
  
  print ("Reshaping")
  
  # RESHAPE valors d'Analitiques 
  analitiques.valor <- paco %>%dplyr::select(c("PATIENT.ID","cod","basal_valor")) %>% 
    tidyr::spread(cod,basal_valor)
  colnames(analitiques.valor)[2:7] <- paste(colnames(analitiques.valor)[2:7], "basal", sep = "_")
  
  # RESHAPE mean 
  analitiques.mean <- paco[,c("PATIENT.ID","cod","mean_valor")] %>% 
    tidyr::spread(cod,mean_valor)
  colnames(analitiques.mean)[2:7] <- paste(colnames(analitiques.mean)[2:7], "mean", sep = "_")
  
  # RESHAPE valors d'Analitiques 
  analitiques.min <- paco[,c("PATIENT.ID","cod","min_valor")] %>% 
    tidyr::spread(cod,min_valor)
  colnames(analitiques.min)[2:7] <- paste(colnames(analitiques.min)[2:7], "min", sep = "_")
  
  # RESHAPE Dies 
  analitiques.max <- paco[,c("PATIENT.ID","cod","max_valor")] %>% 
    tidyr::spread(cod,max_valor)
  colnames(analitiques.max)[2:7] <- paste(colnames(analitiques.max)[2:7], "max", sep = "_")
  
  # RESHAPE Dies 
  analitiques.median <- paco[,c("PATIENT.ID","cod","median_valor")] %>% 
    tidyr::spread(cod,median_valor)
  colnames(analitiques.median)[2:7] <- paste(colnames(analitiques.median)[2:7], "median", sep = "_")
  
  
  # RESHAPE Dies 
  analitiques.n <- paco[,c("PATIENT.ID","cod","count")] %>% 
    tidyr::spread(cod,count)
  colnames(analitiques.n)[2:7] <- paste(colnames(analitiques.n)[2:7], "n", sep = "_")
  
  print ("Join: valor+dies")
  
  # JOINT Valors i dies
  analitiques.idp<-analitiques.valor %>% 
    full_join(analitiques.mean, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.min, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.max, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.median, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.n, by=c("PATIENT.ID"))
  
  analitiques.idp
  
  #variable.names(analitiques.valor)
  
  
}



agregar_vars_covid2<-function(dt=ANALITIQUES){
  
  dt=dt_plana_covid4_agr_B
  
  #dt$valor<-ifelse(dt$valor==0,NA,dt$valor)
  #
  ##  Selecciono un unic registre i agrego amb valor valid més proper dins de la finestra 
  
  
  paco<- dt %>% 
    dplyr::group_by(PATIENT.ID,cod) %>%                                    # Agafo fila tal que dies sigui mínim (Valor mes proper)         
    mutate(
      basal_pacient_valor=first(valor),
      mean_pacient_valor=mean(valor,na.rm=TRUE),
      max_pacient_valor=max(valor,na.rm=TRUE),
      min_pacient_valor=min(valor,na.rm=TRUE),
      median_pacient_valor=median(valor,na.rm=TRUE),
      count_pacient_valor=n())%>%slice(1) %>% 
    dplyr::ungroup()  
  
  
  variable.names(paco)
  
  paco$basal_pacient_valor<-ifelse(paco$basal_pacient_valor==Inf,NA,paco$basal_pacient_valor)
  paco$basal_pacient_valor<-ifelse(paco$basal_pacient_valor==-Inf,NA,paco$basal_pacient_valor)
  
  paco$mean_pacient_valor<-ifelse(paco$mean_pacient_valor==Inf,NA,paco$mean_pacient_valor)
  paco$mean_pacient_valor<-ifelse(paco$mean_pacient_valor==-Inf,NA,paco$mean_pacient_valor)
  
  paco$max_pacient_valor<-ifelse(paco$max_pacient_valor==Inf,NA,paco$max_pacient_valor)
  paco$max_pacient_valor<-ifelse(paco$max_pacient_valor==-Inf,NA,paco$max_pacient_valor)
  
  paco$min_pacient_valor<-ifelse(paco$min_pacient_valor==Inf,NA,paco$min_pacient_valor)
  paco$min_pacient_valor<-ifelse(paco$min_pacient_valor==-Inf,NA,paco$min_pacient_valor)
  
  paco$median_pacient_valor<-ifelse(paco$median_pacient_valor==Inf,NA,paco$median_pacient_valor)
  paco$median_pacient_valor<-ifelse(paco$median_pacient_valor==-Inf,NA,paco$median_pacient_valor)
  
  
  #basal_valor
  #mean_valor
  #max_valor
  #min_valor
  #median_valor
  
  #?
  
  print ("Reshaping")
  
  # RESHAPE valors d'Analitiques 
  analitiques.valor <- paco %>% dplyr::select(c("PATIENT.ID","cod","basal_pacient_valor")) %>% 
    tidyr::spread(cod,basal_pacient_valor)
  colnames(analitiques.valor)[2:38] <- paste("basal_pacient_valor",colnames(analitiques.valor)[2:38], sep = "_")
  
  # RESHAPE mean 
  analitiques.mean <- paco[,c("PATIENT.ID","cod","mean_pacient_valor")] %>% 
    tidyr::spread(cod,mean_pacient_valor)
  colnames(analitiques.mean)[2:38] <- paste("mean_pacient_valor",colnames(analitiques.mean)[2:38], sep = "_")
  
  # RESHAPE valors d'Analitiques 
  analitiques.min <- paco[,c("PATIENT.ID","cod","min_pacient_valor")] %>% 
    tidyr::spread(cod,min_pacient_valor)
  colnames(analitiques.min)[2:38] <- paste("min_pacient_valor",colnames(analitiques.min)[2:38], sep = "_")
  
  # RESHAPE Dies 
  analitiques.max <- paco[,c("PATIENT.ID","cod","max_pacient_valor")] %>% 
    tidyr::spread(cod,max_pacient_valor)
  colnames(analitiques.max)[2:38] <- paste("max_pacient_valor",colnames(analitiques.max)[2:38], sep = "_")
  
  # RESHAPE Dies 
  analitiques.median <- paco[,c("PATIENT.ID","cod","median_pacient_valor")] %>% 
    tidyr::spread(cod,median_pacient_valor)
  colnames(analitiques.median)[2:38]  <- paste("median_pacient_valor",colnames(analitiques.median)[2:38], sep = "_")
  
  
  # RESHAPE Dies 
  analitiques.n <- paco[,c("PATIENT.ID","cod","count_pacient_valor")] %>% 
    tidyr::spread(cod,count_pacient_valor)
  colnames(analitiques.n)[2:38] <- paste("count_pacient_valor_",colnames(analitiques.n)[2:38], sep = "_")
  
  print ("Join: valor+dies")
  
  # JOINT Valors i dies
  analitiques.idp<-analitiques.valor %>% 
    full_join(analitiques.mean, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.min, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.max, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.median, by=c("PATIENT.ID")) %>% 
    full_join(analitiques.n, by=c("PATIENT.ID"))
  
  analitiques.idp
  
  #variable.names(analitiques.valor)
  
  
}






