import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,///paddingi kaldırdık
        children: [
          FittedBox(child: Text("Merhaba",style: Theme.of(context).textTheme.displayMedium,maxLines: 1)),
          Container(color: Colors.red,height: 300,),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
              Container(color: Colors.green,width: 200,),
                Container(color: Colors.white,width: 200,),
                Container(color: Colors.green,width: 200,),
            ],),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.close)),

          ///xxxxx
          FittedBox(child: Text("Merhaba",style: Theme.of(context).textTheme.displayMedium,maxLines: 1)),
          Container(color: Colors.red,height: 300,),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green,width: 200,),
                Container(color: Colors.white,width: 200,),
                Container(color: Colors.green,width: 200,),
              ],),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.close)),

          ///xxx
          _ListDemo(),
        ],
      ),
    );
  }
}
class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print("hello");
  }
  @override
  void dispose() {
    super.dispose();
    print("exit");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



///FittedBox bizim widgetımızın parent alanını direkt olarak kapsayan style ile ugraştırmayan bir widgettır!
///
/// listviewda sunu yaptım initState ile her o sayfaya gelişimde hello her cıkısımda exit yazdırdım dikkat!
/// deault olarak bi acılıyor bi kapanıyor modu var diyebiliriim
/// aslında companent cizimini üzerine geldiginde yapıyor sonra cizimi siliyor!
/// ciziliyor tekrar call ediliyor ve bu sayede bellekte tutulmuyor sayfalar
///
/// şimdi bunun bi propertysi var shringkWrap diye bu listViewin parent widgetının atıyorum bi width veya heigth scroll a göre degişir bunu vermediniz
/// shrinkWrap = true yaparsanız bu listView içerisindeki elemanların boyutuna göre ayarlıyor listViewin kapladıgı alanı buna dikkat genelde istedigimiiz şeyleri bunu verdiysek
/// yapamayabiliriz o yuzden genel olarak onu vermemeye calısın!
///
/// burda temel mnatık işte sayfayı her defasında tekrar call etmesi bu yuzden datayı vs alırken falan birde dispose da sıfırlamamız gerkeiyor falan bunlara dikkat
///