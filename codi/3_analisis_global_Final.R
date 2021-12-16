
# [15.12.2021]


#Dear Didac,
#That’s great as this simplifies the next steps.
#When the results are produced by the glm function, 
#the standard error output is on the log-scale and 
#there are two different ways to calculate the 95%CI (this is an example: https://stats.idre.ucla.edu/r/dae/logit-regression/). It would be good to clarify with your team this further point.
#Alternatively, if that’s is ok with you, 
#is it possible to share the output of the results from R, 
#with coefficients and standard errors as in summary(mylogit) in the above linked example?
#Thanks again,
#Francesco

#Benvolgut Didac,
#Això és genial, ja que això simplifica els passos següents.
#Quan els resultats són produïts per la funció glm, 
#la sortida d'error estàndard es troba a l'escala logarítmica 
#i hi ha dues maneres diferents de calcular l'IC del 95% 
#(aquest és un exemple: https://stats.idre.ucla.edu/). r/dae/logit-regression/).
#Seria bo aclarir amb el vostre equip aquest punt més.
#Alternativament, si us convé, 
#és possible compartir la sortida dels resultats de R, 
#a#mb coeficients i errors estàndard com es mostra en resum (mylogit) a l'exemple enllaçat anterior?
  


#Hola Ray , para el estudio de Ieca covid nis piden calcular el error estándar para lo intervalos de confianza de OR, 

#Gracias
#B


#Table 2: Results of stepwise multivariable analysis 
#for those with complete data for all variables using death as the outcome separated by country. 
#(Model 4 was not completed for Spain due to lack of ethnicity data.)
#


#[*]#
#ACEi/ARB only 
#Statin only 
#Both ACEi/ARB and Statin



#1-->[*]+Age + gender + diabetes type + macrovascular disease
#2-->[*]+Model 1 + Hypertension
#3-->[*]+Model 2 + CKD
#4-->[*]+Model 3 + ethnicity







########################################################################################
#
#25.10.2021
#
#He revisado el Excel, 
#había códigos que no son o no los consideramos complicaciones macro vasculares, 
#como por ejemplo aneurismas, habitualmente se incluyen:
#
#
#-arteriopatías periféricas
#-insuficiencia cardiaca
#-AVC
#-cardiopatía isquémica
#He quitado las aneurismas…
#Lo de E78.2 me parece ok que este dentro de agrupador de hiperlipidemias
#
#
########################################################################################
##Te acuerdas el primer análisis que hicimos de covid para los de UK, 
#respecto la mortalidad en la primera y segunda ola, pues ahora nos piden mas cosas, 
#hacer los mismo pero solo para los pacientes DM2. Te adjunto la tabla , 
#creo que va a ser sencillo sacar los datos, 
#pero nos piden desglosar el tratamiento ADO y las insulinas por fármacos. 
#Si me pasas el Excel de agrupadores para este proyecto te lo hago en un momento
########################################################################################

##
#Adjunto el Excel con los agrupadores, están en AGR 3 (columna H) todos creados,
#INSULINAS_MIX+otrosADO
#
#
#
#-DM1   4 (0.99%)
#-DM2  402 (99.0%)
#tal como se ha hecho en el análisis anterior  tiene que cuadrar el numero de casos, 
#tu población para análisis es 406 pacientes
#El resto de variables las tienes creadas:
#
#
#
########################################################################################
#Hipertensión,
#Dislipemia,
#HbA1c
#CKD

#Luego tienes que desglosar Macrovasculares en:

#Arteriopatía periférica agrupador:
#ARTER_PER

#AVC:
#AVC

#Cardiopatia isquémica
#CI

#Insuficiencia cardiaca
#INSUF_CARD

#Luego microvasculares:
  
  
#Retinopatía:
#agr2b:#RET_DM

#Neuropatía:
#Neuro_DM

#Nefropatía:
#NEFRO_DM



#16.09.2021#

