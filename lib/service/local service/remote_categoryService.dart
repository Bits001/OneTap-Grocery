import 'package:http/http.dart' as http;

import '../../const.dart';

class RemoteCategoryService {
  var client = http.Client();

  var remote = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remote?populate=image'),
    );

    return response;
  }
}
