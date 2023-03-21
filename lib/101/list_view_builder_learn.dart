import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
        print(index);
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              Expanded(child: Image.network("https://picsum.photos/200")),
              Text("$index"),
            ],
          ),
        );
      },),
    );
  }
}


///yine bu da listviewdaki gibi calısıyor gözükmeyenlerı siliyor bunun kullanımnı daha güzel aslında
///bu sayede crash yemenin önüne geçilmiş oluyor uygulamalarda!
///
/// bak yukarıda ne oldu buna asırı dikkat et!!!
/// normalde itemcount verdiginde itemcount kadar ekrana cizer ve print ettiginde bunu rahatlıkla görebilirsin ne kadar eleman cizdigini
/// ve burda 14.indexe kadar yani 15 item cizmiş olur ama su varki
/// ben bunu colum ile sardım ve sınırlandırdıgımda ve taşmaları engellemek için ise expanded kullandıgımda bu sefer ekran boyutu kadar cizdi ve daha temiz bir tasarım olusturdu
/// 4 adet cizdi ve ekrana yedirdi aşşagıya dogru gittiginde ise diger indexteki elemanlar yüklenicektir ama 4 den fazla yüklenmicektir!