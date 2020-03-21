import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ButtonTest",
      theme: ThemeData(primarySwatch: Colors.blue),
//      home: ButtonWidget(),
//      home: ImageWidget(),
//      home: IconWidget(),
      home: SwitchAndCheckBoxTestRoute(),
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

///ICON
class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("icon"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              color: Colors.green,
            ),
            Icon(
              Icons.error,
              color: Colors.green,
            ),
            Icon(
              Icons.format_align_right,
              color: Colors.green,
            ),
            Icon(
              MyIcons.book,
              color: Colors.purple,
            ),
            Icon(
              MyIcons.wechat,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class MyIcons {
  static const IconData book =
  const IconData(0xe614, fontFamily: 'IconFont', matchTextDirection: true);
  static const IconData wechat =
  const IconData(0xec7d, fontFamily: 'IconFont', matchTextDirection: true);
}

///Switch Checkbox
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFildControllerState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  var name;
  var password;

  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editingController.addListener(() {
      print(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch and Checkbox'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                  value: _checkboxSelected,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  }),

              ///输入框
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
                onChanged: (value) {
                  print("=================$value");
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                onChanged: (value) {
                  print("=================$value");
                },
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "地址",
                    hintText: "您的居住9地址",
                    prefixIcon: Icon(Icons.assignment_ind)),
                controller: editingController,
              )
            ],
          )),
    );
  }
}

class _TextFildControllerState extends State<SwitchAndCheckBoxTestRoute> {

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editingController.text = "hello world!";
    editingController.selection = TextSelection(
        baseOffset: 2, extentOffset: editingController.text.length);
    editingController.addListener(() {
      print(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch and Checkbox'),
      ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "地址",
                      hintText: "您的居住9地址",
                      prefixIcon: Icon(Icons.assignment_ind)),
                  controller: editingController,
                ),
                TextField(
                  focusNode: focusNode1,
                  decoration: InputDecoration(
                    labelText: "Input1",
                  ),
                  autofocus: true,
                ),
                TextField(
                  focusNode: focusNode2,
                  decoration: InputDecoration(
                    labelText: "Input2",
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                Builder(
                    builder: (ctx) {
                      return Column(
                        children: <Widget>[
                          RaisedButton(
                              child: Text("移动焦点"),

                              onPressed: () {
                                if (focusScopeNode == null) {
                                  focusScopeNode = FocusScope.of(ctx);
                                }
                                focusScopeNode.requestFocus(focusNode2);
                              }),
                          RaisedButton(
                              child: Text("隐藏键盘"),
                              onPressed: () {
                                focusNode1.unfocus();
                                focusNode2.unfocus();
                              })
                        ],
                      );
                    })
              ]
          )),
    );
  }
}