##############################################################################################
#FET 6.9.2021 --> dos grups : i ) 402 (dm1)  / ii) 406 (dm2+dm1)
#2_analisi_COVID2E.Rmd+2_analisi_COVID2F.Rmd
##############################################################################################
#
#
#Prefería que lo comentásemos, pero es importante tener en cuenta que nosotros no participamos
#en el artículo de Microascular porqué no tenemos los datos (no podemos tener datos de retinopatía, ni neuropatía,
#y los de nefropatía son muy incompletos).
#Por tanto, nuestros pacientes tienen que constar como missing de microvascular
#y no se puede incluir esta variable en los modelos
#en relación a los tipos de diabetes, se puede dar el dato, pero no se puede analizar por tipo de diabetes
#por eso prefería que lo comentásemos
#Mírate el que hizo Gemma Llauradó, solo su cohorte (no la de Sant Pau)
#tiene datos de microvascular y el resto los hace constar como missing
#En nuestro caso, la información de HM Hospitales es muy incompleta y 
#hay que asumir que no tenemos datos fiables de microvascular 
#a ver qué te parece
#
#
#
#Habrá que hacer modelos excluyendo
#la variable complicaciones microvasculares
#y solo con DM2 y otro modelo con variable  DM conjunta (todos tipos de diabetes conjuntamente).

#V) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4] +(Diabetes)[5]+(Macrovascular)[6] +(Hypertension)[7]
#Vi) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4] +(DM2)[5]+(Macrovascular)[6] +(Hypertension)[7]





#i) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4] +(Type.Of.Diabetes)[5]+(Microvascular)[6] +(Macrovascular)[7] +(Hypertension)[8]
#ii) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4] +(Diabetes)[5]+(Microvascular)[6] +(Macrovascular)[7] +(Hypertension)[8]
#iii) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4]  +(ARB)[5]+(Type.Of.Diabetes)[6]+(Microvascular)[7] +(Macrovascular)[8] +(Hypertension)[9]
#iv) Death ~(Age.At.Admission)[1] +  (Sex)[2] +(Statin)[3]+(ACE-I)[4]  +(ARB)[5]+(Diabetes)[6]+(Microvascular)[7] +(Macrovascular)[8] +(Hypertension)[9]




#Cuando puedas el lunes , 
#por favor si puedes descargar los datos de hospitales HM hasta 20/07/2020, 
#se tienen que actualizar con la base de datos que teníamos hasta 24/04/2020, te adjunto las claves de acceso:
  
#Subject: COVIDDSL Access

#Se ha permitido el acceso al dataset / You have been granted access to the dataset:
  
## -          Protocolo / Protocol: FTP
## -          Cifrado / Encryption: FTP implícito sobre TLS/ Implicicit FTP over TLS
## -          Servidor / Server: covid19.hmhospitales.com<http://covid19.hmhospitales.com>
## -          Puerto / Port: 990
## -          Usuario / user: TZP23K
## -          Contraseña / Pwd: nHS9rTDu*xSq
## -          Herramientas probadas / Tested tools: Filezilla Client, Win SCP

#hay unos 2500 pacientes mas
















##############
#[25.06.2021]#
##############
#
#
#
#
#Revisare el catalogo, un par de comentarios:
#Nos piden las medias para la mayoría de las variables numéricas,
#( edad , presión diastólica/sistólica,  glucosa, etc) ahora mismo en el informe tenemos las medias

#Luego cortis, solo quieren porcentaje de gente que han tomado Dexametasona,

#Falta mortalidad diabetes,









#Hola Ray
#Ya lo tengo, te he creado agrupadores para las tres analisis que se quieren hacer
#
#Colaboración con Oxford,
#Estudio de estatinas/ARB/IECAS
#Estudio de complicaciones macrovasculares /microvasculares




#Comparison of inpatient clinical outcomes between wave 1 and
#wave 2 during the COVID-19 pandemic in a large UK hospital

#Methods

