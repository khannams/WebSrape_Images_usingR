#loading necessary libraries---------------
library(tidyverse)
library(RSelenium)
library(netstat)
library(ralger)
library(readr)
library(here)
library(readxl)
library(stringr)

#importing list of lesions I'am interested in
gl_atlas_les<-read_xlsx(here("Images","George Laskaris- Color Atlas of oral diseases","Gl_atlas_les_img.xlsx"))

#start the remote server
rs_driver_object <-rsDriver(browser = "chrome",
                            chromever = "107.0.5304.18", #default value for chromever is latest. But check your chrome version and then run this code
                            verbose = FALSE, #blocks any messages popping up
                            port = free_port()) 

class(rs_driver_object) #has two further objects, the client and the server. 
#to access server, we need to access client server

#creating client object
remDr<-rs_driver_object$client

#navigating to the interested website
remDr$navigate("https://medone-education.thieme.com/ebooks/1903450#/ebook_1903450_SL74372180")

Sys.sleep(10) #R do not process anything else for 10 seconds while the webpage loads

#accept all cookies
remDr$findElement(using = "id",value = "onetrust-accept-btn-handler")$clickElement()

remDr$maxWindowSize() #to increase size of window


#pulling out the link to all media files for the lesions---------------
for (i in 1:nrow(gl_atlas_les)) {
  search_box<-remDr$findElement(using= "xpath", value='//input[@placeholder="Search within this E-Book"]')
  search_box$clickElement()
  
  #remDr$executeScript('window.scrollTo(0, document.body.scrollHeight);')#Pulling in Java script to scroll down the page
  
  search_box$sendKeysToElement(list(gl_atlas_les$GL_atlas[i], key='enter'))
  Sys.sleep(2)
  
  all_media<-remDr$findElement(using = "link text", value = "All Media results")#getting information about all media results page
  gl_atlas_les$les_href[i]<-all_media$getElementAttribute("href")#extracting the href(URL) of that page
  remDr$navigate("https://medone-education.thieme.com/ebooks/1903450#/ebook_1903450_SL74372180")
  Sys.sleep(2)
}

gl_atlas_les$les_href<-gl_atlas_les$les_href%>%unlist() #unlisting the href so that saved as character

#Pulling the image captions-------------- 
fig_cap<-vector("character", 27)
gl_atlas_les$figcaps<-NA
for (k in 1:nrow(gl_atlas_les)){
  remDr$navigate(gl_atlas_les$les_href[k])
  Sys.sleep(2)
  
  fig_cap<-remDr$findElements(using = "xpath", '//span[@class="new-thumbnail-source"]')
  output<-lapply(fig_cap, function(x) x$getElementText())%>%unlist
  gl_atlas_les$figcaps[k]<-as.data.frame(output)
}

#pulling the image source (SRC)---------------------
fig_src<-vector("character", 27)
gl_atlas_les$img_src<-NA
for (l in 1:nrow(gl_atlas_les)){
  remDr$navigate(gl_atlas_les$les_href[l])
  Sys.sleep(2)
  
  fig_src<-remDr$findElements(using = "xpath", '//img[@class="img-thumbnail-new noBorder"]')
  output_src<-lapply(fig_src, function(x) x$getElementAttribute("src"))%>%unlist
  gl_atlas_les$img_src[l]<-as.data.frame(output_src)
}

#cleaning the SRC variable---------------
gl_atlas_les<-gl_atlas_les%>%
  select(GL_atlas, les_href,img_src,figcaps)%>%
  rename(Caption=figcaps)

#write.csv(gl_atlas_les,here("Images","George Laskaris- Color Atlas of oral diseases",
  #"Gl_atlas_les_img.csv"))

gl_atlas_les$img_src_char<-as.character(gl_atlas_les$img_src)
gl_atlas_les$img_src_char<-gsub("\"","",gl_atlas_les$img_src_char) #removing the \ and inverted comma
src_gl_atlas_les<-separate_rows(gl_atlas_les, img_src_char, sep = ",", convert = T) #separting the image SRC by coma    
src_gl_atlas_les$img_src_char<-gsub(")","",src_gl_atlas_les$img_src_char)
src_gl_atlas_les$img_src_char<-trimws(src_gl_atlas_les$img_src_char, which = "both")

#replacing the /s/ (indication for small image) with/l/ (indication for large size image)
src_gl_atlas_les$img_src_char<-gsub("/s/","/l/",src_gl_atlas_les$img_src_char)

src_gl_atlas<-src_gl_atlas_les%>% #clean data with 
  select(GL_atlas, les_href, img_src_char)
src_gl_atlas_les$img_src_char #always check

#cleaning caption variable--------------
gl_atlas_les$Caption_char<-as.character(gl_atlas_les$Caption)
cap_gl_atlas_les<-gl_atlas_les%>% #separting the image SRC by coma 
  separate_rows( Caption_char, sep = '\",' , convert = T)#%>%
  #select(GL_atlas, Caption_char)%>%
  #view()   
cap_gl_atlas_les$Caption_char<-gsub(")","",cap_gl_atlas_les$Caption_char)
cap_gl_atlas_les$Caption_char<-gsub(' \"',"",cap_gl_atlas_les$Caption_char)
cap_gl_atlas_les$Caption_char<-gsub('\n',"",cap_gl_atlas_les$Caption_char)
cap_gl_atlas_les$Caption_char<-trimws(cap_gl_atlas_les$Caption_char, which = "both")

cap_gl_atlas<-cap_gl_atlas_les%>%
  select(GL_atlas, les_href, Caption_char)

clean_gl_atlas<- as.data.frame(cbind(src_gl_atlas$GL_atlas,
                       src_gl_atlas$les_href,
                       src_gl_atlas$img_src_char,
                       cap_gl_atlas$Caption_char))

clean_gl_atlas<-clean_gl_atlas%>%
  rename(gl_atlas_les = V1,
         les_href =V2,
         src_img = V3,
         Caption=V4)
names(clean_gl_atlas)
class(clean_gl_atlas)
#exporting dataset
#write.csv(clean_gl_atlas,here("Images","George Laskaris- Color Atlas of oral diseases","Gl_atlas_les_img.csv"))


#importing data ----------------
#so that I do not have to runt he code again and wait while the loops run, I extracted the data
clean_gl_atlas<-read_csv(here("Images","George Laskaris- Color Atlas of oral diseases","Gl_atlas_les_img.csv"))

str_length(clean_gl_atlas$src_img[c(sample(clean_gl_atlas$...1, 5, replace = FALSE))]) #all our 59 did a random check

clean_gl_atlas$src_img[1]
clean_gl_atlas$img_save<-str_sub(clean_gl_atlas$src_img, start = 46)
clean_gl_atlas$img_save
class(clean_gl_atlas$img_save)

#downloading the images
for (m in 1:nrow(clean_gl_atlas)) {
  download.file(url=clean_gl_atlas$src_img[m], 
                destfile = here("Images","George Laskaris- Color Atlas of oral diseases",
                                clean_gl_atlas$img_save[m]),
                mode = "wb")
}
