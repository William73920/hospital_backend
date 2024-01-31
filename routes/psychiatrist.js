import express from "express";
import { getPsychiatristDetails } from "../controllers/psychiatrist.js";

const router = express.Router();

router.get("/psychiatristDetails", getPsychiatristDetails);

export default router;
