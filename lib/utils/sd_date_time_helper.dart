import 'package:intl/intl.dart';

class SdDateTimeHelper {
  static String dateTimeToDDMMYY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
