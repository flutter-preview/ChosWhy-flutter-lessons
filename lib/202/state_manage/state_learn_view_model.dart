import 'package:flutter/material.dart';
import 'package:lessonone/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView>{

  final double kZero = 0;
  late AnimationController controller;
  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  @override
  void initState() {
    super.initState();
  }
}

///burda bi class acıyosun ve burda ilk yapman gerekn iş diger taraftaki o widget build kısmının üstündeki kodları buraya almak
/// işte burda diyoruz ki ben burda bunların olmaısnı diger kısımda view ekranının olmasını istiyorum diyoruz
/// ama şöyle bi sıkıntı cıkıyor ben burda bunlara erişemiyorum o zamna learn.view.dart dosyasında private class olan kısmın
/// extends state<'class adı'> olan kısmı alıyorum ve buraya ekliyorum yani bu:extends State<StateManageLearnView>
/// bunu yapıp ve dosya importlarını yaptıktan sonra ban kızar derki oop de ögrenmiştik kesin yazmam gereken bir metot var
/// override edilecek bir metot bunu eklemediğim için kızıyor bana! ama burda şu şekilde birşey var
/// sen bunu bir soyut sınıf yaparsan burda kendi metotlarını doldurmus değişkenlerini ayarlamıs initStateleri vs almıs
/// yani state'in gücünü alıp geri "StateManageLearnView" a da haber verebiliyorum!!! bunu yaptıktan sonra
/// state_manage_learn_view kısmında olan private kısmındaki "extends State<StateManageLearnView>" kısmı silip
/// onun yerine  "StateLearnViewModel" bunu vericeksin oraya "extends StateLearnViewModel" şeklinde!!
/// ardından burda private olan kısımları public yapmak cünkü diğer sayfalarda da kullanabileyim diye
/// bunlar da hazır oldugunda artık rahatlıkla burdaki elemanlar aerişebiliyorum diğer sayfadan!!!!!
///
///   202 için yeterli bir stateManagment!!!!
/// işte burda aslında servisi cagırma kısmı vs hep burda olması gerekiyor!!!!
/// işte bunları bu sekilde yaptıgımızda kodlarımız daha düzenli ve temiz olmus oluyor!!
/// bu kısımda logicler yani giriş kısım metodlar değişkenler vs bunları yönetiyoruz!!
///