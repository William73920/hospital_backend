import { createError } from "../error.js";
import { db, connection } from "../models/data.js";
import bcrypt from "bcrypt";

export const getHospitalDetails = (req, res, next) => {
  const hospitalId = req.body.hospitalId;
  if (!hospitalId) {
    return next(createError(400, "Hospital ID is required"));
  }

  const checkHospitalQuery = `SELECT * FROM hospitals WHERE hospital_id = ?`;

  db.query(checkHospitalQuery, [hospitalId], (err, results) => {
    if (err) {
      return next(createError(500, "Error fetching hospital details"));
    }

    if (results.length === 0) {
      return next(createError(404, "Hospital not found"));
    }

    const query = `
        SELECT
          h.name AS hospital_name,
          COUNT(DISTINCT psy.psychiatrist_id) AS total_psychiatrists,
          COUNT(DISTINCT pat.patient_id) AS total_patients
        FROM hospitals h
        LEFT JOIN psychiatrists psy ON psy.hospital_id = h.hospital_id
        LEFT JOIN patients pat ON pat.psychiatrist_id = psy.psychiatrist_id
        WHERE h.hospital_id = ?
      `;

    db.query(query, [hospitalId], (err, results) => {
      if (err) {
        return next(createError(500, "Error fetching hospital details"));
      }

      if (results.length === 0) {
        return next(createError(404, "Hospital not found"));
      }

      const hospitalDetails = {
        hospital_name: results[0].hospital_name,
        total_psychiatrists: results[0].total_psychiatrists,
        total_patients: results[0].total_patients,
        psychiatrist_details: [],
      };

      // Fetch psychiatrist details for the hospital
      const psychiatristQuery = `
          SELECT
            psy.psychiatrist_id,
            psy.name AS psychiatrist_name,
            COUNT(pat.patient_id) AS patients_count
          FROM psychiatrists psy
          LEFT JOIN patients pat ON pat.psychiatrist_id = psy.psychiatrist_id
          WHERE psy.hospital_id = ?
          GROUP BY psy.psychiatrist_id
        `;

      db.query(
        psychiatristQuery,
        [hospitalId],
        (psychiatristErr, psychiatristResults) => {
          if (psychiatristErr) {
            console.error(
              "Error executing psychiatrist query:",
              psychiatristErr
            );
            return next(createError(500, "Error executing psychiatrist query"));
          }

          hospitalDetails.psychiatrist_details = psychiatristResults.map(
            (psychiatrist) => ({
              id: psychiatrist.psychiatrist_id,
              name: psychiatrist.psychiatrist_name,
              patients_count: psychiatrist.patients_count,
            })
          );

          res.json(hospitalDetails);
        }
      );
    });
  });
};
