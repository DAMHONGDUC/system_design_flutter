import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/services.dart';
import 'package:system_design_flutter/utils/utils.dart';

class SdFormatHelper {
  static String getCleanAmountFromString(String amount) {
    return amount.replaceAll(',', '');
  }

  static String formatMoneyFromDouble(double amount) {
    CurrencyFormat settings = CurrencyFormat(
      code: '',
      symbol: '',
      symbolSide: SymbolSide.none,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );

    String result = CurrencyFormatter.format(amount, settings);

    if (result.contains('.') && result.endsWith('0')) {
      return result.substring(0, result.length - 1);
    }

    return result;
  }

  // static double rm00IfNeed(double amount) {
  //   if (amount == amount.toInt()) {
  //     amount.toString().split('.')[0];
  //   }

  //   return amount;
  // }

  static TextInputFormatter amountFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text;

      if (text.endsWith(',') || text.endsWith('.0')) return oldValue;

      if (text.endsWith('.')) return newValue;

      if (text.contains('.')) {
        final parts = text.split('.');
        if (parts.length > 1 && parts[1].length > 2) {
          return oldValue;
        }
      }

      String cleanText = newValue.text.replaceAll(',', '');

      if (cleanText.isEmpty) {
        return newValue.copyWith(
          text: '',
          selection: TextSelection.collapsed(offset: 0),
        );
      }

      double? value = double.tryParse(cleanText);
      if (value == null) {
        return oldValue;
      }

      // Format the value
      String newText = SdFormatHelper.formatMoneyFromDouble(value);

      // Calculate the new cursor position
      int newCursorPosition =
          newText.length - (cleanText.length - newValue.selection.end);

      // Make sure the cursor is in bounds
      newCursorPosition = newCursorPosition.clamp(0, newText.length);

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newCursorPosition),
      );
    });
  }
}
