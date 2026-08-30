source("global.R")

source("utils/skill_data.R")

source("modules/student_dashboard.R")

source("ui.R")

source("server.R")

shinyApp(
  ui = ui,
  server = server
)