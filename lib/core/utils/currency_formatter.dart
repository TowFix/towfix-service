import 'package:intl/intl.dart';

/// Currency formatter to be used in the app.
final kCurrencyFormatter = NumberFormat.simpleCurrency();

final kGhcCurrencyFormatter = NumberFormat.currency(
  locale: 'en_GH',
  symbol: 'GHS ',
  decimalDigits: 2,
);
