import express from "express";
import { getPatientDetails, registerPatient } from "../controllers/patients.js";

const router = express.Router();

router.get("/patientDetails", getPatientDetails);

router.post("/registerPatient/:psychiatristId", registerPatient);

export default router;
