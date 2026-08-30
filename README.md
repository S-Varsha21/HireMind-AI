# 🧠 HireMind AI

### AI-Powered Placement Intelligence Platform

HireMind AI is an AI-powered placement intelligence platform built with **R and Shiny** to help students understand their career readiness, analyze resumes, identify skill gaps, and discover suitable career paths.

---

## 🚀 Features

### 📄 Resume Analyzer
- Upload a PDF resume
- Extract resume text automatically
- Detect technical skills
- Generate an ATS-style resume score
- Check important resume sections
- Provide resume improvement suggestions

### 🎯 Skill Gap Analysis
- Select a target career role
- Compare student skills with role requirements
- Calculate profile match percentage
- Identify missing skills
- Provide learning recommendations

### 💼 Career Recommendations
- Compare current skills against multiple career roles
- Calculate role-wise match percentages
- Recommend suitable career paths

### 📊 Placement Readiness
- Track profile completion
- Track resume analysis
- Track skill gap analysis
- Track career recommendation progress
- Calculate overall placement readiness

---

## 🛠️ Tech Stack

- **R**
- **Shiny**
- **bslib**
- **pdftools**
- **stringr**
- **Git**
- **GitHub**

---

## 🏗️ Project Structure

```text
HireMind-AI/
│
├── app.R
├── global.R
├── ui.R
├── server.R
├── README.md
├── .gitignore
├── HireMind-AI.Rproj
│
├─modules/
│   ├student_dashboard.R
│   └ resume_analyzer.R
│
├─utils/
│   └skill_data.R
│
├─data/
├─models/
├-reports/
└─www/
