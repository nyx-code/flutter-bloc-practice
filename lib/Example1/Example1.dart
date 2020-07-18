import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/Example1/bloc/counter_bloc.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: _MyExample(),
      ),
    );
  }
}

class _MyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(CounterIncrease(
                        count: state is SuccessState ? state.count : 0));
                  },
                  child: Text("Increment"),
                ),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(CounterDecraese(
                        count: state is SuccessState ? state.count : 0));
                  },
                  child: Text("Decremnet"),
                ),
              ],
            ),
            Text('Count: ${state is SuccessState ? state.count : 0}')
          ],
        );
      }),
    );
  }
}
