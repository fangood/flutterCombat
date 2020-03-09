import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParentWidget extends StatefulWidget {
  @override
  ParentState createState() {
    return ParentState();
  }
}

class ParentState extends State<ParentWidget> {
  bool _active = false;

  void handleTapBoxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabboxB(
        active: _active,
        onChanged: handleTapBoxChange,
      ),
    );
  }
}

class TabboxB extends StatelessWidget {
  TabboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 32, color: Colors.white),
            textDirection: TextDirection.ltr,
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.green[700] : Colors.grey[500],
        ),
      ),
    );
  }
}
