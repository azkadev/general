// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:convert';

class GeneralUtils {
  static String to_string_pretty({required dynamic data, int space = 4}) {
    if (data is Map || data is List) {
      return JsonEncoder.withIndent(" " * space).convert(data);
    }
    return data.toString();
  }
}
