import { createError } from "../error.js";
import { db, connection } from "../models/data.js";
import bcrypt from "bcrypt";

export const getPatientDetails = (req, res, next) => {
  const query = "SELECT * FROM patients";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching patient data:", err);
      next(createError(500, "Error fetching patient data"));
    }
    return res.status(200).json(results);
  });
};

export const registerPatient = (req, res, next) => {
  const id = req.params.psychiatristId;
  const saltRounds = 10;

  try {
    const query = "SELECT * FROM psychiatrists WHERE psychiatrist_id = ?";

    db.query(query, [id], (err, results) => {
      if (err) {
        console.error("Error checking psychiatrist existence:", err);
        return next(createError(500, "Error checking psychiatrist existence"));
      }

      if (results.length <= 0) {
        return next(createError(404, "Psychiatrist not found"));
      } else {
        const {
          name,
          address,
          email,
          phone_number = null,
          password,
          patient_photo,
        } = req.body;

        // Validation
        if (!name || !address || !email || !password || !patient_photo) {
          return next(createError(400, "All fields are required"));
        }

        if (address.length < 10) {
          return next(
            createError(400, "Address must be at least 10 characters long")
          );
        }

        const emailRegex = /^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,4}$/;
        if (!emailRegex.test(email)) {
          return next(createError(400, "Invalid email address"));
        }

        const phoneRegex = /^[0-9]+$/;
        if (phone_number.length < 10 || !phoneRegex.test(phone_number)) {
          return next(createError(400, "Invalid phone number"));
        }

        // Password validation (adjust as needed)
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,15}$/;
        if (!passwordRegex.test(password)) {
          return next(
            createError(
              400,
              "Password must be between 8 and 15 characters long and contain at least one uppercase letter, one lowercase letter, and one number"
            )
          );
        }

        const hashedPassword = bcrypt.hashSync(password, saltRounds);

        // Insert patient data
        const insertQuery = `
    INSERT INTO patients (name, address, email, phone_number, password, patient_photo,psychiatrist_id)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

        db.query(
          insertQuery,
          [
            name,
            address,
            email,
            phone_number,
            hashedPassword,
            patient_photo,
            id,
          ],
          (err) => {
            if (err) {
              console.error("Error inserting patient data:", err);
              return next(createError(500, "Error inserting patient data"));
            }

            return res
              .status(200)
              .json({ message: "Patient registration successful" });
          }
        );
      }
    });
  } catch (error) {
    next(error);
  }
};
