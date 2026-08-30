library(shiny)
library(bslib)
library(pdftools)
library(stringr)

student_dashboard_ui <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    
    tags$style(HTML("
      .dashboard-page {
        background: #f7f9fc;
        padding: 30px 40px;
        min-height: calc(100vh - 70px);
      }

      .dashboard-title {
        font-size: 38px;
        font-weight: 700;
        color: #172b4d;
        margin-bottom: 5px;
      }

      .dashboard-subtitle {
        font-size: 16px;
        color: #667085;
        margin-bottom: 28px;
      }

      .dashboard-card,
      .resume-card,
      .result-card {
        background: white;
        border: 1px solid #e7eaf0;
        border-radius: 14px;
        padding: 24px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06);
      }

      .dashboard-card {
        min-height: 470px;
      }

      .resume-card {
        margin-top: 20px;
      }

      .result-card {
        margin-top: 20px;
      }

      .card-title {
        font-size: 19px;
        font-weight: 700;
        margin-bottom: 20px;
        color: #172b4d;
      }

      .profile-label {
        font-weight: 600;
        color: #344054;
        margin-bottom: 6px;
      }

      .saved-item {
        padding: 12px 0;
        border-bottom: 1px solid #eaecf0;
      }

      .saved-label {
        font-size: 13px;
        font-weight: 600;
        color: #667085;
      }

      .saved-value {
        font-size: 16px;
        font-weight: 600;
        color: #172b4d;
      }

      .feature-card {
        background: white;
        border: 1px solid #e7eaf0;
        border-radius: 14px;
        padding: 24px;
        min-height: 190px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
      }

      .feature-title {
        font-size: 18px;
        font-weight: 700;
        color: #172b4d;
      }

      .feature-text {
        color: #667085;
        margin-top: 8px;
      }

      .progress-container {
        width: 100%;
        height: 18px;
        background: #e9edf3;
        border-radius: 20px;
        overflow: hidden;
        margin: 15px 0 25px 0;
      }

      .progress-bar-custom {
        height: 100%;
        background: linear-gradient(90deg, #2563eb, #7c3aed);
        border-radius: 20px;
      }

      .skill-badge {
        display: inline-block;
        padding: 8px 14px;
        margin: 5px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 600;
      }

      .skill-match {
        background: #dcfce7;
        color: #166534;
      }

      .skill-missing {
        background: #fee2e2;
        color: #b91c1c;
      }

      .skill-detected {
        background: #dbeafe;
        color: #1d4ed8;
      }

      .ats-score {
        font-size: 42px;
        font-weight: 700;
        color: #2563eb;
        margin: 10px 0;
      }

      .ats-label {
        color: #667085;
        font-size: 14px;
      }

      .resume-section {
        margin-top: 20px;
      }

      .resume-section-title {
        font-size: 17px;
        font-weight: 700;
        color: #172b4d;
        margin-bottom: 10px;
      }

      .suggestion {
        padding: 12px 15px;
        margin-top: 8px;
        background: #fff7ed;
        border-left: 4px solid #f97316;
        border-radius: 8px;
        color: #7c2d12;
      }

      .recommendation-box {
        margin-top: 25px;
        padding: 18px;
        background: #eff6ff;
        border-radius: 12px;
        border-left: 4px solid #2563eb;
      }

      .match-score {
        font-size: 32px;
        font-weight: 700;
        color: #2563eb;
      }

      .career-item {
        padding: 16px;
        margin-top: 12px;
        border: 1px solid #e7eaf0;
        border-radius: 12px;
      }

      .career-role {
        font-size: 18px;
        font-weight: 700;
        color: #172b4d;
      }

      .career-score {
        font-size: 16px;
        font-weight: 700;
        color: #2563eb;
        margin-top: 5px;
      }

      .readiness-item {
        padding: 14px;
        margin-top: 10px;
        border-radius: 10px;
        background: #f8fafc;
        border: 1px solid #eaecf0;
      }

      .readiness-title {
        font-weight: 600;
        color: #172b4d;
      }

      .readiness-score {
        float: right;
        font-weight: 700;
        color: #2563eb;
      }

      .resume-result {
        margin-top: 15px;
        padding: 20px;
        background: #f0fdf4;
        border: 1px solid #bbf7d0;
        border-radius: 10px;
      }

      .dashboard-footer {
        text-align: center;
        color: #98a2b3;
        font-size: 13px;
        margin-top: 25px;
      }
    ")),
    
    div(
      class = "dashboard-page",
      
      div(
        class = "dashboard-title",
        "Student Dashboard"
      ),
      
      div(
        class = "dashboard-subtitle",
        "Build your career profile and get personalized placement insights."
      ),
      
      fluidRow(
        
        column(
          width = 6,
          
          div(
            class = "dashboard-card",
            
            div(
              class = "card-title",
              "👤 Your Profile"
            ),
            
            div(
              class = "profile-label",
              "Full Name"
            ),
            
            textInput(
              ns("student_name"),
              NULL,
              placeholder = "Enter your full name"
            ),
            
            div(
              class = "profile-label",
              "Degree"
            ),
            
            selectInput(
              ns("degree"),
              NULL,
              choices = c(
                "B.Tech",
                "B.E.",
                "BCA",
                "MCA",
                "M.Tech",
                "Other"
              )
            ),
            
            div(
              class = "profile-label",
              "Target Role"
            ),
            
            selectInput(
              ns("target_role"),
              NULL,
              choices = names(role_skills)
            ),
            
            div(
              class = "profile-label",
              "Skills"
            ),
            
            textInput(
              ns("skills"),
              NULL,
              placeholder = "Python, SQL, Machine Learning"
            ),
            
            actionButton(
              ns("save_profile"),
              "💾 Save Profile",
              class = "btn-primary"
            )
          )
        ),
        
        column(
          width = 6,
          
          div(
            class = "dashboard-card",
            
            div(
              class = "card-title",
              "📋 Saved Profile"
            ),
            
            div(
              class = "saved-item",
              div(
                class = "saved-label",
                "NAME"
              ),
              div(
                class = "saved-value",
                textOutput(ns("saved_name"))
              )
            ),
            
            div(
              class = "saved-item",
              div(
                class = "saved-label",
                "DEGREE"
              ),
              div(
                class = "saved-value",
                textOutput(ns("saved_degree"))
              )
            ),
            
            div(
              class = "saved-item",
              div(
                class = "saved-label",
                "TARGET ROLE"
              ),
              div(
                class = "saved-value",
                textOutput(ns("saved_role"))
              )
            ),
            
            div(
              class = "saved-item",
              div(
                class = "saved-label",
                "PROFILE SKILLS"
              ),
              div(
                class = "saved-value",
                textOutput(ns("saved_skills"))
              )
            ),
            
            div(
              class = "saved-item",
              div(
                class = "saved-label",
                "RESUME SKILLS"
              ),
              div(
                class = "saved-value",
                textOutput(ns("resume_skills_summary"))
              )
            )
          )
        )
      ),
      
      div(
        class = "resume-card",
        
        div(
          class = "card-title",
          "📄 Resume Analyzer"
        ),
        
        p(
          "Upload your PDF resume and HireMind AI will analyze its structure, skills and ATS readiness."
        ),
        
        fileInput(
          ns("resume"),
          NULL,
          accept = ".pdf",
          buttonLabel = "Choose Resume",
          placeholder = "No resume selected"
        ),
        
        uiOutput(
          ns("resume_analysis")
        )
      ),
      
      fluidRow(
        
        column(
          width = 4,
          
          div(
            class = "feature-card",
            
            div(
              class = "card-title",
              "🎯 Skill Gap"
            ),
            
            div(
              class = "feature-title",
              "Skill Gap Analysis"
            ),
            
            div(
              class = "feature-text",
              "Compare your resume and profile skills with your target role."
            ),
            
            br(),
            
            actionButton(
              ns("analyze_skills"),
              "Analyze Now",
              class = "btn-primary"
            )
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "feature-card",
            
            div(
              class = "card-title",
              "💼 Career"
            ),
            
            div(
              class = "feature-title",
              "Career Recommendations"
            ),
            
            div(
              class = "feature-text",
              "Discover career roles that match your skills."
            ),
            
            br(),
            
            actionButton(
              ns("recommend_jobs"),
              "View Recommendations",
              class = "btn-primary"
            )
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "feature-card",
            
            div(
              class = "card-title",
              "📊 Placement"
            ),
            
            div(
              class = "feature-title",
              "Placement Progress"
            ),
            
            div(
              class = "feature-text",
              "Track your overall placement readiness."
            ),
            
            br(),
            
            actionButton(
              ns("placement_progress"),
              "View Progress",
              class = "btn-primary"
            )
          )
        )
      ),
      
      uiOutput(
        ns("skill_gap_results")
      ),
      
      uiOutput(
        ns("career_results")
      ),
      
      div(
        class = "dashboard-footer",
        "© 2026 HireMind AI. All rights reserved."
      )
    )
  )
}


