import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.white,width: 200,height: 200,),
            ),
            Container(color: Colors.white,width: 200,height: 200,),
            Padding(
              padding: EdgeInsets.only(left: 20.0) + ProjectPadding.pagePaddingVertical,
              ///burda su işlem oluyor 20 + 10 calısıyor yani + operatörünü bizim icin override
              ///etmişler flutter ekibi ve bu companent tarzı bişi üretebiliyoruz
              child: Text("Furkan"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding{
  static final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20);
  static final pagePaddingRightOnly = const EdgeInsets.only(right: 10);
}


//EdgeInsets.zero olmasının nedeni bazı companentlerde padding oluyor bu kodla onları götürüyoruz

///şimdi normalde sizedBox ile 2 widgetin arasına bosluk koyabilirsin eyw bu okey ama sagdan bosluk ver lan hadi dedigimde o zaman patlıyoruz
///aslında dogru kullanım padding ile sarmalamak o ve bu sekilde kullanmaktır ha sizedbox kullanam demiyoruz ama + ve - yanlarına göre kullanmak daha mantıklıdır!!
///