import 'package:flutter/material.dart';

class ContainerSizedBox extends StatelessWidget {
  const ContainerSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text("a" * 500),
          ),
          SizedBox.shrink(),

          ///ekranda boş bir alan yapmak için kullanılır
          SizedBox.square(dimension: 50, child: Text("v" * 50)),

          ///50 lik bir kare olusturmak için bunu kullanıtız
          Container(
              height: 50,
              constraints: const BoxConstraints(maxWidth: 100, maxHeight: 200),
          child: Text("aa" * 4),
            decoration: ProjectUtility.boxDecoration,
            ///responsive tasarımlarda telefonun boyutunu değiştirirken bu constraints kısmı kullanılıyor
            ///ne yapıyor bu kısım oldukca faydalı max ve min boyutu ayarlıyor!!!
            ///kendini otomatik olarak scale ediyor bu!
          ),
        ],
      ),
    );
  }
}


class ProjectUtility{
  static BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.red,
  shape: BoxShape.circle, ///otomatik olarak daire yapar containeri
  gradient: LinearGradient(colors: [Colors.green,Colors.deepOrange]),
  );
}
class ProjectContainerDecoration extends BoxDecoration{
  ProjectContainerDecoration() : super(
    color: Colors.red,
    shape: BoxShape.circle, ///otomatik olarak daire yapar containeri
    gradient: LinearGradient(colors: [Colors.green,Colors.deepOrange]),
  );
  //bir başka kullanımı da bu sekildedir constructer ile cagrıldıgında super ile alıyor
//ve bunu kullarak da instance olusturmadan atayabilirsin veya instance olarak da
// atayabilirsin farketmez!
}