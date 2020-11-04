import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/exceptions/argument_exception.dart';
import '../../../utils/roman_decimal_converter.dart';

part 'decimal_state.dart';

class DecimalCubit extends Cubit<DecimalState> {
  DecimalCubit(this._converter) : super(DecimalInitial());

  final RomanDecimalConverter _converter;

  void rom2dec(String value) {
    emit(DecimalConverting());
    try {
      final int result = _converter.rom2dec(value);
      emit(DecimalResult(result));
    } on ArgumentException catch (e) {
      emit(DecimalError(e.message));
    }
  }
}
