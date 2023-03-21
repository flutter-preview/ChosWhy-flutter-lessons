import 'package:flutter/material.dart';
import 'package:lessonone/101/navigate_detail.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  List<int> selectedItems = []; //ilk basta boş

  void addSelected(int index,bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final response = await navigateToWidgetNormal<bool>(
                    context: context, widget: NavigateDetailLearnDart(
                  isOkay: selectedItems.contains(index),
                ));
                print("responsun degeri :$response");

                ///true olarak da degerin geri döndüğünü görmüş oldum!
                /*if (response == true) {
                  addSelected(index);
                }*/
                if(response is bool){
                  addSelected(index,response);
                }
              },
              child: Placeholder(
                color:
                    selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () {} /*async{

          final response = await navigateToWidgetNormal<bool>(context: context, widget: NavigateDetailLearnDart());
          print("responsun degeri :$response"); ///true olarak da degerin geri döndüğünü görmüş oldum!
          if(response == true){
            addSelected(index);
          }



          // navigateToWidget(context: context,widget: const NavigateDetailLearnDart());

          /*Navigator.of(context).push(MaterialPageRoute(
            //settings: RouteSettings(arguments: ),
              builder: (context) => ImageLearn(), fullscreenDialog: true));*/
        },
        */
        ,
        child: const Icon(Icons.navigation_rounded),
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(
      {required BuildContext context, required Widget widget}) {
    Navigator.of(context).push(MaterialPageRoute(
        //settings: RouteSettings(arguments: ),
        builder: (context) => widget,
        fullscreenDialog: true));
  }

  Future<T?> navigateToWidgetNormal<T>(
      {required BuildContext context, required Widget widget}) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        //settings: RouteSettings(arguments: ),
        builder: (context) => widget,
        fullscreenDialog: true));
  }
}

///fullScreenDialog = true yaptıgında companentler backIcon degil mesela bunun yerine carpı geliyor ve açılıs farklı oluyor pagenin
/// mesela setting ise de başka bir sayfaya arguman data yollayabiliyoruz bu kullanım da mevcut!
///
/// şimdi şöyle bişey var bu navigation kodlarını bu sekilde kullanmak cok iyi olmuyor kod kalabalıgı bunu su sekilde yazabilirim bi class acalım
///
/// bunu bu sekilde yazarım daha güzel olur kod kalanalıgı ve karmasıklıgı olmaz
/// ama hocam ben bununla ugraşmak istemiyorum static yapıyım dicem ama su var static yapmak surekli bellekte onun tutulması oluyor bu yuzden fazla static yapmak sıkıntı
/// bu yuzden mixin yapalım ? mixin constructersız classdır

///mixin kullanarak static yapmaya hiç gerek kalmadı ve güzelce yazmıs olduk!!!
///
///
///
///bak şimdi aşşagıda ne yaptık push metodunun ustune geldigimizde ne karşılıyor bizi,bize diyorki burdan sen generic bir veri alabilirsin diyor!
///ondan sonra ben pushun üstüne bastıgımda Future<T> generic bir geri dönüş yapabilirim diyor
///bundan dolayı generic bir veriyi geri almam için yukarıdaki yazımı yapmam gerekiyor!
///ondan sonra da NavigateToWidget metodu yerine bunu su sekilde yapıcaz
///bak şimdi yukarıdaki navigate kodunu değiştirdik ve bunu generic ile kısıtladım ben ne yaptım
///<bool> yazısı ile burdan bir adet bool veri alabilirim dedim ve bunu response'ye atadım!
///
/// peki bu await ve async ne demek bu su await bekletiyor ve await atıyosan bu async yani asenkron gerçekleşmesi gerekiyor yani aynı anda gerçekleşmemesi o işlemler gerçekleşmeli sorna bu işlem olmalı diyoruz
/// yani olan olay su sen sayfaya gidiyorsun ama o sayfadayken bieşy olmuyor cunku await atadın aynı anda gerçekleşmiyor işlemler
/// sen o sayfadna cıkarken bu kod asenkron kod calısıcak yani asenkron içerisindeki navigate işleminden sonraki kısım calısıcak sayfadan cıktıgında!
///
/// peki o sayfadan veriyi nasıl aktarıcaz ? onuda diger sayfanın ontap kısmına ve ordan da pop metodunun içerisinde aktarıcaz
/// bakalım yapalım hadi
///

///peki şimdiki senaryo ne benim? bu placeholderların hangisine tıkladıgımı bilmem lazım ve bunun arkaplan rengini de değiştirmem gerek
///o zaman su sekilde bir adet liste içeriisnde tutucam ve bu hangisi seçili ise orda zaten vardır dicem ve rengini değiştirebilicem
///listeyi olusturdum metodu da olusturdum ve color sorgulamasını yaptım ama ben bu metodu placeHoldera vermem lazım ki onun indexini kullanabileyim
///bu yüzden yaazdıgım ontap metodunu oraya taşımam gerkeiyor bu saydede index sorunu da cözzülücektir!
///
/// şimdi ben burdan yeşil yaptım ama bunu geri nasıl kırmızı yapabilirim şimdi bunu yapıcaz
/// öncelikle diger sayfadan bir adet bool değişken tanımlamak lazım
/// onu tanımladık ve adam bunu göndermeyebilir bunu default olarak false atıyorum
///ve ben diger sayfada da label ve iconlarda da bu isOKayin true ya da false olması durumuna göre değişmesini istiyom
///popun geri deger dönmesine de sunu yapıyorum pop(true) değilde widget.isOkay i yolluyorum false olarak geliyor ama bunu ayarlıcaz tabikide! nasıl bi ayar yaptık
///isOkay ne ise tam tersini geri döndürmesini istedik!
///bu propertyi details widgetına parametre olarak da yolluyorum ama neyi yolluyorum
///selectedItems.contains[index] bunu yolluyorak kontrol ediyorum var mı yok mu diye
///bunu yaptıktan sonra response if kısmında da su olmalı hani == true ya degil de bu herhangi bir true ya da false gelebilme ihtimalinden dolayı ve bunu direkt atıcagım için listeye
///== true yerine "is bool" bunu kullanıcam!
///ama su var simdi cıkarma veya ekleme işlemi için su lazım bi tane daha bi property ekliyorum nereye addSelectede
///bunu da ayarladım. ekleme ve cıkarma mantıgında da responseyi versem yeterli cunku onun degerine neyse ona göre eklenicek veya cıkarılıcak bu mantık var!
///
///bu kodlarla tertemiz navigation anlatan ve birazcık da manager yaptıgımız bi alıştırma oldu buna biraz daha incelemek ve kafaya tam oturması gerek!
///