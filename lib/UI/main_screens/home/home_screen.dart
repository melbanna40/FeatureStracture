import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final cubit = BlocProvider.of<HomeCubit>(context);
      if (state is HomeLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is HomeSuccess) {
        return Scaffold(
          backgroundColor: MColors.colorPrimary.withOpacity(0.5),
          body: Container(),
        );
      } else {
        return Scaffold(
          backgroundColor: MColors.colorPrimary.withOpacity(0.5),
          body: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
              ),
            ),
            child: ListView(
              children: [
                Gaps.vGap16,
                Center(
                  child: Column(
                    children: [
                      Text(
                        '${cubit.currentTime}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cubit.currentDate}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                )
              ],
            ),
          ),
        );
      }
    });
  }
}
