Hospital API README

## Overview
This api endpoints registers patients belonging to a particular psychiatric and displays hospital details 

## Major Libraries/Frameworks Used

- **Express.js**: A web application framework for Node.js. Used for building the backend server.
- **mysql2**: A MySQL library for Node.js. Used for interacting with the MySQL database.
- *bcrypt:to hash passwords*


## Getting Started

### Prerequisites
- Node.js (v14 or later)
- MySQL database

### Installation
1. Clone the repository: `git clone https://github.com/<your_username>/<your_project_name>.git`
2. Install dependencies: `npm install`


### Api endpoints
1. POST /api/hospitals/hospitalDetails - fetches hospital details
2. POST /api/patients/registerPatient/:psychiatric id - creates a new patient
3. GET /api/psychiatrists/psychiatristDetails - fetches psychiatric details

###POSTMAN LINK
https://www.postman.com/security-operator-52310458/workspace/assihnment-william/collection/15713654-347f1c7b-6298-4401-90d2-775d47aba63b?action=share&creator=15713654

###predefined psychiatric table (name,id)
      
| Psychiatrist ID | Psychiatrist Name | Hospital ID |
| --------------- | ------------------ | ------------ |
| 1               | Dr. Smith          | 1            |
| 2               | Dr. Johnson        | 2            |
| 3               | Dr. Davis          | 1            |
| 4               | Dr. White          | 2            |
| 5               | Dr. Garcia         | 3            |
| 6               | Dr. Thompson       | 1            |
| 7               | Dr. Miller         | 3            |
| 8               | Dr. Moore          | 2            |
| 9               | Dr. Martin         | 3            |
| 10              | Dr. Clark          | 1            |
| 11              | Dr. Rodriguez      | 2            |
| 12              | Dr. Lewis          | 3            |
| 13              | Dr. Hall           | 1            |
| 14              | Dr. Allen          | 2            |
| 15              | Dr. Young          | 3            |
| 16              | Dr. Hill           | 4            |
| 17              | Dr. Scott          | 4            |
| 18              | Dr. Green          | 4            |
| 19              | Dr. Adams          | 4            |
| 20              | Dr. Baker          | 4            |


### Running the Server
npm start
