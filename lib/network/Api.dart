// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// class ApI{
//   var headers = {'Accept': 'application/json'};
//
//   Future registerFun({
//     required int user_id,
//     required String name,
//     required String email,
//     required String password,
//     required String password_confirmation,
//     required File? photo,
//
//   }) async {
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('https://bennebosmarket.com/api/register'));
//
//     request.fields.addAll({
//       "name": name,
//       "email": email,
//       "password": password,
//       "password_confirmation": password_confirmation,
//     });
//
//     request.files
//         .add(await http.MultipartFile.fromPath('avatar', "${photo!.path}"));
//     request.headers.addAll(headers);
//
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     if (streamedResponse.statusCode == 200) {
//       final result = jsonDecode(response.body) as Map<String, dynamic>;
//       user_id = result['data']["id"];
//       print(result['data']["id"]);
//
//       registercurrentStep++;
//       update();
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
// }