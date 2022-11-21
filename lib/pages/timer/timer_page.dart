import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _showTimer = true;
  Color _color = Colors.primaries.first; //* el color primario el rojo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if(_showTimer)
            TimerView(color: _color),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                 final color = Colors.primaries[index];
                 return GestureDetector(
                  onTap:() {
                    _color = color;
                    setState(() {});
                  },
                  child: Container(color: color, height: 42,),
                 );
                },
                itemCount: Colors.primaries.length,
              )
            )
          ],
          )
      )
    );
  }
}

class TimerView extends StatefulWidget {

  const TimerView({super.key, required this.color});
  final Color color;

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {

  int _tiempo = 0;
  @override
  Widget build(BuildContext context) {
    return Text('$_tiempo', style: TextStyle(fontSize: 50, color: widget.color));
  }
}