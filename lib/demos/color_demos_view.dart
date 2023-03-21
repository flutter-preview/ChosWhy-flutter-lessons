import 'dart:developer';

import 'package:flutter/material.dart';

///hocam müşteri ne istiyor:
///bir ekran olacak
///bu ekranda 3 button ve bulara basınca renk değişimi olcak!
///seçili olan button selected icon olsun

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor; //ilk renk demek

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor; //= Colors.transparent;


  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }
  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget); //oldWidget eski durumdur!

    ///
    print(oldWidget.initialColor != _backgroundColor);//widget.initialColor);
    ///bak ne oldu ben her defasında backgroundColor ı degiştiiyorum tıklayarak butonlara bu yuzden widget.initialColor degil bakcgroundColor koyucaz!

    ///burda diyorumki eski initialColor durumu yeni initialColor durumuna eşit degilse burası calıssın
    /*if(oldWidget.initialColor != widget.initialColor && widget.initialColor != null){
      changeBackgroundColor(widget.initialColor!);
      ///null gemlicegini kontrol ettikten sonra zorluyabilirim "!" ile
    }*/
    //print(inspect(widget.initialColor));
    //print(inspect(oldWidget.initialColor));
    //bak bunları bu sekilde karşılaştırıyorum ve bunlara bakıyorum ikisinin degeri aynıymıs cidden

    if(widget.initialColor != _backgroundColor && widget.initialColor != null){
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color){
    setState(() {
      _backgroundColor = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _colorOnTap,
          items: const [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red),label: "deneme1"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow),label: "deneme2"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue),label: "deneme3"),
      ]),
    );
  }

  ///bu metot dynamic olmamalı cunku proje patlar bu yuzden her zamna dönüş tipi ve value tipi olmalı
  void _colorOnTap(int value) {

          ///bu sekilde bir enum acıp oraya atamak ve bu sekilde yapmak daha mantıklı 0 1 2 index elemanları yerine buna dikkat edelim!
          if(value == _MyColors.red.index){
            changeBackgroundColor(Colors.red);
          }
          else if(value == _MyColors.yellow.index){
            changeBackgroundColor(Colors.yellow);
          }
          else if(value == _MyColors.blue.index){
            changeBackgroundColor(Colors.blue);
          }
          ///alttaki kod cok tehlikeli bunun yerine sunu yapıcaz artık buna dikkat edelim!
          /*if(value == 0){}
          else if(value == 1){}
          else{}*/
          ///işte burda sunu görüyoruz hemen üstümdeki kodu görsem bottomNavigationBar kısmındaki indexler oldugunu asla anlamam ama ben onun üstündeki enum ile yazdıgım kodu
          ///görsem bu sefer anlamam oldukca kolaylasıcaktır işte kod böyle yazılır!
        }
}

enum _MyColors{
  red,yellow,blue
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(color: color,width: 30,height: 30,);
  }
}
