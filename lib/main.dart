import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран Камила'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavigationButton(
            label: 'Push',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          ),
          NavigationButton(
            label: 'Pop',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          NavigationButton(
            label: 'Push and Remove Until',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
                (route) => false,
              );
            },
          ),
          NavigationButton(
            label: 'Push Named and Remove Until',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/fourth',
                (route) => false,
              );
            },
          ),
          NavigationButton(
            label: 'Push Replacement',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
          NavigationButton(
            label: 'Push Replacement Named',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/third');
            },
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  NavigationButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран Краш'),
      ),
      body: Center(
        child: Text('Это экран Краш'),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран Мила'),
      ),
      body: Center(
        child: Text('Это экран Мила'),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран Камош'),
      ),
      body: Center(
        child: Text('Это экран Камош'),
      ),
    );
  }
}
