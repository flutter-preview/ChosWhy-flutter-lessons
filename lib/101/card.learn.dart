import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            shape: ProjectBorderRadius.roundedRectangleBorder,
            color: Colors.white,
            margin: ProjectMargins.cardMargin,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
          _CustomCard(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                  child: Text(
                "Furkan",
                style: TextStyle(color: Colors.black),
              )),
            ),

            ///bak bunu da buraya eklersin ve bu sayede  sürekli olarak carda kod yazmayız buna dikkat et!!!!
            ///sadece customcardı card olucak sekilde yapıyorum!!
          ),
          Card(
            shape: CircleBorder(),
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
//Borders: CircleBorder,StadiumBorder,RaoundedRectangleBorder!!!

class _CustomCard extends StatelessWidget {
  @override
  const _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),

      ///stadium borderin özelliği kenarları kıvırmak ve stadium tipini almaktır!!
      color: Theme.of(context).errorColor,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

class ProjectBorderRadius {
  ///yine bunu böyle yapmak yerine theme diye bişi var ordan da yapabilirsin!!!
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}

///cardın görünürlüğü biraz önde olur yani elevation ı yüksektir!
///dikkat simdi söyle bişey var bu customCard ise sadece cardı içermeli yani başka bir widget olmamalı buna dikkat et
///peki SizedBoxı nasıl vericem pnu da widget alan bi değişken yapıcam!!
