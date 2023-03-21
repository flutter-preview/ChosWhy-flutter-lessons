import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: [
          Icon(Icons.message_outlined),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context).backgroundColor,
                //backgroundcolor seklidne bırakınca farklı themelara göre degişiklik gösteriyor

                size: iconSizes.iconSmall,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: iconSizes.iconSmall,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: IconSizes.iconSmall2x,
              )),
          SizedBox(height: 50,),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: iconSizes.iconSmall,
              )),
        ],
      ),
    );
  }
}

class IconColors {
  ///colors isimleri bilmiyosan aç googleyi colors name generate yaz cıkan sayfada kullan
  final Color froly = Color(0xffED61A7);
}

class IconSizes {
  final double iconSmall = 40;
  static final double iconSmall2x = 80;
}

///ben colorları aslında direkt olarak theme dan almam gerekiyor
///theme.of(context). şeklinde ....
///temadan verirsem tema kendini generic olarak degiştiginde ayarlıyor otomatik olarak ama ben coloru flory seklinde ezersem
///o zaman tüm app da color bu sekilde kalıcaktır!
///
/// yine ıconları burdan yapabildigin gibi temadan da ıcontheme seklidne custom edebilirsin ama dikkat et tüm projeyi renk ugruna ziyan etme!
///