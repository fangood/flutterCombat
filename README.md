# fluttercombat

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

########################################   Dart  ###############################################

Dart和JavaScript不会，它们都是单线程模型，Java和OC都是多线程模型的编程语言。其中包含两个任务队列，
一个是“微任务队列” microtask queue，另一个叫做“事件队列” event queue。从图中可以发现，微任务队列的执
行优先级高于事件队列，
在事件循环中，当某个任务发生异常并没有被捕获时，程序并不会退出，而直接导致的结果是当前任务的后续代码就不会被
执行了，也就是说一个任务中的异常是不会影响其它任务执行的。
#1.4.1 var
Dart本身是一个强类型语言，任何变量都是有确定类型

#dynamic和Object
Object 是Dart所有对象的根基类，也就是说所有类型都是Object的子类(包括Function和Null)，所以任何类型的数据都
可以赋值给Object声明的对象. dynamic与var一样都是关键词,声明的变量可以赋值任意对象。 而dynamic与Object相同
之处在于,他们声明的变量可以在后期改变赋值类型。

dynamic与Object不同的是,dynamic声明的对象编译器会提供所有可能的组合, 而Object声明的对象只能使用Object的属性与方法, 否则编译器会报错

#final和const

如果您从未打算更改一个变量，那么使用 final 或 const，不是var，也不是一个类型。 一个 final 变量只能被设置
一次，两者区别在于：const 变量是一个编译时常量，final变量在第一次使用时被初始化。被final或者const修饰的变
量，变量类型可以省略

#可选的位置参数

包装一组函数参数，用[]标记为可选的位置参数，并放在参数列表的最后面

#可选的命名参数

定义函数时，使用{param1, param2, …}，放在参数列表的最后面，用于指定命名参数。例如：

//设置[bold]和[hidden]标志
void enableFlags({bool bold, bool hidden}) {
    // ... 
}
调用函数时，可以使用指定命名参数。例如：paramName: value

enableFlags(bold: true, hidden: false);
可选命名参数在Flutter中使用非常多。

注意，不能同时使用可选的位置参数和可选的命名参数




# 运算符
..（级联运算符）
?.（条件成员访问运算符）
??（判空赋值运算符）
######################################################################################

#Dart 分析器
在运行应用程序前，请运行flutter analyze测试你的代码

##debugPrint()
如果你一次输出太多，那么Android有时会丢弃一些日志行。为了避免这种情况，您可以使用Flutter的foundation库中的debugPrint()。
 这是一个封装print，它将输出限制在一个级别，避免被Android内核丢弃。
 
 ##Widget 树
 要转储Widgets树的状态，请调用debugDumpApp()。 只要应用程序已经构建了至少一次（即在调用build()之后的任何时间），
 您可以在应用程序未处于构建阶段（即，不在build()方法内调用 ）的任何时间调用此方法（在调用runApp()之后）。