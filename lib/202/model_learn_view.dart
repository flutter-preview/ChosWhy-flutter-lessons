import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: "body",id: 10);

  @override
  void initState() {
    super.initState();
    final user1 = PostModel()
    ..userId = 1..title = "deneme"..id = 1;
    user1.body = "hello";

    final user2 = PostModel2("a", "deneme", 2, 10);
    user2.id = 10;

    final user3 = PostModel3(1, 2, "a", "b");
    //user3.id = 10;
    //user3 = user2;
    
    final user4 = PostModel4(userId: 1, id: 2, body: "body", title: "title");
    //user4.body = "asddas";

    final user5 = PostModel5(userId: 1, id: 2, body: "body", title: "title");
    //user5.
    user5.title;

    final user6 = PostModel6(userId: 1, id: 2, body: "body", title: "title");
    //user6.

    final user7 = PostModel7();

    final user8 = PostModel8(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          //user9 = PostModel8(title: "fy");
          ///ben bunu bu sekilde user9 un tipini var yaptıgımda içerisindeki dataların finallıgını korudum
          ///daha sonra da baska bir postModel8 ile de titlini değiştirmiş oldum oldukca güçlü bir kullanımdır bu buna dikkat et ögren!!!!!
          ///ama su var ben bunun titlesini güncelledigimde eski user9 daki body noldu body gitti cünkü sen artık farklı bir referansı usser9 a atamıs oldugun için body yok peki caresi ne dicek olursak caresi
          ///body i ya tekrardan girersin yada böyle bir güncelleme yapmazsın!
          ///ama en best practice yöntem ise daha önceden de kullandıgımız bir metot ne bu copyWith metodu
          ///bu metodu kendimiz yazmayı ögrenicez!
          ///copyWith metodu sayesinde bir önceki silinen verielri de alabiliyosun hani bodyi kaybetmiştik copyWith metodu yazdıktan sonra bu yeni title verisi artık o bizim elemanımız oluyor aileye dahil oluyor diyebilirz
          ///diger veriler silinmiyor! korunuyor!
          ///
          //user9 = PostModel8(title: "fy"); bunun yerien alttaki kodu kullanıyosun
          user9 = user9.copyWith(title: "furkan");
          ///önce ne yaptım body vardı ekranda sonra butona tıkladım ve sonra titleyi yazdım ama sornasında tekrar body yazdıgımda body orda geri cıkabiliyordu işte bu işe yarıyor!
          ///buna dikkat etmek lazım genellikle listelerde kullanıyoruz bunları cünkü listeler referans bir tiptir bu yüzden orda karsımıza cokca cıkıyor
          ///
          /// şimdi başka bir sanaryo su olsun biz bodyi sornadan değişebilir yapalım yani final ekini kaldıralım  okey
          /// ardıdan su sekilde bir yazım yazdıgımızda
          user9.body = "a";
          ///işte bu şekilde bir kod asla yazmamamız gerkeiyor oldukca kotu bir koddur bu! bunun yerine bir modelimiz zaten mevcut su kodu yazabilirsin
          ///model_learne git
          ///bunun yerine sunu yaz
          user9.updateBody("nnewData");
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? "Not has any data"),
      ),
    );
  }
}

///PostModel1 de initSatete içerisinde işte nesneyi olusturduktan sonra bu sekilde eşitlemeler kullanarak dolduruyoruz
///yine burda görüldüğü üzere ".." kullanarak atamaları daha kolay bir şekilde de verebiliyoruz
///PostModel2 de ise yine initSatete içerisinde degerlerini girdik ama bizden direkt olarak degerleri vermemizi istedi!
///yine final olmadıgı için de degerlerini değiştirebildik!
///PostModel3 de ise bak ne oluyor artık değiştirmeye kalktıgımda hataları almaya baslıyoruz
///cunku bunlar final olarak tanımlanmıslar ve sadece constructer ile değiştirilebiliyor!
///yine nesneler de final olarak tanımlandıgı için bunlar üzerinde atamalar da yapamayız!
///PostModel4 de ise yine bak namedden ötürü atnamama degilde burdaki değişkenler de final oldugu için sonradan nesne üzerinden değiştirilemiyor!
///PostModel5 de ise bakın bu sefer user5 "." koyduguma içeriisnde hiçbirşey görmüyorum neden cünkü private olarak atadıgım için
///içerisidne herhangi birşey göremicez! peki nasıl verdigimiz degerleri görebilicez bunun birden fazla farklı yöntemi var
///encapsulation olabilir yani get set metotları ile deger alma atama gibi veya bu degerleri başka bir değişkene atayabilirsin gereksiz ama görmek açısından yararlı olabilir!
///PostModel6 da ise yine 5 de oldugu gibi bi kullanım sözkonusu
///PostModel7 de ise degerelrini vermeyebilirsin cunku default degerler sen değişkenlere degerleri vermezsen onlar atanıcaktır ama istedigine de degerler atayabilirsin!
///PostModel8 de ise artık servislerden veriyi aldın bunu burda kullanabilirsin!
///
/// ///servisten data alıyosun en mantıkl işlem PostModel8 dir ama localde yani biz projenin içerisinde birkaç işlem yapıcaksak
/// kullanım senaryonsuna göre en iyi olucak modeli seçip kullanmamız gerekmektedir!
///
/// genel olarak biz bunları biryerlerde kullanırız işte user9 un bodysini appbarda kullandım
/// ama karşıma hep su sekilde bi hata cıkıcaktır Strinng ifade alır ama bu ifade String? der null olabilir der hemen ?? koyarak null gelme durumunu katarız!
///
/// bir sonraki senaryom su olsun ben floatActionButtona tıklandıgında user9 üzerinden birveriyi degiştirmek istiyorum ama bunu yapama cünkü hem user9 final hemde değişkenler final
/// o zaman sunları su sekilde degiştirebilirsin gidip değişicek olanların final kısımlarını kaldırabilirsin veya user9 un finalını ya var ya da PostModel8 tipinde yapabilirsin!
///