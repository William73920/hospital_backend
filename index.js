import express from "express";
import { connection } from "./models/data.js";
import patient from "./routes/patient.js";
import psychiatrist from "./routes/psychiatrist.js";
import hospital from "./routes/hospitals.js";

const app = express();
app.use(express.json());

app.use("/api/patients", patient);

app.use("/api/psychiatrists", psychiatrist);

app.use("/api/hospitals", hospital);

app.use((err, req, res, next) => {
  const status = err.status || 500;
  const message = err.message || "Something went wrong!";
  return res.status(status).json({
    success: false,
    status,
    message,
  });
});

app.listen(3000, () => {
  console.log("server is running");
  connection();
});
