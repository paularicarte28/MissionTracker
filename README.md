﻿
# Mission Tracker 🚀

A web application developed in Java to manage astronauts and space missions, built with JSP, Servlets, and MariaDB.  
This tool allows users to explore key data about historic and future missions as well as the astronauts involved.

---

## 🌌 Features

- List and paginate astronauts and missions
- View detailed information for each record
- Add, update, and delete entries
- Search functionality for missions
- Responsive and clean UI fully in English
- Data stored in a MariaDB relational database
- Web interface built using JSP + Servlets + HTML/CSS (Bootstrap 5)

---

## 🛠 Technologies

- Java 8+
- JSP + Servlets
- Apache Tomcat 9
- MariaDB
- JDBC
- Maven
- Git + GitHub
- Deployed manually on AWS

---

## 👩‍🚀 Database Structure

### `mission` table

| Field        | Type       | Description                  |
|--------------|------------|------------------------------|
| id           | INT        | Primary key (auto-increment) |
| name         | VARCHAR    | Name of the mission          |
| launch_date  | DATE       | Date of launch               |
| objective    | TEXT       | Mission objective            |
| status       | ENUM       | planned / active / completed / cancelled |

### `astronaut` table

| Field        | Type       | Description                  |
|--------------|------------|------------------------------|
| id           | INT        | Primary key (auto-increment) |
| name         | VARCHAR    | Astronaut name               |
| nationality  | VARCHAR    | Country                      |
| role         | VARCHAR    | Role in mission              |
| mission_id   | INT        | Foreign key to `mission`     |

---

## ⚙️ Setup Instructions

### 1. Database setup

Create the database and tables:

```sql
CREATE DATABASE missiontracker;
USE missiontracker;

CREATE TABLE missions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  launch_date DATE NOT NULL,
  objective TEXT,
  status ENUM('planned','active','completed','cancelled') NOT NULL
);

CREATE TABLE astronauts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(50),
  role VARCHAR(50),
  mission_id INT,
  FOREIGN KEY (mission_id) REFERENCES mission(id) ON DELETE SET NULL
);
```

Then insert sample data manually or use our `data.sql` script (if available).

---

### 2. Application setup

Clone the repository:

```bash
git clone https://github.com/paularicarte28/MissionTracker.git
cd MissionTracker
```

Build the project:

```bash
mvn clean install
```

Deploy the generated `MissionTracker.war` file located in the `target/` folder into your Tomcat `webapps/` directory.

---

### 3. Access the application

```bash
http://localhost:8082/MissionTracker/astronautas
http://localhost:8082/MissionTracker/misiones
```

---

## 🚀 Git Workflow

We followed Git Flow conventions and created Pull Requests for each feature branch:

- `feature/list-astronauts`
- `feature/detail-view`
- `feature/create-delete`
- `feature/edit-astronaut`
- `feature/list-missions`
- `feature/search-missions`

The final working version is tagged as `v1.0`.

---

## 🌍 Team

- Raciel Uzcanga
- Paula Ricarte
- Patricia Caamaño

---

## ☁️ Deployment

The application is deployed manually to AWS, using an EC2 instance with Tomcat configured to run the WAR file.

# Mission Tracker 🚀

A web application developed in Java to manage astronauts and space missions, built with JSP, Servlets, and MariaDB.  
This tool allows users to explore key data about historic and future missions as well as the astronauts involved.

---

## 🌌 Features

- List and paginate astronauts and missions
- View detailed information for each record
- Add, update, and delete entries
- Search functionality for missions
- Responsive and clean UI fully in English
- Data stored in a MariaDB relational database
- Web interface built using JSP + Servlets + HTML/CSS (Bootstrap 5)

---

## 🛠 Technologies

- Java 8+
- JSP + Servlets
- Apache Tomcat 9
- MariaDB
- JDBC
- Maven
- Git + GitHub
- Deployed manually on AWS

---

## 👩‍🚀 Database Structure

### `mission` table

| Field        | Type       | Description                  |
|--------------|------------|------------------------------|
| id           | INT        | Primary key (auto-increment) |
| name         | VARCHAR    | Name of the mission          |
| launch_date  | DATE       | Date of launch               |
| objective    | TEXT       | Mission objective            |
| status       | ENUM       | planned / active / completed / cancelled |

### `astronaut` table

| Field        | Type       | Description                  |
|--------------|------------|------------------------------|
| id           | INT        | Primary key (auto-increment) |
| name         | VARCHAR    | Astronaut name               |
| nationality  | VARCHAR    | Country                      |
| role         | VARCHAR    | Role in mission              |
| mission_id   | INT        | Foreign key to `mission`     |

---

## ⚙️ Setup Instructions

### 1. Database setup

Create the database and tables:

```sql
CREATE DATABASE missiontracker;
USE missiontracker;

CREATE TABLE missions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  launch_date DATE NOT NULL,
  objective TEXT,
  status ENUM('planned','active','completed','cancelled') NOT NULL
);

CREATE TABLE astronauts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(50),
  role VARCHAR(50),
  mission_id INT,
  FOREIGN KEY (mission_id) REFERENCES mission(id) ON DELETE SET NULL
);
```

Then insert sample data manually or use our `data.sql` script (if available).

---

### 2. Application setup

Clone the repository:

```bash
git clone https://github.com/paularicarte28/MissionTracker.git
cd MissionTracker
```

Build the project:

```bash
mvn clean install
```

Deploy the generated `MissionTracker.war` file located in the `target/` folder into your Tomcat `webapps/` directory.

---

### 3. Access the application

```bash
http://localhost:8082/MissionTracker/astronautas
http://localhost:8082/MissionTracker/misiones
```

---

## 🚀 Git Workflow

We followed Git Flow conventions and created Pull Requests for each feature branch:

- `feature/list-astronauts`
- `feature/detail-view`
- `feature/create-delete`
- `feature/edit-astronaut`
- `feature/list-missions`
- `feature/search-missions`

The final working version is tagged as `v1.0`.

---

## 🌍 Team

- Raciel Uzcanga
- Paula Ricarte
- Patricia Caamaño

---

## ☁️ Deployment

The application is deployed manually to AWS, using an EC2 instance. The EC2 instance runs Amazon Linux 2023 and has been configurated to:
- Download the full project as a '.zip' file from a public S3 bucket ('https://missionstracker.s3.us-east-1.amazonaws.com/MissionTracker/')
- Install required components: Java 17, Maven and Apache Tomcat manually
