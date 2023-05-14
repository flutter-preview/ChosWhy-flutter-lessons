import 'package:flutter/material.dart';
import 'package:lessonone/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({Key? key}) : super(key: key);

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        changeVisible();
        changeOpacity();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.grey,
      ),
      body: const Column(),
    );
  }
}



///en basit örnegi ile state managment örneği yapıcaz!
///şimdi biz burda widgetların cizildiği private classda birçok metot değişken vs yazdıgımızda kodu okumak oldukca güc oluyor
///işte neler oluyor gidiyorsun sürekli yukarı cık aşşagıya in bunun örneği animatedlearn kısmında var
///bunu cok basit bir şekilde oop kullanarak şöyle birşey yapılabilir
///işte o kodların aynısını buraya alalım animatedlearn'dan
///
/// burda işte burda var olan değişken metotları kullanalım senaryo su olsun burda appbarbackgroundunun rengini değiştirmek
/// işte burda birsürü kod olucak falan sende sunu diceksin ya acaba ben bu işlemleri dışarı cıkarsam ve bunları başka classdan
/// buraya verebilir miyim oop gördük cünkü!
///
/// olusturucagımız dosyanın sonuna sunu eklicez "view_model.dart" biryerden tanıdık geldi yani artık MVVM mimarisine giriyoruz
/// normalde önceden ben vm i burda bu syafada yapıodum birnevi ama artık onu da dışarıya alıcaz!
///
/// viewmodel aslında cok basitce sudur:bi view var ve viewle iş yapan katmanlarımız olucak modellerimiz yani ve bu iki katmanı yöneten
/// ara katmandır yani bu yukarıya yazdıgımız kodlar oluyor!!!
/// state_view_model.dart dosyasına gidelim ordan devam
///