#Wave 1: data collected from 01/01/2020 – 30/06/2020
#Wave 2: data collected from 01/07/2020 – 31/03/2021


##Table 1. Clinical characteristics and outcomes Wave 1 vs Wave 2.

#Clinical features Agrupador Wave 1(N=) Wave 2(N=) P-value

#Demographics
#
#Sex M, n(%)
#Mean Age years(SD)
#Type of diabetes,n(%)(DM2,DM1)
#
#Vital signs

#Diastolic Blood Pressure#TA_MIN_ING.INPAT

#Systolic BloodPressure#TA_MAX_ING.INPAT

#Heart Rate#FC.HR_ING.INPAT

#Oxygen Saturation#SAT_02_ING.INPAT

#Temperature#Tympanic#TEMP_ING.INPAT

#Laboratory tests

#Blood glucose Agr:#Glucosa

#Medication

#Dexamethasone,n(%)agr 3: CORTIS solo H02AB02[OK]

#Remdesivir, n(%)

#agr 3: ANTI_VIR solo J05AB
#NUCLEàSIDOS Y
#NUCLEàTIDOS,
#EXCL. INHIBIDORES
#DE LA
#TRANSCRIPTASA
#REVERSA
#ACICLOVIR
#GANCICLOVIR
#VALACICLOVIR
#VALGANCICLOVIR

#Outcomes

#Death total

#Death diabetes













# s'ha de fer 3 grups (DM1)+(DM2)+(DM->Glicada/Farmacs)-- ((1_lectura_COVID !))



#Grupo Stress, Glicemia >550!

##############
# 19.05.2021 #
##############

#Gracias Ray, 
#creo que no te llego el comentario de Google doc, pero, lo que decía Didac es crear 2 grupos:

#Punto 1.

#solo habrá que tener 2 grupos:  

#Un grupo de preexisting diabetes que incluye: 
# sujetos con código diagnostico de DM y/o tratamiento y/o glicada (HbA1C=>6.5) 

#Grupo con stress hiperglicemia, 
#que incluye  los pacientes con serum glucose en inclusion >=200 y /o inslulin en primeros 24 h ,

#Ojo: excluyendo los sujetos con código diagnostico de DM y/o tratamiento y/o glicada (HbA1C=>6.5)

#Tienen que ser excluyentes y sumar el numero total que tenemos de DM ahora 448






#Nos acercamos a la fecha para entregar las respuestas (30 de mayo), 
#yo este fin de semana me dedicare todo lo que pueda. 
#Ray por favor si nos puedes enviar los datos que se tenían que calcular?
#Mònica si te puedo ayudar en algo me lo dices, queréis que hagamos una TC 
#la semana que viene repasando lo que nos ha quedado pendiente?

#Hola Ray,
#He visto los informes, gracias, 
#una duda…del primer informe para la respuesta a los revisores, 
#estos 256 pacientes que salen en la tabla entiendo que también incluyen los que tienen código diagnostico de DM? 
#Lo puedes comprobar,
#TABLA 6iii.Eventos y complicaciones.DM administrados Insulina +Glucosa Màxima>=200.
#cuanto de estos pacientes no tienen código de DM pero solo glucosa >=200?

#########################################################################################
#DM subjects by serum glucose at inclusion ≥200 N=256
#Bogdan VlachoNou
#@raypuig@gmail.com , se tiene que calcular , excluyendo los que tienen código DM
#S'ha assignat a l'usuari actual
#########################################################################################



############
#14.05.2021#
############
rm(list=ls())
#https://www.pauloldham.net/importing-csv-files-into-r/
#
#[23.4.2021]
#
#ultims dubtes:  01.04.2021--> 20:00
#Hola Ray
#


