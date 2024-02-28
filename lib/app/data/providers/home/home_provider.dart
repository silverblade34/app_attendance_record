import 'package:get/get.dart';

const baseUrl = 'http://67.205.184.183:3060/api/v1';

class HomeProvider extends GetConnect {

// Get request
Future<Response> getUser(int id) => get('http://youapi/users/id');
// Post request
Future<Response> postUser(Map data) => post('http://youapi/users', {});
// Post request with File
// Future<Response<CasesModel>> postCases(List<int> image) {
//   final form = FormData({
//     'file': MultipartFile(image, filename: 'avatar.png'),
//     'otherFile': MultipartFile(image, filename: 'cover.png'),
//   });
//   return post('http://youapi/users/upload', form);
// }
GetSocket userMessages() {
  return socket('https://yourapi/users/socket');
}

}