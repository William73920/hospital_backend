import mysql from "mysql2";
import { data } from "../seed.js";

export const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "backend_assignment",
});
export const connection = () =>
  db.connect((err) => {
    if (err) {
      console.error("Error connecting to MySQL:", err);
      return;
    }
    console.log("Connected to MySQL");

    // Create hospitals table if not exists
    const createHospitalsTableQuery = `
        CREATE TABLE IF NOT EXISTS hospitals (
          hospital_id INT AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          UNIQUE KEY unique_hospital_name (name)
        )
      `;

    // Insert predefined data into hospitals table
    const insertHospitalsDataQuery = `
        INSERT IGNORE INTO hospitals (name) VALUES
          ('Apollo Hospitals'),
          ('Jawaharlal Nehru Medical College and Hospital'),
          ('Indira Gandhi Institute of Medical Sciences (IGIMS)'),
          ('AIIMS - All India Institute Of Medical Science')
      `;

    // Execute create hospitals table query
    db.query(createHospitalsTableQuery, (createHospitalsErr) => {
      if (createHospitalsErr) {
        console.error("Error creating hospitals table:", createHospitalsErr);
      } else {
        console.log("Hospitals table created or already exists");

        // Execute insert hospitals data query
        db.query(insertHospitalsDataQuery, (insertHospitalsErr) => {
          if (insertHospitalsErr) {
            console.error(
              "Error inserting hospitals data:",
              insertHospitalsErr
            );
          } else {
            console.log("Predefined data inserted into hospitals table");
            createPsychiatristsTable();
            createPatientsTable();
          }
        });
      }
    });

    const createPsychiatristsTable = () => {
      const createPsychiatristsTableQuery = `
        CREATE TABLE IF NOT EXISTS psychiatrists (
          psychiatrist_id INT AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          hospital_id INT,
          UNIQUE KEY unique_hospital_name (name),
          FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
        )
      `;

      //creating default psychiatrists records

      const insertPsychiatristsDataQuery = `INSERT IGNORE INTO psychiatrists (name, hospital_id) VALUES
      ('Dr. Smith', 1),
      ('Dr. Johnson', 2),
      ('Dr. Davis', 1),
      ('Dr. White', 2),
      ('Dr. Garcia', 3),
      ('Dr. Thompson', 1),
      ('Dr. Miller', 3),
      ('Dr. Moore', 2),
      ('Dr. Martin', 3),
      ('Dr. Clark', 1),
      ('Dr. Rodriguez', 2),
      ('Dr. Lewis', 3),
      ('Dr. Hall', 1),
      ('Dr. Allen', 2),
      ('Dr. Young', 3), 
      ('Dr. Hill', 4),
      ('Dr. Scott', 4),
      ('Dr. Green', 4),
      ('Dr. Adams', 4),
      ('Dr. Baker', 4)
      ON DUPLICATE KEY UPDATE name=VALUES(name), hospital_id=VALUES(hospital_id);`;

      db.query(createPsychiatristsTableQuery, (createPsychiatristsErr) => {
        if (createPsychiatristsErr) {
          console.error(
            "Error creating psychiatrists table:",
            createPsychiatristsErr
          );
        } else {
          console.log("Psychiatrists table created or already exists");
          db.query(insertPsychiatristsDataQuery, (insertPsychiatristsErr) => {
            if (insertPsychiatristsErr) {
              console.error(
                "Error inserting psychiatrists data:",
                insertPsychiatristsErr
              );
            } else {
              console.log("Predefined data inserted into psychiatrists table");
            }
          });
        }
      });
    };

    // Create psychiatrists table if not exists
    const createPatientsTable = () => {
      const createPatientsTableQuery = `
      CREATE TABLE IF NOT EXISTS patients (
        patient_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        address VARCHAR(255) CHECK (LENGTH(address) >= 10) NOT NULL,
        email VARCHAR(255) CHECK (email REGEXP '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,4}$') NOT NULL,
        phone_number VARCHAR(20) CHECK (LENGTH(phone_number) >= 10 AND phone_number REGEXP '^[0-9]+$'),
        password VARCHAR(255)  NOT NULL,
        patient_photo VARCHAR(255) NOT NULL,
        psychiatrist_id INT,
        FOREIGN KEY (psychiatrist_id) REFERENCES psychiatrists(psychiatrist_id)
      )
    `;

      db.query(createPatientsTableQuery, (createPatientsErr) => {
        if (createPatientsErr) {
          console.error("Error creating Patients table:", createPatientsErr);
        } else {
          console.log("Patients table created or already exists");
        }
      });
    };
  });
