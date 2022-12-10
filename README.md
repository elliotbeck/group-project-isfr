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

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
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
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── src                <- Source code for use in this project.
        ├── __init__.py    <- Makes src a Python module
        │
        ├── data           <- Scripts to download or generate data
        │   └── make_dataset.py
        │
        ├── features       <- Scripts to turn raw data into features for modeling
        │   └── build_features.py
        │
        ├── models         <- Scripts to train models and then use trained models to make
        │   │                 predictions
        │   ├── predict_model.py
        │   └── train_model.py
        │
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            └── visualize.py
    



--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
