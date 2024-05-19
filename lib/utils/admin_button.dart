import 'package:flutter/material.dart';

class AdminButton extends StatelessWidget {
  AdminButton({super.key,this.bgcolor,this.icon,this.style,this.iconcolor,this.press,this.text});
  Color ? bgcolor;
  TextStyle  ?style;
  Icon ? icon;
  Color ? iconcolor;
  VoidCallback ? press;
  String ? text;

  @override
  Widget build(BuildContext context) {
    return Container(
 height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.80,
      color: Colors.amber[700],
      child: ElevatedButton(
        onPressed: press,
        child:Row(
          children: [
            Padding(padding: const EdgeInsets.only(left: 15.0), child: icon,),
            Text(text.toString()),
          ],
        ) ,),
    );
  }
}