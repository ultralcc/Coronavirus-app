import 'package:intl/intl.dart';

class Format {
  static String intToString(int value) {
    var f = new NumberFormat("#,###", "en_US");
    return f.format(value);
  }
}
