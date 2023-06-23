import 'package:car_brand/cubits/data_holder/data_holder_cubit.dart';
import 'package:car_brand/screens/pick_continent_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  void initState() {
    context.read<DataHolderCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataHolderCubit, DataHolderState>(
        builder: (context, state) {
          if (state is DataHolderInitial) {
            return PickContinentView(brands: state.brands);
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).cardColor,
            ));
          }
        },
      ),
    );
  }
}
