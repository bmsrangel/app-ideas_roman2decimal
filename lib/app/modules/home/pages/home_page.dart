import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../cubit/decimal_cubit.dart';

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
                  Expanded(
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
                        builder: (context, state) {
                          if (state is DecimalResult) {
                            return Text(
                              state.result.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48.0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else {
                            return Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48.0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: Colors.white,
                      child: TextField(
                        controller: _rom$,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText: "Roman number",
                          hintStyle: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        textCapitalization: TextCapitalization.characters,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 42.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColor,
                      width: 10.0,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.bloc<DecimalCubit>().rom2dec(_rom$.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Feather.arrow_up,
                        color: primaryColor,
                        size: 70.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0),
                alignment: Alignment.topCenter,
                child: Text(
                  "Decimal",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 44.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Roman",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 44.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
