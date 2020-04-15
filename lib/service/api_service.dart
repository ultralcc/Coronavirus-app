import 'package:coronavirus/config.dart';
import 'package:coronavirus/utils/http_helper.dart';

class APIService {
  Future getSummery() async {
    final url = '$baseUrl/summary';
    ResponseResultData result = await HttpHelper.doGet(url, false);
    return result;
  }
}
