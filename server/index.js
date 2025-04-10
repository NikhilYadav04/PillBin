import express from "express";
import cors from "cors";
import env from "dotenv";
import morgan from "morgan";
import { router } from "./config/route_config.js";
import connectDB from "./services/connectDB.js";
import { reportRouter } from "./route/report.js";

const app = express();
const PORT = process.env.PORT || 3000;

//* Middleware
app.use(cors());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

app.use(morgan("dev")); 

//* define express router
app.use(router);
router.use("/report", reportRouter);

//* Basic route
app.get("/", (req, res) => {
  res.send("Welcome to PillBin Server");
});

//* Connect to DB
connectDB();

//* Connect Server
app.listen(3000, () => {
  console.log("Server started on port 3000");
});
