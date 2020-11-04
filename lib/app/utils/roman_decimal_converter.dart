import 'package:roman2decimal/app/shared/exceptions/argument_exception.dart';

class RomanDecimalConverter {
  RegExp _notRomanInput = RegExp(r"[^ivxlcdm]", caseSensitive: false);
  Map<String, int> _conversionFactors = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  };

  List<int> _splitInputAndMapValues(String value) {
    List<String> splittedValues = value.toUpperCase().split("");
    List<int> convertedIndividualValues =
        splittedValues.map((val) => _conversionFactors[val]).toList();
    return convertedIndividualValues;
  }

  bool _containsUnexpectedCharacter(String value) {
    return _notRomanInput.hasMatch(value);
  }

  bool _isBefore(String value) {
    // I before only V or X
    // X before only L or C
    // C before only D or M
    List<int> convertedIndividualValues = _splitInputAndMapValues(value);
    if (convertedIndividualValues.length > 1) {
      List<int> references = _conversionFactors.values.toList();
      bool isBefore = false;
      for (int index = 0; index < references.length - 1; index += 2) {
        for (var i = 0; i < convertedIndividualValues.length - 1; i++) {
          if ((convertedIndividualValues[i] == references[index] ||
                  convertedIndividualValues[i] == 1000) &&
              (convertedIndividualValues[i + 1] == references[index] ||
                  convertedIndividualValues[i + 1] == references[index + 1] ||
                  convertedIndividualValues[i + 1] == references[index + 2])) {
            isBefore = true;
          }
        }
      }
      return isBefore;
    } else {
      return true;
    }
  }

  bool _isIXCMRepeatedMoreThanThreeTimes(String value) {
    List<int> convertedIndividualValues = _splitInputAndMapValues(value);
    bool isIXCMRepeatedMoreThanThreeTimes;
    if (convertedIndividualValues.length > 3) {
      for (int index = 0;
          index < convertedIndividualValues.length - 3;
          index++) {
        isIXCMRepeatedMoreThanThreeTimes = true;
        for (int valueTested = index;
            valueTested < convertedIndividualValues.length;
            valueTested++) {
          isIXCMRepeatedMoreThanThreeTimes &=
              convertedIndividualValues[index] ==
                  convertedIndividualValues[valueTested];
        }
        if (isIXCMRepeatedMoreThanThreeTimes) {
          break;
        }
      }
    } else {
      isIXCMRepeatedMoreThanThreeTimes = false;
    }
    return isIXCMRepeatedMoreThanThreeTimes;
  }

  int rom2dec(String value) {
    if (value.isNotEmpty) {
      if (_containsUnexpectedCharacter(value)) {
        throw ArgumentException("Unexpected character at input");
      } else if (!_isBefore(value)) {
        throw ArgumentException(
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M");
      } else if (_isIXCMRepeatedMoreThanThreeTimes(value)) {
        throw ArgumentException(
            "Too many repeated characters! I, X, C and M must not exceed three in a row");
      } else {
        List<int> convertedIndividualValues = _splitInputAndMapValues(value);
        int total = 0;
        for (int i = 0; i < convertedIndividualValues.length; i++) {
          if ((i < convertedIndividualValues.length - 1) &&
              (convertedIndividualValues[i] <
                  convertedIndividualValues[i + 1])) {
            total -= convertedIndividualValues[i];
          } else {
            total += convertedIndividualValues[i];
          }
        }
        return total;
      }
    } else {
      return 0;
    }
  }
}
