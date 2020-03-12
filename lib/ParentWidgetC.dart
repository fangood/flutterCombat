import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() {
    return _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapboxC(
      active: _active,
      onChanged: _handleTapboxChanged,
    ));
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, bool this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() {
    return _TapboxCState();
  }
}

class _TapboxCState extends State<TapboxC> {
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
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child:
          Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: widget.active ? 'Active' : 'InActive'),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 32.0
                    ),

                  )
                ]
            ),
            textDirection: TextDirection.ltr,
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10.0)
                : null),
      ),
    );
  }
}