#Cuando puedas por favor de la base de datos de covidHM 
#si puedes sacar la N y % 
#de pacientes con códigos E10 (DM1) ,y pacientes con códigos E11 (Dm2)?
#
#Gracias
#
#B
#
# s'ha de fer 3 grups (DM1)+(DM2)+(DM->Glicada/Farmacs)
##########################
# 08//03//2021  22:30    #
##########################
#
#feina:
#
#Me puedes confirmar si la glucemia es la del ingreso, 
#antes de iniciar el tratamiento de  en el estudio con covid hospitales?
#
#Esta variable s(max_pacient_valor_GLU_), que nombre le puedo poner mas corto?
#Y es normal que no tenga intervalos de confianza?

#s(glucosa), no pongas ningún coeficiente, 
#pues no tiene interpretación entendible para un clínico. 
#Solamente se puede interpretar viendo la curva

##########################
#Hola Ray , 
#He parlat avuí amb la Mònica, 
#que està redactant l'article del COVID, 
#i ens demana si podem fer uns canvis en els anàlisis. 
#Et comento: 
#Es tracta de refer 
#les figures dels Splines 
#de la glucosa en front Mortalitat y VM (Global sense grups).  
#Farem les dues versus probabilitat predita (model final). 
#I canviarem el grau de curvatura 
#y el rang de valors pq no es vegi que cau partir d'un rang de valors.
#Segons lo parlat amb la Mònica es el que he entes 
#(Si no és així Mònica em pots corretgir)
#Mirat-ho i ho parlem demà 
##########################
#
#
#
#
#
#
#i)         Causes--> quins organs afecta el Virus!
#ii)        Si té patologies prèvies incrementa la Mortalitat i/o UCI i/o V.M.
#ii)        L'Edat l'influeix, o és més pel detoriament de la persona, per patològies prèvies.
#iii)       Quines Mascaretes es poden fer servir i quan duran?
#iv)        Entarrements antisocials i per què?
#v)         Cost d'un entarrament, VERGONYA AJUNTAMENT DE BARCELONA!.
#Vi....................................... pensar-ho!
#
#
##############################################################################
#Hola a tots,
#Sí, es tractaria de fer les splines (mortalitat i mortalita o IVM), 
#que són les figures en blanc i negre, 
#canviant el grau de curvatyra perquè hi ha poques observacions
#a partir de 500 i crec que pot ser la causa de la caiguda a partir dels 550 de la mortalitat.
#Tot i que el 95% CI és molt ampli, 
#no té sentit clínic que valors extrems de glucèmia s’associïn a menys mortalitat.
##############################################################################
#Per altra banda,
#la figura en color dels valors predits 
#de % de moratlitat en funció de la glicèmia està molt bé, 
#és el que serà més fàcil que entenguin els clínics,
#però potser seria millor fer-la amb la població total 
#(no estratificat per obesitat) i fer-la també per mortalitat i/o IVM. 
##############################################################################
#En resum, 4 figures noves (3 recalculades i una nova.
#No sé si m’explico, Ray, però si necessites aclariments em fas un truc. Gràcies a tots dos!!
#                             
#Mònica Gratacòs, MD, PhD
#Scientific and Medical Writing Services
#Tel: +34 93 4658697 / +34 639099294
#monica.gratacos@gmail.com
##############################################################################






######################
#vers1:: [25_04_2020]#
######################
rm(list=ls())
library("dplyr")
library("lubridate")
#library("expss")
library("frequency")
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("base")
library("table1")
# load package
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("mgcViz")
dir_dades_origen="../../DADES/COVID_19/24_04_2020"
#
rmarkdown::render(input="./codi/1_lectura_COVID.Rmd",
                  output_file=paste0(here::here("resultats/informe_lectura_1_"),Sys.Date()),
                  params = list(dir_dades_origen=dir_dades_origen))
######################################################################
rmarkdown::render(input="./codi/2_analisi_COVID.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_1A_",Sys.Date())))






######################
#vers2:: [20_07_2020]#
######################
#
#
rm(list=ls())
library("dplyr")
library("lubridate")
library("frequency")
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("base")
library("table1")
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("mgcViz")
dir_dades_origen="../../DADES/COVID_19/20_07_2020"



