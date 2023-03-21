import 'package:flutter/material.dart';
import 'package:lessonone/101/icon_learn.dart';
import 'package:lessonone/101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin ,_TabLearnSizeUtility{
  late final TabController _tabController;

  @override
  void initState() {
    ///sayfa her yüklendiginde daha temiz calısıcak init state içerisinde verirsem eger!
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            ///bu kod satırı ise bizim butonumuzun tıklandıgında hangi sayfaya gidicegini saglıyor
            //_tabController.animateTo(0); bak mesela bunu da bu sekilde kullanmıcaz en sonlarda
            _tabController.animateTo(_MyTabViews.home.index); //homenin indexine git diyoruz!
          }),
          bottomNavigationBar: BottomAppBar(
            height: heigth,
            notchMargin: notchSize,
            shape: const CircularNotchedRectangle(),
            child: _myTab(),
                /// burda yatan ana mantık su önce maplıyoruz sonra döndürürken listeliyoruz
          ),
          /*appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
            tabs: const [
          Tab(child: Text("Page1"),),
          Tab(child: Text("Page2"),),
        ]),
      ),
       */
          body: _tabView(),
        ));
  }

  TabBar _myTab() {
    return TabBar(
              indicatorColor: Colors.orangeAccent,

              ///aşşagıdaki scroll cubugunun rengini ayarlıyor

              //isScrollable: true, ///tabları sıkıstırmakta yarıyor bazı durumlarda işe yarıyor!
              labelColor: Colors.red,

              ///bottomdaki textlerin rengini değiştiriyor
              unselectedLabelColor: Colors.green,
              //burda da aktif olmayan butonun rengini değiştiriyor
              padding: EdgeInsets.zero,
              controller: _tabController,
              onTap: (int value) {
                print(value);

                ///ontab metodu sayesinde de burda ben hangi tab butonuna tıklandıgını print ile görmüş oldum!
              },
              tabs: _MyTabViews.values.map((values) => Tab(child: Center(child: Text("Page${values.name}")),)).toList());
  }

  TabBarView _tabView() {
    return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              const ImageLearn(),
              IconLearnView(),
              const ImageLearn(),
              IconLearnView(),
            ]);
  }
}

class _TabLearnSizeUtility{
  final double heigth = 50;
  final double notchSize = 10;
}

enum _MyTabViews{
  home,settings,favorite,profile,
}
extension _MyTabViewExtension on _MyTabViews{
  ///enum içerisinde metot yazamadıgımız için extension kullanıyoruz
  ///ve burda önce isim sonra on ile hangi classa yazıcagımızı belirliyoruz!
  //suanda biz eger isimleri geri döndürüceksek suanda buna gerek yok enum içerisindeki verileri
  //map yaparak da halledebiliriz!
}

///aga DefaultTabController veriyosun scaffold yerine bunun childine scaffoldu veriyosun
///bu widget cok güzelmiş lan animasyonlu geçişi cok guzel saglıyor buna bir adet ben
///giriş ekranı yapayım bari aşırı kullanımı hoş birşey!
///appbar ve bottomNavigationBar kısımlarında da ufak caplı birkaç değişiklik oluyor ama sourn degil
///
/// bu companenti tasarlamak aslında cok basit önce bottomNavigationBarı ayarladın
/// sonra float action button koydun
/// sonra locationını dockedCenter yaptın
/// sonra BottomAppBar içerisinde notchmargin ile boşlugun ne kadar olmasını belirledin
/// sonra da shape atıyarak CircularNotchedRectangle() verdiginde oldukca güzel bi companent elde ettin
///
/// şimdi sunu istedim neyi istedim ben floatActionButtonda tıklandıgında 1.page ye gelsin istedim
///şimdi ben bir adet tabControllera sahip olmam gerekiyor yani bunrdan control edicem diyorum
///bu TabBarController tipinde olması gerekiyor onu veridigimde initState içerisinde verdim vermesemde hani farketmez karmasık bi uygulama yapmıyorum suanda
///ordan bi adet initSate içerisinde TabController a ulastım benden length istedi 2 verdik vsych istedi bu ise this verirsem
///TickerProviderStateMixin mixin sınıfından default degerini aldı ordan çektik
///sonra tabBar widgetının ieçrisindeki controllera benim tanımladıgım kontroller atandı ve kolayca control etmiş oldum
///hem body dekine hemde bottomdaki controller propertysine vericeksin ama controlleri
///
/// tabBarWiew sadece wiewları içine alıyor Tab widgetı ise ordaki butonu saglamıs oluyor
///
/// müşteri bu geçişleri kapatmamızı istiyosa TabBarView içinde physics var bunu neverScrollableScrollPhysics ile geçişleri kapatabiliyosunuz
///
/// yine biz tabbarTheme ile de proje genelinde olucak işlemleri buradan verebilioyurz
///yine bottomAppBarTheme da var themelarda!
///themenın avantajlarından hatırlatalım theme ya yazarsan kod temizligi olur,her zaman oraya yazmak daha iyidir
///daha sade ve okunur olur,herhangi bir değişikliği ordan control edebilirsin
///
///
/// şimdi burda dikkat etmemiz gereken hususlar sunlardır!:
///şimdi bi view companenti olusuturucaksak bunları enum içinde yapmamız gerekiyor o da su sekilde!
///enum okey peki viewları yani sayfa kısımlarını nasıl yapıcaz dersek artık burda bolca kullanılıcagımız olan extension yazmak
///bir classa veya bir nesneye güç kazandırmaktır extension!
