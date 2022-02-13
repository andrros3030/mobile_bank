import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget{
  Screen({Key key, this.by_phone = true}) : super(key: key);

  final bool by_phone;

  @override
  _Screen createState() => _Screen(by_phone);
}
TextStyle black16 = TextStyle(fontSize: 16);
class _Screen extends State<Screen>{
  final bool by_phone;
  _Screen(this.by_phone);
  List<Map> contacts = [
    {'name':'Сергей дача', "phone":"+79998118834", "card":"1234 5678 9012 3456"},
    {'name':'Петров Иван подчинённый', "phone":"+70134118834", "card":"1222 5578 9112 3434"},
    {'name':'Алексей разборка', "phone":"+79031228834", "card":"1010 2233 4456 7890"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(by_phone?"Перевод по номеру телефона":"Перевод по номеру карты"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:24, vertical: 12),
              child: Container(
                color: Colors.green.withOpacity(0.2),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(
                    "Введите номер " + (by_phone?"телефона":"карты") + " получателя платежа.\n"
                    "Мы подгрузили список контактов, чтобы вам было легче :)", style: black16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                width: double.infinity,
                alignment: Alignment.center,
                child: TextFormField(
                  style: black16.copyWith(fontSize: 24),
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

}