#rmarkdown::render("codi/2_analisi_COVID2C.Rmd", 
#                  output_file = here::here("resultats",paste0("InformeCOVID_",Sys.Date()))
#                  
#)

rmarkdown::render(input="./codi/1_lectura_COVID2.Rmd",
                  output_file=paste0(here::here("resultats/informe_lectura_2_"),Sys.Date()),
                  params = list(dir_dades_origen=dir_dades_origen))
######################################################################
rmarkdown::render(input="./codi/2_analisi_COVID2A.Rmd",
                  output_file=paste0(here::here("resultats/informe_exploratori_2A_"),Sys.Date()))

rmarkdown::render(input="./codi/2_analisi_COVID2B.Rmd",
                  output_file=paste0(here::here("resultats/informe_exploratori_2B_"),Sys.Date()))

rmarkdown::render(input="./codi/2_analisi_COVID2C.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_2C_",Sys.Date())))

rmarkdown::render(input="./codi/2_analisi_COVID2D.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_2D_",Sys.Date())))

rmarkdown::render(input="./codi/2_analisi_COVID2E.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_2E_",Sys.Date())))

rmarkdown::render(input="./codi/2_analisi_COVID2F.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_2F_",Sys.Date())))

rmarkdown::render(input="./codi/2_analisi_COVID2G.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_2G_",Sys.Date())))







######################
#vers3:: [19_04_2021]#
######################
rm(list=ls())
rm(list=ls())
library("dplyr")
library("lubridate")
library("frequency")
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("base")
library("table1")
library("sjPlot")
library("sjmisc")
library("sjlabelled")
library("mgcViz")
dir_dades_origen="../../DADES/COVID_19/19_04_2021"
rmarkdown::render(input="./codi/1_lectura_COVID3.Rmd",
                  output_file=paste0(here::here("resultats/informe_lectura_3_"),Sys.Date()),
                  params = list(dir_dades_origen=dir_dades_origen))
######################################################################
rmarkdown::render(input="./codi/2_analisi_COVID3.Rmd",
                  output_file = here::here("resultats",paste0("informe_exploratori_3A_",Sys.Date())))



#CODIS!!
#
#
#
#
#  
#  
#
#
#
#
#
#
############################################################################################
#problemas_salut1_TOTAL<-problemas_salut1a%>% 
#  bind_rows(problemas_salut1b)%>%  
#   bind_rows(problemas_salut1c)%>%arrange(cod)%>%
#  group_by(cod)%>%
#  slice(1)%>%
#  ungroup()%>%as.vector()
############################################################################################
#problemas_salut2_TOTAL<-problemas_salut2a%>% 
#  bind_rows(problemas_salut2b)%>%  
#  bind_rows(problemas_salut2c)%>%arrange( ID_ATC5 )%>%
#  group_by( ID_ATC5 )%>%
#  slice(1)%>%
#  ungroup()%>%as.vector()
############################################################################################
#problemas_salut3_TOTAL<-problemas_salut3a%>% 
#  bind_rows(problemas_salut3b)%>%  
#  bind_rows(problemas_salut3c)%>%arrange(ID_ATC7)%>%
#  group_by(ID_ATC7)%>%
#  slice(1)%>%
#  ungroup()%>%as.vector()
############################################################################################
#write.csv(problemas_salut1_TOTAL, file="problemas_salut1_TOTAL.csv")
#write.csv(problemas_salut2_TOTAL, file="problemas_salut2_TOTAL.csv")
#write.csv(problemas_salut3_TOTAL, file="problemas_salut3_TOTAL.csv")
############################################################################################
#write.table(problemas_salut1_TOTAL, sep="\t", row.names=FALSE)
#write.table(problemas_salut2_TOTAL, sep="\t", row.names=FALSE)
#write.table(problemas_salut3_TOTAL, sep="\t", row.names=FALSE)
############################################################################################




