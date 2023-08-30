import 'package:fifth_month/cubits/math_cubit.dart';
import 'package:fifth_month/data/models/math_model.dart';
import 'package:fifth_month/ui/math_screen/widgets/number_formatter.dart';
import 'package:fifth_month/ui/math_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({super.key});

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Math Screen"),
        ),
        body: BlocBuilder<MathCubit, MathModel>(
          builder: (context, model) {
            return Column(
              children: [
                MathTextField(
                  hintText: "first number",
                  controller: first,
                  onChanged: (value) {
                    int theFirst = int.parse(value);
                    if (value.isNotEmpty) {
                      if (theFirst < 1000) {
                        context.read<MathCubit>().updateFirst(theFirst);
                      }else if(theFirst==0 ){
                        context.read<MathCubit>().setZero();
                      }
                    }
                  },
                ),
                MathTextField(
                  hintText: "second number",
                  controller: second,
                  isLast: true,
                  onChanged: (value) {
                    int theSecond = int.parse(value);
                    if (value.isNotEmpty) {
                      if (theSecond < 100) {
                        context
                            .read<MathCubit>()
                            .updateSecond(theSecond);
                      }else if(theSecond==0 ){
                        context.read<MathCubit>().setZero();
                      }
                    }
                  },
                ),
                Text(
                  formatNumber(context.read<MathCubit>().countResult()),
                  style: TextStyle(
                    color: Colors.green, fontSize: 32.sp,
                    fontWeight: FontWeight.w800
                  ),
                )
              ],
            );
          },
        ));
  }
}
