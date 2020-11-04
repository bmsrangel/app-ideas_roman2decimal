import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/decimal_cubit.dart';
import 'widgets/area_title_widget.dart';
import 'widgets/convert_button_widget.dart';
import 'widgets/custom_text_field_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _rom$ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildResult(),
                  _buildRomanInput(primaryColor),
                ],
              ),
              ConvertButtonWidget(
                color: primaryColor,
                onPressed: () =>
                    context.bloc<DecimalCubit>().rom2dec(_rom$.text),
              ),
              AreaTitleWidget(
                title: "Decimal",
                alignment: Alignment.topCenter,
                paddingTop: 5.0,
              ),
              AreaTitleWidget(
                title: "Roman",
                alignment: Alignment.bottomCenter,
                textColor: primaryColor,
                paddingBottom: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildResult() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: BlocConsumer<DecimalCubit, DecimalState>(
          listener: (context, state) {
            if (state is DecimalError) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red[600],
              ));
            }
          },
          builder: (context, state) => Text(
            state is DecimalResult ? state.result.toString() : "0",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildRomanInput(Color primaryColor) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.white,
        child: CustomTextFieldWidget(
          controller: _rom$,
          textColor: primaryColor,
          hintText: "Roman number",
        ),
      ),
    );
  }
}
