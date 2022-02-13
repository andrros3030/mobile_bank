import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'transaction_page.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile bank',
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
        ),
        home: PinPage(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile bank',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Greenbank mobile'),
    );
  }
}

class PinPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PinPage();

}
class _PinPage extends State<PinPage>{
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    if (password.length < 4){
      Future.delayed(Duration(seconds: 2), (){
        if (password.length < 4)
          setState((){
            password += '1';
          });
      });
    }
    else if (!loading){
      Future.delayed(Duration(seconds: 2), (){
        if (!loading)
          setState((){
            loading = true;
          });
          runApp(MyApp());
      });
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        )
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Image.asset('assets/logo.png'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: password.length < index?Colors.white:Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)
                        ),
                        width: 10,
                        height: 10,
                      ),
                    );
                  }),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
  //                  MaterialButton(onPressed: (){
  //                    runApp(MyApp());
  //                  },
  //                    color: Colors.green,
  //                    child: Text("Войти", style: white16,),
  //                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}

TextStyle white16 = TextStyle(fontSize: 16, color: Colors.white);
TextStyle black18 = TextStyle(fontSize: 18);
List<String> facts = [
  "Рандомный факт про сервисы банка 1",
  "Рандомный факт про сервисы банка 2",
  "Рандомный факт про сервисы банка 3",
  "Рандомный факт про сервисы банка 4",
  "Рандомный факт про сервисы банка 5",
  "Рандомный факт про сервисы банка 6",
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isShowed = false;

  @override
  Widget build(BuildContext context) {
    if (! isShowed){
      Future.delayed(Duration(seconds: 1), (){
        if (! isShowed){
          setState((){
            isShowed = true;
            Fluttertoast.showToast(msg: facts[Random().nextInt(facts.length)], timeInSecForIosWeb: 3);
          });
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Greenbank mobile'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text("Иванов Иван", style: TextStyle(fontSize: 24)),
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.topLeft,
                    child: Text("Счёт:", style: black18,),
                  ),
                  Card(
                    elevation: 8.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      width: double.infinity,
                      height: 80,
                      alignment: Alignment.center,
                      child: Text("СБЕРегательный счёт", style: black18),
                    ),
                  ),
                ],
              ),
            ),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Screen(by_phone: true);
                  }));
                }, child: Text('Перевод по номеру телефона', style: white16),
                  color: Colors.green,
                  minWidth: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Screen(by_phone: false);
                  }));
                }, child: Text('Перевод по номеру карты', style: white16),
                  color: Colors.green,
                  minWidth: 300,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              thickness: 2,
              height: 2,
            ),
            Container(
              height: 160,
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(itemBuilder: (context, i)
              {
                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 160,
                    color: secondaryColors[i%secondaryColors.length],
                    child: RotatedBox(
                      child: Text("Сервис № " + (i+1).toString(), style: black18,),
                      quarterTurns: 3,
                    ),
                  ),
                );
              }, scrollDirection: Axis.horizontal, itemCount: 12,
              ),
            ),
            SizedBox(
              height: 24  ,
            ),
            //Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
List<Color> secondaryColors = <Color>[
  Color(0xFF3CBAF0),
  Color(0xFF19C793),
  Color(0xFFF7BCBC),
  Color(0xFF19BDC7),
  Color(0xFFD7B9F3),
  Color(0xFFFAE9B7),
  Color(0xFFA3E4E9),
  Color(0xFF93D9C4),
  Color(0xFFFFFACC),
  Color.fromRGBO(43, 172, 252, 0.2)
];