import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/temp_cubit.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TempCubit, TempState>(builder: (context, state) {
      final cubit = BlocProvider.of<TempCubit>(context);
      if (state is TempLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is TempSuccess) {
        return Scaffold(
          body: Container(),
        );
      } else {
        return Container();
      }
    });
  }
}
