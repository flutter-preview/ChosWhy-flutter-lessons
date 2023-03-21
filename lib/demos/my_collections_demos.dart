import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: _PaddingUtility().paddingHorizontalNormal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget with _PaddingUtility{

  _CategoryCard({Key? key,required CollectionModel model}){
    _model = model;
  }

  //final List<CollectionModel> _items;
  //abi bana neden tekrar items olusturuyosun ki bana sadece modeli yolla geriis hallolur!
  late final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: marginBottomNormal,
      child: SizedBox(
          height: 300,
          child: Padding(
            padding: paddingNormalAll,
            child: Column(
              children: [
                Expanded(child: Image.asset(_model.imagePath)),
                Padding(
                  padding: paddingNormalTop,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_model.title),
                      Text("${_model.price} eth"),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class _PaddingUtility{
  final paddingNormalTop = const EdgeInsets.only(top: 15);
  final paddingNormalAll= const EdgeInsets.all(20);
  final marginBottomNormal = const EdgeInsets.only(bottom: 20);
  final paddingHorizontalNormal = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems{
  late final List<CollectionModel> items;
  CollectionItems(){
    items = [
      CollectionModel(
          imagePath: "assets/images/remove_bg_collection_image.png",
          title: "Abstract art",
          price: 3.4),
      CollectionModel(
          imagePath: "assets/images/remove_bg_collection_image.png",
          title: "Abstract art2",
          price: 3.4),
      CollectionModel(
          imagePath: "assets/images/remove_bg_collection_image.png",
          title: "Abstract art3",
          price: 3.4),
      CollectionModel(
          imagePath: "assets/images/remove_bg_collection_image.png",
          title: "Abstract art4",
          price: 3.4),
    ];
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

///resimlerin arkaplanını silmek için removebg sitesinden yapabilirsin!
///late demek sonradan deger gelicek ama sadece constructerdan deger gelicek demektir!
///late final ise constructerdan deger alıcak ve bidaha degişmicek demektir!

///dikkat bazı paddingler listviewin içerisinden verilmeli mesela burda oldugu gibi
///
/// burdaki ana derdimiz pis kodları ana classdan main classdan kurtarmaktır!! bunları üşenmeden yapıcaz!
///