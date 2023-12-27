import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp(title: 'myapp',));
}

class CounterController extends GetxController{
  int _count =0;
  int get count => _count;
  increase(){
    _count +=1;
    update();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetBuilder(
        init: CounterController(),
        builder: (CounterController controller){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times'
                  ),
                  Text(
                    '${controller.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: controller.increase,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        },
          ),
    );
  }
}

