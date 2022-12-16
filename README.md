group-project-dtif
==============================

Group project for the course: https://github.com/ipozdeev/it-skills-for-research

We host the solutions to the homework assignments in the group project's folder homework.

Team members:
- Chongshuo Zhai
- Ernest Digore
- Wei Liu
- Elliot Beck

Final Project
------------

Topic: Do commodity prices grow faster than global inflation?

Procedure:  
   1. Group discussion - time span & viable statistical methods selection  
   2. Tasks Distribution and setting the collaboration environment 
   3. Literature review (to be included in the report as well) 
   4. Data Collection (Yahoo Finance/Bloomberg) and database creation with updated methods
   5. Model Selection (f.i. Regression Analysis) 
   6. Coding (Python/R Studio/Matlab) 
   7. Use Docker to conserve the code 
   8. Development of the interactive app
   9. Report & Presentation (Latex) 

Description:
The Project is implemented using R and Docker. The update of the data, plots, 
report and the Shiny App is done using the following four docker run commands:
   1. docker run -v $(PWD)/data:/data isfr-data-update
   2. docker run -v $(PWD)/src/visualization/data:/src/visualization/data/ isfr-analysis
   3. docker run -v $(PWD)/reports/figures:/reports/figures/ isfr-visualization
   4. docker run --rm -p 3838:3838 isfr-shiny, open on: http://localhost:3838
   
Of course, before the docker run commands can be executed the docker builds have to be done as explained in the how-to files of the subdirectories. 

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    │
    ├── dashboard          <- Dokerized shiny app
    │
    ├── data
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── homework
    │   ├── week1          <- Solutions for the first week
    │   ├── week2          <- Solutions for the second week
    │   ├── week3          <- Solutions for the third week
    │   ├── week4          <- Solutions for the fourth week
    │   ├── week5          <- Solutions for the fifth week
    │   └── week6          <- Solutions for the sixth week
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   ├── presentation.pdf
    │   ├── report.pdf
    │   ├── figures        <- Generated graphics and figures to be used in reporting
    │   └── tex_code       <- LaTeX source code for the report and the beamer slides
    │       ├── presentation
    │       └── report
    │
    ├── src                <- Source code for use in this project.
        │
        ├── data           <- Scripts to download or generate data
        │   |── Dockerfile
        |   |—— docker-data-update-how-to.txt
        |   |—— downstream.R
        |   └── upstream.R
        │
        ├── models         <- Scripts to make analysis on correlation between commodity and inflation
        │   │                
        │   ├── Dockerfile
        │   |── analysis.R
        |   |__ docker-analysis-how-to.txt
        │
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            |
            |—— Data
            |—— Dockerfile
            |—— docker-visualization-how-to.txt
            └── visualize.R
            
      



--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
