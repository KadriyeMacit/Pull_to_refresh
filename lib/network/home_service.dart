import 'package:swipe_refresh_example/network/model/home_response_model.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<HomeResponseModel?> getBooks() async {
    const String baseUrl = 'https://api.npoint.io/cfe3e81740a455809f7e';

    var url = Uri.parse(baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return homeResponseModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
