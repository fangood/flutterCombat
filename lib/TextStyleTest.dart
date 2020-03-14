import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextStyle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
//      home: TextStyleWidget(),
      home: TextStyleWidget2(),
    );
  }
}

class TextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("标题"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times times:',
              textDirection: TextDirection.ltr,
            ),
            Text(
              'You have pushed the button this many times times:',
              textDirection: TextDirection.ltr,
            )
          ],
        ),
      ),
    );
  }
}

class TextStyleWidget2 extends StatelessWidget {
  var textStyle = const TextStyle(
    fontFamily: 'Raleway',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.red, fontSize: 20.0),
          textAlign: TextAlign.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("hello world!!!"),
              Text("I am Jack",
                style: textStyle,
              ),
              Text(
                "you are a girl",
                style: TextStyle(
                    inherit: false, //不继承默认样式
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
