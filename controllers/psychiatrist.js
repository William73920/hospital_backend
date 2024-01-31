import { createError } from "../error.js";
import { db } from "../models/data.js";

export const getPsychiatristDetails = (req, res, next) => {
  const query = "SELECT * FROM psychiatrists";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching patient data:", err);
      next(createError(500, "Error fetching pschiatrist data"));
    }
    return res.status(200).json(results);
  });
};
