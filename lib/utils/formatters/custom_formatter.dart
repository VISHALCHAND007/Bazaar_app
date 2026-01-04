import 'package:intl/intl.dart';

class CustomFormatter {
  CustomFormatter._();

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static String getFormatterDate(DateTime date, {String format = "dd-MM-yyyy"}) {
    return DateFormat(format).format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: "en_US", symbol: "\$").format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // assuming for india number we will add +91 at beginning and return

    if(phoneNumber.length == 10) {
      return "+91 $phoneNumber";
    } else {
      throw "Check phone number";
    }
  }
}