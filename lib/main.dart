import 'package:bloc_test_one/counter_bloc.dart';
import 'package:bloc_test_one/counter_event.dart';
import 'package:bloc_test_one/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Removed the const keyword
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bloc Test',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    '0',
                    style: TextStyle(fontSize: 22, color: Colors.red),
                  );
                } else if (state is ChangeValueFromCounter) {
                  return Text(
                    state.counter.toString(),
                    style: const TextStyle(fontSize: 22, color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Dispatch Increment event
              context.read<CounterBloc>().add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              // Dispatch Reset event
              context.read<CounterBloc>().add(Reset());
            },
            tooltip: 'Reset',
            child: const Text(
              "0",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              // Dispatch Decrement event
              context.read<CounterBloc>().add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove), // Changed to remove icon
          ),
        ],
      ),
    );
  }
}
