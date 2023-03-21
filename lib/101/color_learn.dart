import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("data",style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: Theme.of(context).errorColor,
        ),),
        //color: ColorsItems.sulu,
        color: Theme.of(context).errorColor,
      ),
    );
  }
}

class ColorsItems{
  final Color porchase = Color(0xffEDBF61);
  static final Color sulu = Color.fromRGBO(198, 237, 97, 1);
}

///birinci kural hiçbir class dısında kod yazmıcaksın bunu unutmaa class dısı kod yazma yok unut
///
