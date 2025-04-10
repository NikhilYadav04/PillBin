import express from "express";
import {
  check_question,
  check_response,
  submit,
} from "../controller/report.js";
export const reportRouter = express.Router();

//* check user asked question
reportRouter.post("/check-question", check_question);

//* check response
reportRouter.post("/check-response", check_response);

//* report a content
reportRouter.post("/submit", submit);
