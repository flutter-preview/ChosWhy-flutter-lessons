import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.red,),),
              Expanded(child: Container(color: Colors.green,),),
              Expanded(child: Container(color: Colors.blue,),),
              Expanded(child: Container(color: Colors.pink,),),
            ],
          ),flex: 4,),
          Spacer(flex: 2,),
          Expanded(flex: 2,child: Container(color: Colors.yellow,)),
          Container(height: _ProjectContanerSize.cardHeight,child: Column(
            children: [
              Expanded(child: Text("data")),
              Expanded(child: Text("data")),
              Expanded(child: Text("data")),
              Expanded(child: Text("data")),
            ],
          )),
        ],
      ),
    );
  }
}
class _ProjectContanerSize{
  static const double cardHeight = 200;
}

///şimdi Column ve Rowlara girdigimizde ise bizi karşılayan terimlerden birisi responsive gelicektir peki responsive nedir?
///responsive tasarımlar aslında webde daha cok karşımıza cıkmaktadır bu terim ekranın hem dikeyde hemde yatayda oluşmasına yönelik bir terimdir
///dikeyde su tasarım yatayda bu tasarım olucak şekilde gibi düşünebiliriz!
///burda da expanded devreye giriyor!
///
/// bu expandedleri kullanırken aşırı dikkat etmemizde fayda vawr cunku en ufak hata ekranı patlatır!
/// yine ben 2.comapnenti isteiyorum ama bu sekidle de kalsın isityorum tasarımı o zaman Spacer diye bi companent var onu veriyoruz
/// boşluk vermemize yarıyor
///şimdi şöyle bir matematik var flexlerin toplamı ne kadarsa ona göre bölüp expanded içindeki alan ona göre ayarlanıyor katları
///amaa müşteri dediki bize container isityorum abi dedi aşşagıda containerin height 200 olucak dedi
///o zaman su sekilde işlem oluyor tüm ekrandan 200 cıkartıp flexi ona göre bölüp flex miktarını böldüğüyle çarpıyor!!!!
///bu ekran tasarımları acısından oldukça onemlidir
///
/// ve bu tarz ekranlarda mutlaka expanded kullanmak gerkemektedir cünkü 50 50 50 50 şeklinde girilmesi oldukca zararlıdır ve ana class da 200 sayısı gibi birşey görmücez ne ypacaz
/// cosntnt oldugu için bunu class olsuturup içine atıcaz!
///
///yine column ve rowda mainAxisSize propertysini unutma defautlu maxdır ama min verirsen ise bu şunu yapar
///dataların toplam alanı kadar kendini sıkıştırır
///