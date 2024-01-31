import express from "express";
import { getHospitalDetails } from "../controllers/hospital.js";

const router = express.Router();

router.post("/hospitalDetails", getHospitalDetails);

export default router;
