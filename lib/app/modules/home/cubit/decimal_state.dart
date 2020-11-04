part of 'decimal_cubit.dart';

@immutable
abstract class DecimalState {
  const DecimalState();
}

class DecimalInitial extends DecimalState {
  const DecimalInitial();
}

class DecimalConverting extends DecimalState {
  const DecimalConverting();
}

class DecimalResult extends DecimalState {
  final int result;
  const DecimalResult(this.result);
}

class DecimalError extends DecimalState {
  final String message;
  const DecimalError(this.message);
}
