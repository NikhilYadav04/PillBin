import { response } from "express";
import mongoose from "mongoose";

const reportSchema = new mongoose.Schema({
  question: {
    type: String,
    required: true,
  },
  response: {
    type: String,
    required: true,
  },
  date: {
    type: String,
    required: true,
  },
  type: {
    type: String,
    required: true,
  },
});

export const Report = mongoose.model("Reports", reportSchema);
