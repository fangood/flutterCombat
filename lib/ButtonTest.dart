import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ButtonTest",
      theme: ThemeData(primarySwatch: Colors.blue),
//      home: ButtonWidget(),
      home: ImageWidget(),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("RaiseButton"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
            //带图标的按钮
            RaisedButton.icon(
              label: Text("带图标"),
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
            /**
             * 自定义样式
             */
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.red,
              child: Text("自定义样式"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

/**
 * 图片
 */
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("images/diamond.png"),
            width: 100,
          ),
          Image.asset(
            "images/diamond.png",
            width: 150,
          ),
          Image(
              image: NetworkImage(
                  "https://profile.csdnimg.cn/8/3/6/3_yuzhiqiang_1993"),
              width: 80),
          Image.network(
            "https://profile.csdnimg.cn/8/3/6/3_yuzhiqiang_1993",
            width: 90,
          )
        ],
      )),
    );
  }
}
