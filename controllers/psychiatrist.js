import { createError } from "../error.js";
import { db, connection } from "../models/data.js";
import bcrypt from "bcrypt";

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
