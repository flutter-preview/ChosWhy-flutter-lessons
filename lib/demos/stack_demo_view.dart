import 'package:flutter/material.dart';
import 'package:lessonone/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final double _cardHeight = 50;
  final double _cardWidht = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///imagenin tüm ekranı kaplamasını istiyoruz burda
                  Positioned.fill(
                      bottom: _cardHeight / 2,
                      child: const RandomImage()),

                  ///bottom dan 25 yukarı kaldırdıgında imageyi o zaman companenti kurtarmıs olduk bak buna dikkat et karmasıklıga gerek yok!!!!
                  Positioned(
                    width: _cardWidht,
                    height: _cardHeight,
                    bottom: 0,
                    child: _CardCustom(),
                  )
                ],
              )),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }

  Card _CardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}

///sarch kısmını positined ve card ile yapabilirim veya 50 heightlik bir card!!!
///içerde bişi varsa ve kod büyüyosa hemen dışarı cıkar mantıgını kullanıp da cardı dısarı cıkardık ve extract metod yapmamızın sebebi de kücük bişi oldugu için
///yani koda baktıgımızda direkt tık tık tık okuyabilmeliyiz bu yuzden dısarıya cıkartmalıyız bu kodları uzun uzadıya olursa
///