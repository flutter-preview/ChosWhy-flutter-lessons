import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Image.asset(ImagePaths.applewithbook.path()),
          ///toWidget companenti
          ImagePaths.applewithbook.toWidget(), //bunu bu sekilde de kullanımı mevcut

          //Icons
          Icon(IconPaths.add.path()),
          IconPaths.add.toWidget(),
          IconPaths.add.toWidgetWithSizes(size: 60),
        ],
      ), //bunu da bu sekilde entegre ederek daha temiz kod yazmıs oluyoruz
    );
  }
}
enum IconPaths{
  add,
}
extension IconPathsExtension on IconPaths{
  IconData path(){
    return Icons.add;
  }

  Widget toWidget(){
    return Icon(path());
  }

  Widget toWidgetWithSizes({double size = 35}){
    return Icon(path(),size: size,);
  }
}

enum ImagePaths{
  applewithbook,
}
extension ImagePathsExtension on ImagePaths{
  String path(){
    return "assets/images/$name.png";
  }

  Widget toWidget(){
    return Image.asset(path()); // yine bu kullanım da olabilir
  }

  Widget toWidgetWithSize({double? width,double height = 100}){
    return Image.asset(path(),height: height,width: width,);
  }
}



///şimdi bu image ekleme yönteminde biz normal sekilde bu sekilde ekliyerek kullanabiliyoruz
///bu eklemenın bi üst seviyesi class olusturarak eklemek oluyoruz bunu kullanabiliriz
///ama bunu bir tık daha iyi kullanım da enum kullanarak ypamaktır
///
/// peki bunu ekledik de nasıl kullanıcaz? extension ekliyerek kullanıcaz
/// burda extension ile bak best practice bunu bu sekilde kullanabilirz burdaki name ile ben
/// enumdaki degeri alabiliyorum!
///
/// tabi diger şekillerde ekleme kısımlarını da koyabilirsin arttırabilirsin extension içerisinde orası
/// bize kalmıs bişey
///
/// yine sunu da yapabiliriz bak widget olarka döndürmesini
/// bunu yaparak sadece enum içerisinde tüm imagelerini yönetiyo olucaksın ama burda dikkat etmen gerekn bi kısım var
/// oda enuma yazarken ifadeyi senin image dosyanın adını aynı yazman gerekiyor cunku o dosya adını alıp
/// patha atıyosun buna dikkat!!!
///
/// peki ben width height vermek istiyorum diyosan propertyi atıcaksın knk
///
/// burda su var yine ımageleri ayarladıgımız gibi iconları da enumlarla best practice ayarlıyaibliyoruz
/// bunu da biz yapalım!!!!