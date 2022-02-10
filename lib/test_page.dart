import 'package:assign9/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key) {}

  @override
  _TestPageState createState() => _TestPageState();
}

/// _TestPageState createState() => _TestPageState();

class _TestPageState extends State<TestPage> {
  var _num = 0;
  var _pass = 5;
  String _password = '';

  ///var _password = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TEST PAGE')),
      body: SizedBox.expand(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_yn2.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          //width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.https,
                  size: 80.0,
                  color: Colors.yellowAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text(
                      'กรุณาใส่รหัสผ่าน',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 44.0),
                      child: Text(
                        'Enter PIN to login',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

              ),

              // Collection if
             /// if (_num > 5) Text('Hello from collection-if'),

              // Conditional expression using conditional operator (?:)
              /*_num > 5
                  ? Text('Hello from conditional expression')
                  : SizedBox.shrink(),*/

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Collection for
                  for (var i = 0; i < _num; i++)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),

                  for (var b = _pass; b >= 0; b--)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildButton(1),
                  buildButton(2),
                  buildButton(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildButton(4),
                  buildButton(5),
                  buildButton(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildButton(7),
                  buildButton(8),
                  buildButton(9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                  ),
                  buildButton(0),
                  buildButton(-1),
                ],
              ),

              /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num++;
                      _pass--;
                    });
                  },
                  child: Text('TEST')),
            ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(int? num) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        child: TextButton(
          ////borderRadius: BorderRadius.circular(25.0),
          onPressed: () {
            if (num == -1) {
              _password = _password.substring(0, _password.length - 1);
              setState(() {
                _num--;
                _pass++;
              });
            } else {
              setState(() {
                _num++;
                _pass--;
              });
              _password = _password + num.toString();
            }

            if (_password == "123456") {
              ////print('wan fan pee baek');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (_num == 6) {
              _num = 0;
              _pass = 5;
              _password = "";
              ////print("ผิดค้าบ");
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Invalid Pin"),
                    content: Text("Please try again"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
            print('You pressed $num');
            print('passward $_password');
          },
          child: (num == -1)
              ? Icon(Icons.backspace, color: Colors.deepOrange)
              : Text('$num'),
        ),
        width: 50.0,
        height: 50.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.indigo,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.indigo, width: 4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
      ),
    );
  }
}
