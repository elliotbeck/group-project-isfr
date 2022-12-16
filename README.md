Do commodity prices grow faster than global inflation?
==============================

Group project for the course: https://github.com/ipozdeev/it-skills-for-research

We host the solutions to the homework assignments in the group project's folder
homework in the midterm branch.

Team members:
- Chongshuo Zhai
- Ernest Digore
- Wei Liu
- Elliot Beck

Project description
------------
We follow the datascience project structure as proposed by cookie-cutter. 
The Project is implemented using R and Docker. We load data via APIs and therefor
an automatic update of the data, plots, report and the Shiny App is possible. 
The data is stored using git LFS. In the future we plan to work with a cloud 
based database system. 

The update of the data, plots and report can be done running the following commands: 
   1. docker run -v "$(PWD)/data:/data" isfr-data-update
   2. docker run -v "$(PWD)/src/visualization/data:/src/visualization/data/" isfr-analysis
   3. docker run -v "$(PWD)/reports/figures:/reports/figures/" isfr-visualization

The Shiny App, which is implemented using a docker container can be accessed 
by the following command:
   1. docker run --rm -p 3838:3838 isfr-shiny, open on: http://localhost:3838
   
Of course, before the docker run commands can be executed the docker builds have to be 
done as explained in the how-to files stored in the subdirectories. 

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands for python setup
    ├── README.md          <- README file to give an overview about the project.
    │
    ├── dashboard          <- Dokerized shiny app
    │   ├── shiny-app      <- Shiny app 
    │   │   └── app.R
    │   ├── docker-shiny-how-to.txt
    │   └── Dockerfile
    │
    ├── data
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
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
    └── src                <- Source code for use in this project.
        │
        ├── data           <- Scripts to download or generate data
        │   ├── Dockerfile
        │   ├── docker-data-update-how-to.txt
        │   ├── downstream.R
        │   └── upstream.R
        ├── models         <- Scripts to make analysis on correlation between commodity and inflation
        │   ├── Dockerfile
        │   ├── analysis.R
        │   └── docker-analysis-how-to.txt
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            │—— Data
            │—— Dockerfile
            │—— docker-visualization-how-to.txt
            └── visualize.R
            

--------
