import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if (state is CounterMinusState) print('minus state ${state.counter}');
          if (state is CounterPlusState) print('plus state ${state.counter}');
        },
        builder: (context, state)
        {
          return Scaffold (
            appBar: AppBar(
              title: Text(
                'Mosasa Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).plus();
                  }, child: Text(
                    'Plus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueAccent,
                    ),
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){

                    CounterCubit.get(context).minus();
                  }, child: Text(
                    'Minus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueAccent,
                    ),
                  ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
