import 'package:flutter/material.dart';

class TapBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tap box'),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                TapBoxA(),
                ParentWidgetB(),
                ParentWidgetC()
              ],
            )
        )
    );
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({ Key key }) : super(key: key);

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
            child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white
                )
            )
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen : Colors.grey
        ),
      ),
    );
  }
}

class ParentWidgetB extends StatefulWidget {
  @override
  _ParentWidgetBState createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: TapBoxB(
            active: _active,
            onChanged: _handleTapBoxChanged
        )
    );
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({ Key key, this.active: false, @required this.onChanged }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
            child: Text(
                active ? 'Active' : 'Inactive',
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white
                )
            )
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen : Colors.grey
        ),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: TapBoxC(
            active: _active,
            onChanged: _handleTapBoxChanged
        )
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({ Key key, this.active: false, @required this.onChanged }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
              widget.active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen : Colors.grey,
            border: _highlight ? Border.all(
                color: Colors.teal,
                width: 10.0
            ) : null
        ),
      ),
    );
  }
}