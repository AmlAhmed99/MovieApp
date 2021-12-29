
import 'package:flutter/material.dart';

class TopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              child: Image.asset('assets/testPhoto.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(child: Image.asset('assets/play-icon.png',height: 60,width: 60,)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Dora and the lost city of gold' ,  style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10,left: 15),
          child: Text('2019  PG-13  2h 7m' ,  style: TextStyle(
            color: Colors.white, fontSize: 10, ),),
        ),
      ],
    );
  }
}
