import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class ReportService {
  final String baseURL;
  var logger = Logger();

  ReportService({required this.baseURL});

//* check user asked question API
  Future<String> checkUserAskedQuestion(String question) async {
    try {
      var logger = Logger();
      logger.d(question);
      final url = Uri.parse("${baseURL}/report/check-question");

      final body = jsonEncode({'question': question});

      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: body);

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return "Success";
      } else if (response.statusCode == 403) {
        return responseBody["message"];
      } else if (response.statusCode == 409) {
        return responseBody["message"];
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }

//* check response API
  Future<String> checkResponseGemini(String responseG) async {
    try {
      final url = Uri.parse("${baseURL}/report/check-response");

      final body = jsonEncode({"response": responseG});

      final responseRec = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: body);

      final responseBody = jsonDecode(responseRec.body);
      logger.d(responseBody["message"]);

      if (responseRec.statusCode == 200) {
        return "Success";
      } else if (responseRec.statusCode == 403) {
        return responseBody["message"];
      } else {
        return "Error";
      }
    } catch (e) {
      logger.d(e.toString());
      return "Error : ${e.toString()}";
    }
  }

//* report a content API
  Future<String> reportResponse(
      String question, String response, String type) async {
    try {
      final url = Uri.parse("${baseURL}/report/submit");

      final date = DateFormat("d MMM yyyy").format(DateTime.now());

      final body = jsonEncode({
        "question": question,
        "response": response,
        "type": type,
        "date": date
      });

      final responseRec = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: body);
      final responseBody = jsonDecode(responseRec.body);

      if (responseRec.statusCode == 201) {
        return responseBody["message"];
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }
}
