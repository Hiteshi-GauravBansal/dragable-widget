import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset offset = Offset.zero;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        offset = Offset(MediaQuery.sizeOf(context).width / 2 - 30,
            MediaQuery.sizeOf(context).height - 50);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      builder: (context, child) {
        final size = MediaQuery.sizeOf(context);

        return Scaffold(
            body: Stack(
          children: [
            child!,
            Positioned(
              left: min((offset.dx), size.width - 60),
              top: min((offset.dy), size.height - 60),
              child: GestureDetector(

                
                onPanUpdate: (details) {
                  print(details.globalPosition);
                  setState(() {
                    offset = details.globalPosition;
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    offset = offset.dx <= size.width / 2
                        ? Offset(0, offset.dy)
                        : Offset(size.width, offset.dy);

                    print(offset);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      border: Border.all(width: 1, color: Colors.black12)),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ));
      },
      home: const Home1(),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Home1"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Home2(),
                ));
          },
        ),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Center(
          child: TextButton(
            child: const Text("Home2"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Home3(),
                ));

            },
          ),
        ),
      ),
    );
  }
}


class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Center(
          child: TextButton(
            child: const Text("Home3"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
