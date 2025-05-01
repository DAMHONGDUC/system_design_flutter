import 'package:flutter/services.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:system_design_flutter/utils/utils.dart';

class SdFormatHelper {
  static String getCleanAmountFromString(String amount) {
    return amount.replaceAll(',', '');
  }

  static String formatMoneyFromDouble(
    double amount, {
    bool withSymbol = true,
    bool alwaysShowDecimal = true,
    int fractionDigits = 2,
  }) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        fractionDigits: fractionDigits,
        thousandSeparator: ',',
        decimalSeparator: '.',
        symbol: '',
      ),
    );
    String result = fmf.output.nonSymbol;

    if (withSymbol) {
      result = fmf.output.symbolOnLeft;
    }

    if (!alwaysShowDecimal) {
      return result.endsWith('.00') ? result.replaceAll('.00', '') : result;
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
      String newText = SdFormatHelper.formatMoneyFromDouble(
        value,
        withSymbol: false,
        alwaysShowDecimal: false,
      );

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
