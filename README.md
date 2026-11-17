# SoftNexis_SQL_Internship-Task-1-
Basic Data Retrieval, Filtering Queries, & Validation Checks using MySQL for SoftNexis Tech
SQL App: MySQL Workbench 8.0
Database used: employees_sample
Validation Query Result: Total Row Count = 2724, Minimum Salary = 39511, Latest Hire Date = 1999-12-31
Notes: salary > 50000 vs salary >= 50000 - using '>' leaves out anyone earning exactly 50000, while '>=' includes 50000 along with everything higher. 'Between' operator - 'Between' always includes both the start & end values. If I need to exclude the boundary dates or numbers, I will use '>' & '<' instead. 
