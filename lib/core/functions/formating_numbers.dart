import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formattingNumbers(int number) {
  return NumberFormat('#,##0').format(number) + ' IQ'.tr;
}
