import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            child: PngImage(name: PngImageItems().appleWithBook),
            height: 150,
            width: 300,
          ),

          Image.network("https://png.pngtree.com/png-vector/20201207/ourlarge/pngtree-apple-on-book-vector-icon-school-and-education-png-image_2505817.jpg",
          errorBuilder: (context, error, stackTrace) => Icon(Icons.abc_outlined),),
          ///errorBuilder ise ımage gelmedigi durumda bu gözükücek seklinde yapıyor!
        ],
      ),
    );
  }
}

///bunu bu şekilde efektif bir kullanım da mumkun olmaktadır sadece image dosyasının adını yazarak hop naptık girdik veriyi!
///daha kolay bir kullanım olmus oldu!
class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath(),
      fit: BoxFit.cover,
    );
  }
  String _nameWithPath() => "assets/images/$name.png";
  //yine bunu bu sekilde çekerek de tertemiz bir okuma ile ekranda olmus olur!
//bunu yapmamızdaki amaç burda static birşeyin yazmaması bu yuzden get metodu ile daha rahat olmus oluyor!
//yukarıdaki gibi yaapbilicemiz gibi su sekilde de yaparız
  String get _nameWithPath2 => "assets/images/$name.png";
}
//naptım yukardaki class ile aşşagıdaki items classını kullanımını efektif olarak birbiriyle ilişkisini sağladım kısmen!
class PngImageItems{
  final String appleWithBook = "applewithbook";
}


class ImageItems {
  final String appleWithBook = "assets/images/applewithbook.png";
}
