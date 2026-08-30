library(shiny)
library(pdftools)
library(stringr)

calculate_ats_score <- function(resume_text, detected_skills) {
  
  score <- 0
  
  text <- tolower(resume_text)
  
  if (
    str_detect(text, "education")
  ) {
    score <- score + 15
  }
  
  if (
    str_detect(text, "skills")
  ) {
    score <- score + 15
  }
  
  if (
    str_detect(text, "projects")
  ) {
    score <- score + 15
  }
  
  if (
    str_detect(text, "experience")
  ) {
    score <- score + 15
  }
  
  if (
    str_detect(text, "certification")
  ) {
    score <- score + 10
  }
  
  if (
    str_detect(text, "email")
  ) {
    score <- score + 10
  }
  
  if (
    str_detect(text, "linkedin")
  ) {
    score <- score + 10
  }
  
  if (
    length(detected_skills) >= 5
  ) {
    score <- score + 10
  }
  
  score
}


extract_resume_text <- function(file_path) {
  
  text <- pdf_text(file_path)
  
  text <- paste(
    text,
    collapse = "\n"
  )
  
  text <- gsub(
    "\\s+",
    " ",
    text
  )
  
  trimws(text)
}
