import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/modules/home/cubit/decimal_cubit.dart';
import 'app/modules/home/pages/home_page.dart';
import 'app/utils/roman_decimal_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roman to Decimal Converter',
      theme: ThemeData(
        primaryColor: Color(0xFF3B287B),
        textSelectionHandleColor: Color(0xFF3B287B),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<DecimalCubit>(
        create: (context) => DecimalCubit(RomanDecimalConverter()),
        child: HomePage(),
      ),
    );
  }
}
