import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget{
  Screen({Key key, this.by_phone = true}) : super(key: key);

  final bool by_phone;

  @override
  _Screen createState() => _Screen(by_phone);
}
class _Screen extends State<Screen>{
  final bool by_phone;
  _Screen(this.by_phone);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(by_phone?"Перевод по номеру телефона":"Перевод по номеру карты",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 24,
              ),
              child: TextFormField(
                decoration: InputDecoration(

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}