import "dart:convert";
import 'package:http/http.dart';

class Network {
  Network(this.url);
  String url;
  late int status;
  Future getdata() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      status = response.statusCode;
      return jsonDecode(response.body);
    } else {
      status = response.statusCode;
      return response.statusCode;
    }
  }
}
