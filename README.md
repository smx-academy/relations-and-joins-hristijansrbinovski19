[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Uxse-_Z1)

### Homework Assignment: Database Relations, Joins, and Querying


---

#### Task 1: School Database

In this task, you will create a database to store information about a school. The database should include tables for **Students**, **Professors**, and **Subjects**. Follow these detailed instructions:

1. **Define Tables and Columns**:
   - **Students Table**: Include columns such as Student ID, First Name, Last Name, Birth Date, and Enrollment Year.
   - **Professors Table**: Include columns such as Professor ID, First Name, Last Name, Department, and Hire Date.
   - **Subjects Table**: Include columns like Subject ID, Subject Name, and Professor ID (indicating which professor teaches the subject).
   
2. **Set Constraints**:
   - Define primary keys for each table.
   - Use appropriate data types for each column.
   - Add any necessary constraints to maintain data integrity, such as **NOT NULL** constraints where needed.

3. **Relationships**:
   - Establish relationships between the tables, such as associating each subject with a professor through the **Professor ID** column.

4. **Filtering Queries**:
   - Write the following SQL queries to retrieve specific data from the School Database:
      - **Query 1**: Retrieve a list of all students enrolled after a specific year (e.g., 2020).
      - **Query 2**: Find the subjects taught by a particular professor by using the professor's ID.
      - **Query 3**: List all students' names and enrollment years, filtered by department (for example, list all students under a department where professors belong).

---

#### Task 2: Bank Database

For the second task, create a database for a bank. The goal is to store data related to **Clients**, **Accounts**, **Savings**, **Debit Cards**, and **Credits**. For this project, you will define which columns and data types are needed.

1. **Database Overview**:
   - Think through and outline the tables that the bank database should contain. 
   - Each table should focus on storing essential information about clients and their banking activities, including:
      - **Clients**: General client details.
      - **Accounts**: Basic account information.
      - **Savings**: Details specific to savings accounts, if applicable.
      - **Debit Cards**: Information regarding each client’s debit card(s).
      - **Credits**: Details on any loans or credit accounts.

2. **Design Decision**:
   - Define each table's purpose and its key columns. Decide on the relationships between tables (e.g., a client may have multiple accounts or debit cards).
   - Create a clear structure that ensures data integrity and ease of access.

3. **Filtering Queries**:
   - Write the following SQL queries to retrieve specific data from the Bank Database:
      - **Query 1**: List all clients who have more than a specific amount in their savings account (e.g., $10,000).
      - **Query 2**: Retrieve all debit cards issued within a specific date range.
      - **Query 3**: List all clients who have taken credit, along with the credit amount and start date, filtering for credits issued after a specific date (e.g., after 2023).
    
        
BONUS: Try to create a diagram and attach screenshot of it here.

If you have any question or encounter any problems, feel free to contact me on Slack.
