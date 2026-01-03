import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:grocery_management_frontend/services/startup_services.dart';
import 'package:grocery_management_frontend/services/app_config.dart';

// Note: Removed "part 'main.mapper.dart';" as we are using StartupServices manually.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  StartupServices.startServices();
  
  const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  
  // Load the matching JSON file (dev.json or prod.json)
  await AppConfig.load(environment);

  runApp(
    const ToastificationWrapper(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // If you have an AuthBlocWidget, you can use it here. 
      // For now, I'm keeping your existing MyHomePage or you can switch to AuthBlocWidget().
      home: const MyHomePage(title: 'Grocery Management Home'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}