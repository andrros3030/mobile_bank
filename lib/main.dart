import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'by_phone.dart';

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
  @override
  String pass = '';
  Widget build(BuildContext context) {
    if (pass.length < 4){
      Future.delayed(Duration(seconds: 1), (){
        if (pass.length < 4)
          setState((){
            pass += '1';
          });
      });
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: pass.length < index?Colors.white:Colors.grey,
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
            MaterialButton(onPressed: (){
                runApp(MyApp());
              },
              color: Colors.green,
              child: Text("Войти", style: white16,),
            ),
          ],
        ),
      )
    );
  }

}

TextStyle white16 = TextStyle(fontSize: 16, color: Colors.white);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  @override
  bool isShowed = false;
  Widget build(BuildContext context) {
    if (! isShowed){
      Future.delayed(Duration(seconds: 1), (){
        if (! isShowed){
          setState((){
            isShowed = true;
            Fluttertoast.showToast(msg: 'Рандомный факт про сервисы банка', timeInSecForIosWeb: 3);
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
            Expanded(child: SizedBox(),),
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
            Expanded(child: SizedBox(),),
          ],
        ),
      ),
    );
  }
}
