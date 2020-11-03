import 'package:flutter_test/flutter_test.dart';
import 'package:roman2decimal/app/shared/exceptions/argument_exception.dart';
import 'package:roman2decimal/app/utils/roman_decimal_converter.dart';

void main() {
  final converter = RomanDecimalConverter();
  group('Upper case / Lower case', () {
    test('For input "I", output should be "1"', () {
      expect(converter.rom2dec("I"), 1);
    });

    test('For input "i", output should be "1"', () {
      expect(converter.rom2dec("i"), 1);
    });
  });

  group('Basic numbers', () {
    test('I = 1', () {
      expect(converter.rom2dec("I"), 1);
    });
    test('V = 5', () {
      expect(converter.rom2dec("V"), 5);
    });
    test('X = 10', () {
      expect(converter.rom2dec("X"), 10);
    });
    test('L = 50', () {
      expect(converter.rom2dec("L"), 50);
    });
    test('C = 100', () {
      expect(converter.rom2dec("C"), 100);
    });
    test('D = 500', () {
      expect(converter.rom2dec("D"), 500);
    });
    test('M = 1000', () {
      expect(converter.rom2dec("M"), 1000);
    });
  });

  group('Other numbers test', () {
    test('For input "iv" or "IV", output should be "4"', () {
      expect(converter.rom2dec("iv"), 4);
    });

    test('For input "XLIX", output should be "49"', () {
      expect(converter.rom2dec("XLIX"), 49);
    });
    test('For input "XCIV", output should be "94"', () {
      expect(converter.rom2dec("XCIV"), 94);
    });
    test('For input "CCXXXVII", output should be "237"', () {
      expect(converter.rom2dec("CCXXXVII"), 237);
    });
    test('For input "CDLXXXII", output should be "482"', () {
      expect(converter.rom2dec("CDLXXXII"), 482);
    });
    test('For input "DCCXLIV", output should be "744"', () {
      expect(converter.rom2dec("DCCXLIV"), 744);
    });
    test('For input "CMLVI", output should be "956"', () {
      expect(converter.rom2dec("CMLVI"), 956);
    });
    test('For input "MXLIX", output should be "1049"', () {
      expect(converter.rom2dec("MXLIX"), 1049);
    });
    test('For input "MCMXC", output should be "1990"', () {
      expect(converter.rom2dec("MCMXC"), 1990);
    });
    test('For input "MMXX", output should be "2020"', () {
      expect(converter.rom2dec("MMXX"), 2020);
    });
  });

  group('Invalid character test', () {
    test('Comma inserted', () {
      expect(() => converter.rom2dec("X,XX"),
          throwsA(isInstanceOf<ArgumentException>()));
    });
    test('Dot inserted', () {
      expect(() => converter.rom2dec("X.X"),
          throwsA(isInstanceOf<ArgumentException>()));
    });
    test('Invalid key inserted (A)', () {
      expect(() => converter.rom2dec("IXA"),
          throwsA(isInstanceOf<ArgumentException>()));
    });
  });

  group('The "before" test', () {
    test('I before V', () {
      expect(converter.rom2dec("IV"), 4);
    });
    test('I before X', () {
      expect(converter.rom2dec("IX"), 9);
    });
    test('I before L', () {
      expect(
        () => converter.rom2dec("IL"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('I before C', () {
      expect(
        () => converter.rom2dec("IC"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('I before D', () {
      expect(
        () => converter.rom2dec("ID"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('I before M', () {
      expect(
        () => converter.rom2dec("IM"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('X before L', () {
      expect(converter.rom2dec("XL"), 40);
    });
    test('X before C', () {
      expect(converter.rom2dec("XC"), 90);
    });
    test('X before D', () {
      expect(
        () => converter.rom2dec("XD"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('X before M', () {
      expect(
        () => converter.rom2dec("XM"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Invalid position! Check for I not before V or X, X not before L or C, C not before D or M",
          ),
        ),
      );
    });
    test('C before DL', () {
      expect(converter.rom2dec("CD"), 400);
    });
    test('C before M', () {
      expect(converter.rom2dec("CM"), 900);
    });
  });

  group('I, X, C, or M repeated more than three times', () {
    test('IIII', () {
      expect(
        () => converter.rom2dec("IIII"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
    test('XXXX', () {
      expect(
        () => converter.rom2dec("XXXX"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
    test('CCCC', () {
      expect(
        () => converter.rom2dec("CCCC"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
    test('MMMM', () {
      expect(
        () => converter.rom2dec("MMMM"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
    test('XIIII', () {
      expect(
        () => converter.rom2dec("XIIII"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
    test('LXXXX', () {
      expect(
        () => converter.rom2dec("LXXXX"),
        throwsA(
          isInstanceOf<ArgumentException>().having(
            (error) => error.message,
            "message",
            "Too many repeated characters! I, X, C and M must not exceed three in a row",
          ),
        ),
      );
    });
  });
}
