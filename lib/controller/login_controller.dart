import 'dart:convert';
// import 'dart:html';

import 'package:absen_qrcode/model/login_model.dart';
import 'package:http/http.dart' as http;

class UserContoller {
  //in here i will create some methods like the following

  //let us create some constans
  static const VIEW_URL = "http://10.0.48.71/sabuskApi/view.php";
  static const CREATE_URL = "http://10.0.48.71/sabuskApi/create.php";

  //lemme make looping, of map or as you know associative array
  List<userModel> studentsFromJson(String jsonstring) {
    final data = json.decode(jsonstring);
    //let at maek app
    return List<userModel>.from(data.map((item) => userModel.fromJson(item)));
  }

  Future<List<userModel>> getUser() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<userModel> list = studentsFromJson(response.body);
      return list;
    } else {
      return <userModel>[];
    }
  }

  //set data or add data
  Future<String> addUser(userModel studentModel) async {
    final response =
        await http.post(Uri.parse(CREATE_URL), body: studentModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  //update data
  // Future<String> UpdateStudent(studentModel studentModel) async {
  //   final response = await http.post(Uri.parse(UPDATE_URL),
  //       body: studentModel.toJsonDelete_and_Update());
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  //delete data
  // Future<String> DeleteStudent(studentModel studentModel) async {
  //   final response = await http.post(Uri.parse(DELETE_URL),
  //       body: studentModel.toJsonDelete_and_Update());
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }
}
