import 'package:flutter/material.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({Key? key}) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CheckboxListTile(
              title: const Text("Select"),
              value: true, onChanged: (val) {}),
        ],
      ),
    );
  }
}

///checkBoxListTile da servisten datadan ne geldiğini de burda onchange propertysi sayesinde yakalayabiliyorsun!
///şimdi ben bu sekilde bi companenet hazırladım ama bunun acaba şey diyosun teması var mı? varsa hemen gidip yapalım orayı düzenliyelim
///gidiyosun theme dosyasına ve ordan ayarlıyosun
/// ayarladık geldik bu sekilde bak burası düzenleniyor
///
/// bunu bu sekilde mi ypamak zorundayız tabi hayır işte bu companenti widget haline getirirsin o sekilde yaparsın ama bunun
/// baba kısmı theme'dır burdan yaparsan daha iyi olur
/// genel olarak theme kısmında colorlar yer alır size kısımları cok yer almaz ama yine de bazı kısımlarda size da kullanılır
/// gidelim theme dosyasına
///
