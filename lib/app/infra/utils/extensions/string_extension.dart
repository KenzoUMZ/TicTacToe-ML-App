// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

extension StringExtensions on String {
  bool toBool() => toLowerCase() == 'true';

  String translate() => i18n();

  String removeSymbols() => replaceAll(RegExp(r'[^\s\w]'), '');
}

String brCurrency(double? b) {
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(b);
}