student_dashboard_server <- function(id) {
  
  moduleServer(id, function(input, output, session) {
    
    profile <- reactiveValues(
      name = "",
      degree = "",
      target_role = "",
      skills = ""
    )
    
    resume_skills <- reactiveVal(character(0))
    
    resume_text_data <- reactiveVal("")
    
    ats_score_value <- reactiveVal(0)
    
    resume_analyzed <- reactiveVal(FALSE)
    
    skill_analyzed <- reactiveVal(FALSE)
    
    career_analyzed <- reactiveVal(FALSE)
    
    
    observeEvent(input$save_profile, {
      
      profile$name <- trimws(input$student_name)
      
      profile$degree <- input$degree
      
      profile$target_role <- input$target_role
      
      profile$skills <- trimws(input$skills)
      
      showNotification(
        "Your profile has been saved!",
        type = "message"
      )
      
    })
    
    
    output$saved_name <- renderText({
      
      if (profile$name == "") {
        "Not saved yet"
      } else {
        profile$name
      }
      
    })
    
    
    output$saved_degree <- renderText({
      
      if (profile$degree == "") {
        "Not saved yet"
      } else {
        profile$degree
      }
      
    })
    
    
    output$saved_role <- renderText({
      
      if (profile$target_role == "") {
        "Not saved yet"
      } else {
        profile$target_role
      }
      
    })
    
    
    output$saved_skills <- renderText({
      
      if (profile$skills == "") {
        "Not saved yet"
      } else {
        profile$skills
      }
      
    })
    
    
    output$resume_skills_summary <- renderText({
      
      detected <- resume_skills()
      
      if (length(detected) == 0) {
        
        "No resume uploaded"
        
      } else {
        
        paste(
          detected,
          collapse = ", "
        )
        
      }
      
    })
    
    
    output$resume_analysis <- renderUI({
      
      req(input$resume)
      
      resume_text <- tryCatch(
        
        {
          
          pages <- pdftools::pdf_text(
            input$resume$datapath
          )
          
          paste(
            pages,
            collapse = "\n"
          )
          
        },
        
        error = function(e) {
          ""
        }
        
      )
      
      
      if (resume_text == "") {
        
        return(
          
          div(
            class = "resume-result",
            
            strong(
              "⚠️ Unable to read this PDF."
            ),
            
            p(
              "Please upload a valid text-based PDF."
            )
            
          )
          
        )
        
      }
      
      
      resume_text_data(resume_text)
      
      
      text_lower <- tolower(
        resume_text
      )
      
      
      skills <- c(
        
        "python",
        "sql",
        "machine learning",
        "deep learning",
        "artificial intelligence",
        "c++",
        "c",
        "java",
        "html",
        "css",
        "javascript",
        "r",
        "data analysis",
        "data analytics",
        "data visualization",
        "data cleaning",
        "data structures",
        "algorithms",
        "operating systems",
        "database",
        "mysql",
        "mongodb",
        "pandas",
        "numpy",
        "scikit-learn",
        "tensorflow",
        "power bi",
        "tableau",
        "excel",
        "git",
        "pytorch"
      )
      
      
      detected_skills <- skills[
        
        sapply(
          
          skills,
          
          function(skill) {
            
            grepl(
              skill,
              text_lower,
              fixed = TRUE
            )
            
          }
          
        )
        
      ]
      
      
      resume_skills(
        detected_skills
      )
      
      
      ats_score <- tryCatch(
        
        {
          
          calculate_ats_score(
            resume_text,
            detected_skills
          )
          
        },
        
        error = function(e) {
          
          0
          
        }
        
      )
      
      
      ats_score_value(
        ats_score
      )
      
      
      resume_analyzed(TRUE)
      
      
      missing_sections <- character(0)
      
      
      if (
        !str_detect(
          text_lower,
          "education"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Education section"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "skills"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Skills section"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "projects"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Projects section"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "experience"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Experience section"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "certification"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Certifications section"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "@"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "Email address"
        )
        
      }
      
      
      if (
        !str_detect(
          text_lower,
          "linkedin"
        )
      ) {
        
        missing_sections <- c(
          missing_sections,
          "LinkedIn profile"
        )
        
      }
      
      
      div(
        
        class = "resume-result",
        
        h3(
          "🤖 Resume Analysis Complete"
        ),
        
        div(
          class = "ats-score",
          paste0(
            ats_score,
            "/100"
          )
        ),
        
        div(
          class = "ats-label",
          "ATS Resume Score"
        ),
        
        div(
          
          class = "progress-container",
          
          div(
            
            class = "progress-bar-custom",
            
            style = paste0(
              "width: ",
              ats_score,
              "%;"
            )
            
          )
          
        ),
        
        div(
          
          class = "resume-section",
          
          div(
            class = "resume-section-title",
            "💻 Skills Detected"
          ),
          
          if (
            length(detected_skills) == 0
          ) {
            
            p(
              "No supported technical skills were detected."
            )
            
          } else {
            
            div(
              
              lapply(
                
                detected_skills,
                
                function(skill) {
                  
                  span(
                    
                    class = "skill-badge skill-detected",
                    
                    paste(
                      "✓",
                      skill
                    )
                    
                  )
                  
                }
                
              )
              
            )
            
          }
          
        ),
        
        div(
          
          class = "resume-section",
          
          div(
            class = "resume-section-title",
            "💡 Resume Improvement Suggestions"
          ),
          
          if (
            length(missing_sections) == 0
          ) {
            
            div(
              
              class = "suggestion",
              
              "🎉 Your resume contains all the major sections checked by HireMind AI."
              
            )
            
          } else {
            
            lapply(
              
              missing_sections,
              
              function(item) {
                
                div(
                  
                  class = "suggestion",
                  
                  paste(
                    "Consider adding:",
                    item
                  )
                  
                )
                
              }
              
            )
            
          }
          
        )
        
      )
      
    })
    
    
    get_all_student_skills <- reactive({
      
      manual_skills <- character(0)
      
      
      if (
        !is.null(input$skills) &&
        input$skills != ""
      ) {
        
        manual_skills <- trimws(
          
          tolower(
            
            unlist(
              
              strsplit(
                input$skills,
                ","
              )
              
            )
            
          )
          
        )
        
      }
      
      
      combined_skills <- unique(
        
        c(
          manual_skills,
          resume_skills()
        )
        
      )
      
      
      combined_skills[
        combined_skills != ""
      ]
      
    })
    
    
    observeEvent(input$analyze_skills, {
      
      student_skills <- get_all_student_skills()
      
      if (
        length(student_skills) == 0
      ) {
        
        showNotification(
          "Please enter skills or upload a resume first.",
          type = "warning"
        )
        
        return()
        
      }
      
      
      req(
        input$target_role
      )
      
      
      required_skills <- role_skills[[input$target_role]]
      
      
      matched_skills <- intersect(
        
        student_skills,
        
        required_skills
        
      )
      
      
      missing_skills <- setdiff(
        
        required_skills,
        
        student_skills
        
      )
      
      
      match_percentage <- round(
        
        length(matched_skills) /
          length(required_skills) *
          100
        
      )
      
      
      output$skill_gap_results <- renderUI({
        
        div(
          
          class = "result-card",
          
          h3(
            "🎯 Your Skill Gap Analysis"
          ),
          
          p(
            "HireMind AI compared your profile skills and resume-detected skills with the requirements of your target role."
          ),
          
          div(
            
            class = "match-score",
            
            paste0(
              match_percentage,
              "% Profile Match"
            )
            
          ),
          
          div(
            
            class = "progress-container",
            
            div(
              
              class = "progress-bar-custom",
              
              style = paste0(
                "width: ",
                match_percentage,
                "%;"
              )
              
            )
            
          ),
          
          h4(
            "✅ Skills You Already Have"
          ),
          
          if (
            length(matched_skills) == 0
          ) {
            
            p(
              "No matching skills found yet."
            )
            
          } else {
            
            div(
              
              lapply(
                
                matched_skills,
                
                function(skill) {
                  
                  span(
                    
                    class = "skill-badge skill-match",
                    
                    paste(
                      "✓",
                      skill
                    )
                    
                  )
                  
                }
                
              )
              
            )
            
          },
          
          br(),
          
          h4(
            "❌ Skills You Need to Learn"
          ),
          
          if (
            length(missing_skills) == 0
          ) {
            
            p(
              "🎉 You currently match all the required skills!"
            )
            
          } else {
            
            div(
              
              lapply(
                
                missing_skills,
                
                function(skill) {
                  
                  span(
                    
                    class = "skill-badge skill-missing",
                    
                    paste(
                      "✗",
                      skill
                    )
                    
                  )
                  
                }
                
              )
              
            )
            
          },
          
          div(
            
            class = "recommendation-box",
            
            h4(
              "💡 HireMind AI Recommendation"
            ),
            
            if (
              length(missing_skills) == 0
            ) {
              
              p(
                
                paste(
                  "Excellent! Your current profile is a strong match for",
                  input$target_role,
                  "."
                )
                
              )
              
            } else {
              
              p(
                
                paste(
                  "To improve your profile for",
                  input$target_role,
                  "focus on:",
                  paste(
                    missing_skills,
                    collapse = ", "
                  ),
                  "."
                )
                
              )
              
            }
            
          )
          
        )
        
      })
      
      
      skill_analyzed(TRUE)
      
    })
    
    
    observeEvent(input$recommend_jobs, {
      
      student_skills <- get_all_student_skills()
      
      
      if (
        length(student_skills) == 0
      ) {
        
        showNotification(
          "Please enter skills or upload a resume first.",
          type = "warning"
        )
        
        return()
        
      }
      
      
      scores <- sapply(
        
        names(role_skills),
        
        function(role) {
          
          required_skills <- role_skills[[role]]
          
          matched_skills <- intersect(
            
            student_skills,
            
            required_skills
            
          )
          
          round(
            
            length(matched_skills) /
              length(required_skills) *
              100
            
          )
          
        }
        
      )
      
      
      scores <- sort(
        
        scores,
        
        decreasing = TRUE
        
      )
      
      
      output$career_results <- renderUI({
        
        div(
          
          class = "result-card",
          
          h3(
            "💼 Career Recommendations"
          ),
          
          p(
            "Career roles ranked according to your current profile and resume skills."
          ),
          
          lapply(
            
            names(scores),
            
            function(role) {
              
              div(
                
                class = "career-item",
                
                div(
                  
                  class = "career-role",
                  
                  role
                  
                ),
                
                div(
                  
                  class = "career-score",
                  
                  paste0(
                    scores[[role]],
                    "% Match"
                  )
                  
                )
                
              )
              
            }
            
          )
          
        )
        
      })
      
      
      career_analyzed(TRUE)
      
    })
    
    
    observeEvent(
      
      input$placement_progress,
      
      {
        
        profile_score <- 0
        
        resume_score <- 0
        
        skill_score <- 0
        
        career_score <- 0
        
        
        if (
          
          profile$name != "" &&
          
          profile$degree != "" &&
          
          profile$target_role != "" &&
          
          profile$skills != ""
          
        ) {
          
          profile_score <- 25
          
        }
        
        
        if (
          resume_analyzed()
        ) {
          
          resume_score <- 25
          
        }
        
        
        if (
          skill_analyzed()
        ) {
          
          skill_score <- 25
          
        }
        
        
        if (
          career_analyzed()
        ) {
          
          career_score <- 25
          
        }
        
        
        readiness_score <-
          
          profile_score +
          resume_score +
          skill_score +
          career_score
        
        
        showModal(
          
          modalDialog(
            
            title = "📊 Placement Readiness",
            
            div(
              
              class = "match-score",
              
              paste0(
                readiness_score,
                "% Ready"
              )
              
            ),
            
            div(
              
              class = "progress-container",
              
              div(
                
                class = "progress-bar-custom",
                
                style = paste0(
                  "width: ",
                  readiness_score,
                  "%;"
                )
                
              )
              
            ),
            
            div(
              
              class = "readiness-item",
              
              span(
                class = "readiness-title",
                "👤 Profile Completed"
              ),
              
              span(
                
                class = "readiness-score",
                
                paste0(
                  profile_score,
                  "%"
                )
                
              )
              
            ),
            
            div(
              
              class = "readiness-item",
              
              span(
                class = "readiness-title",
                "📄 Resume Analyzed"
              ),
              
              span(
                
                class = "readiness-score",
                
                paste0(
                  resume_score,
                  "%"
                )
                
              )
              
            ),
            
            div(
              
              class = "readiness-item",
              
              span(
                class = "readiness-title",
                "🎯 Skill Gap Analysis"
              ),
              
              span(
                
                class = "readiness-score",
                
                paste0(
                  skill_score,
                  "%"
                )
                
              )
              
            ),
            
            div(
              
              class = "readiness-item",
              
              span(
                class = "readiness-title",
                "💼 Career Recommendation"
              ),
              
              span(
                
                class = "readiness-score",
                
                paste0(
                  career_score,
                  "%"
                )
                
              )
              
            ),
            
            footer = modalButton(
              "Close"
            )
            
          )
          
        )
        
      }
      
    )
    
  })
  
}
