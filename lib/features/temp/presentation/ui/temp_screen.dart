import 'package:byaan/features/temp/presentation/cubit/temp_cubit.dart';
import 'package:byaan/CommonUtils//widgets/empty_data_widget.dart';
import 'package:byaan/CommonUtils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TempCubit, TempState>(
          builder: (context, state) {
            if (state is TempDataLoading) {
              return const LoadingWidget();
            } else if (state is TempDataSuccessful) {
              return state.mResource!.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.mResource!.length,
                      itemBuilder: (context, index) => Center(
                          child: Text(state.mResource?[index].name ?? '')))
                  : EmptyDataWidget(
                      onRefreshClicked: () {},
                    );
            } else if (state is TempDataFailed) {
              return EmptyDataWidget(
                onRefreshClicked: () {},
              );
            } else {
              return EmptyDataWidget(
                onRefreshClicked: () {},
              );
            }
          },
        ),
      ),
    );
  }
}
