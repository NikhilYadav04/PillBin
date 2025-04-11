import { bannedWords } from "../helper/list.js";
import { Report } from "../model/reportMode.js";

export const submit = async (req, res) => {
  try {
    //* get the data from req body
    const { question, response, type, date } = req.body;

    const report = await Report.findOne({ question, response });

    if (report) {
      return res.status(403).json({
        success: false,
        message: "The response has already been flagged by other users.",
      });
    }

    //* submit the data in database
    const reportBody = new Report({
      question,
      response,
      type,
      date,
    });

    await reportBody.save();

    return res.status(201).json({
      success: true,
      message:
        "The response has been flagged and will be reviewed. Thank you for your report.",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const containsBannedWords = (text) => {
  const lowerCaseText = text.toLowerCase();
  return bannedWords.some((word) =>
    new RegExp(`\\b${word}\\b`, "i").test(lowerCaseText)
  );
};

export const check_question = async (req, res) => {
  try {
    const { question } = req.body;

    //* check if question contains banned words
    if (containsBannedWords(question)) {
      return res.status(403).json({
        success: false,
        message:
          "Your question contains inappropriate content that violates our policies.",
      });
    }

    //* check if the question has already been reported
    let report = await Report.findOne({ question });

    if (report) {
      return res.status(409).json({
        success: true,
        message: `This question has already been flagged by several users for potential issues. Kindly submit a different question that complies with our guidelines.!`,
      });
    }

    return res.status(200).json({
      success: true,
      message: "Your question has been accepted.",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

export const check_response = async (req, res) => {
  try {
    const { response } = req.body;

    // //* check if response contains banned words
    // if (containsBannedWords(response)) {
    //   return res.status(403).json({
    //     success: false,
    //     message:
    //       "The response has been flagged due to inappropriate words. Please try another question.",
    //   });
    // }

    let isSafe = false;

    //* check if response was already flagged
    let report = await Report.findOne({ response });

    report ? (isSafe = true) : (isSafe = false);

    const lines = response.trim().split("\n").slice(0, 2); //* Get first 2 lines

    for (const line of lines) {
      const words = line.trim().split(/\s+/); //* Split each line into words

      for (const word of words) {
        const reportMatch = await Report.findOne({
          response: { $regex: word, $options: "i" }, //* Case-insensitive partial match
        });

        if (reportMatch) {
          isSafe = false;
          return res.status(403).json({
            success: false,
            message: `The response has been flagged as ${reportMatch.type} by users. Please try another question.`,
          });
        }
      }

      res.status(200).json({
        success: true,
        message: "Your response has been accepted.",
      });
    }
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};
