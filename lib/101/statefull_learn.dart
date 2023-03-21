import 'package:flutter/material.dart';
import 'package:lessonone/product/sentence/sentence_items.dart';

import '../product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {

  int _countValue = 0;
  void _updateCounter(bool isIncrement){
    if(isIncrement) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SentenceItems.welcomeTitle),),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text("$_countValue",style: Theme.of(context).textTheme.headline4,)),
          Placeholder(),

          const CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() =>
      FloatingActionButton(onPressed: () {print("Burda");_updateCounter(true);}, child: Icon(Icons.add));

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(onPressed: () {_updateCounter(false);}, child: Icon(Icons.remove)),
    );
  }
}

///ilk class yani private olmayan class sadece dısarıdan parametre alır!
///aynı statelss gibi calısır aslıdna data alma işini yapar
///private olan class ise asıl statelerin yani hayatın geliştigi kod ordadır buna dikkat edelim!
///
/// şimdi söyle bi durum var abi biz tam bir sayfayı da statefull yapabiliriz veya sadece bir butonnu da statefull yapabiliriz
/// bu farkın olmasına dikkat edelim sadece bir customCompanente eklersek sayfa içerisinde sadece bir değişiklik butonda olucaksa atıyorum bu farazi bişey
/// o zaman buton companentine vericez ama sayfanın diger yerlerinde bir değişiklik olucaksa eger o zaman sadece butona vermemen gerekmektedir
/// buna dikkat edelim!!!!!
///
///setstatein yaptıgı iş su aslıdna : sen setstatei tetiklediğinde build metodu tekrardan calışır yapılandrılır ve sonrasında ekran güncellenmiş olur
///

///işte biz bir uygulama yazarken dikkat etmemiz gerken en önemli noktalardan birisi de sudur:
///başka bir companent ana companenti etkilmesin!!!! buna cok dikkat etmamiz gerekmektedir
///sadece ilişkili companentler birbirini ile ilişkili ollsun!!!
///
/// şimdi şöyle bir durum daha var adam geliyor tüm textlerin içine yazı yazıyor sonra da projeyi kurtar kurtarabilirsen bu cok kötü bir durum
/// simdi söyle bir sey yapıyoruz bu duruma karşı product bizim projemize özel birşey oldugu için orda bir klasör açıyoruz adı ne olursa olsun
/// biz bütün stringli ifadeleri oraya ekliyoruz bu daha güzel ve düzen getirmiş oluyor!!
///