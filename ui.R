library(shiny)
library(bslib)

ui <- page_navbar(
  
  title = "🧠 HireMind AI",
  
  theme = bs_theme(
    version = 5,
    bootswatch = "flatly"
  ),
  
  nav_panel(
    "Home",
    
    div(
      style = "text-align: center; padding: 100px 20px;",
      
      h1("AI-Powered Placement Intelligence"),
      
      h3(
        "Your career. Your skills. Your future — powered by AI."
      ),
      
      br(),
      
      p(
        "Analyze your skills, discover opportunities, and prepare smarter for your career."
      ),
      
      br(),
      
      actionButton(
        inputId = "get_started",
        label = "Get Started"
      ),
      
      br(),
      br(),
      
      fluidRow(
        
        column(
          width = 4,
          h2("10K+"),
          p("Students")
        ),
        
        column(
          width = 4,
          h2("500+"),
          p("Companies")
        ),
        
        column(
          width = 4,
          h2("95%"),
          p("Profile Match Accuracy")
        )
        
      )
      
    )
  ),
  
  nav_panel(
    "Features",
    
    div(
      style = "text-align: center; padding: 40px;",
      
      h2(
        "Everything You Need for Smarter Placements"
      ),
      
      p(
        "AI-powered tools designed to help students understand, improve, and showcase their potential."
      ),
      
      br(),
      
      fluidRow(
        
        column(
          width = 4,
          
          h3("📄 Resume Analysis"),
          
          p(
            "Upload your resume and receive AI-powered insights about your skills and profile."
          )
        ),
        
        column(
          width = 4,
          
          h3("🎯 Skill Gap Analysis"),
          
          p(
            "Discover the skills you need to improve for your target career."
          )
        ),
        
        column(
          width = 4,
          
          h3("💼 Career Recommendations"),
          
          p(
            "Get personalized job roles and career paths based on your skills."
          )
        )
        
      )
      
    )
  ),
  
  nav_panel(
    "About",
    
    div(
      style = "text-align: center; padding: 60px 20px;",
      
      h2("About HireMind AI"),
      
      br(),
      
      p(
        "HireMind AI is an AI-powered placement intelligence platform designed to help students make smarter career decisions."
      ),
      
      p(
        "The platform analyzes student skills, resumes, career goals, and job requirements to provide personalized placement insights."
      )
      
    )
  ),
  
  nav_panel(
    "Login",
    
    div(
      style = "max-width: 500px; margin: 60px auto;",
      
      h2(
        "Login to HireMind AI"
      ),
      
      br(),
      
      textInput(
        inputId = "email",
        label = "Email",
        placeholder = "Enter your email"
      ),
      
      passwordInput(
        inputId = "password",
        label = "Password",
        placeholder = "Enter your password"
      ),
      
      actionButton(
        inputId = "login",
        label = "Login"
      )
      
    )
  ),
  
  nav_panel(
    "Student Dashboard",
    
    student_dashboard_ui("student")
    #puts the dashboard module we created into the application.
    
  )
  
)