import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lessonone/101/list_view_builder_learn.dart';
import 'package:lessonone/101/list_view_learn.dart';
import 'package:lessonone/101/navigation_learn.dart';
import 'package:lessonone/101/page_view_learn.dart';
import 'package:lessonone/101/statefull_learn.dart';
import 'package:lessonone/101/statefull_life_cycle_learn.dart';
import 'package:lessonone/101/text_field_learn.dart';
import 'package:lessonone/202/deneme.dart';
import 'package:lessonone/202/model_learn_view.dart';
import 'package:lessonone/202/service/deneme.dart';
import 'package:lessonone/202/service/service_learn_view.dart';
import 'package:lessonone/202/tab_learn.dart';
import 'package:lessonone/202/theme/light_theme.dart';
import 'package:lessonone/demos/color_demos_view.dart';
import 'package:lessonone/demos/color_life_cycle.dart';
import '101/color_learn.dart';
import '202/deneme_view.dart';
import '202/package_learn_view.dart';
import '202/service/service_learn_view_advance.dart';
import '202/theme_learn_view.dart';
import '202/widget_size_enum_learn_view.dart';
import 'demos/my_collections_demos.dart';
import 'demos/stack_demo_view.dart';
void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter Demo",
      ///burda profesyonel içerik üretirken belirli standlarlar var bu da appbarın hep aynı olması mesela
      ///burda themeyı bilmemiz gerekiyor mesela theme dan darkı olucak ama copywith ile de bazı degişiklikler yapıcam diyorum
      ///burdan tüm appbarlarda tittle hepsinde ortada olsun diyoruz örnegin bu
      ///bunları 1 kez verdigimde tüm app arayüz sayfalarımda aynı standartı görmüş olucam!
      ///yine de bazı özelleştirmelerde o sayfanın özelleştirmek istedigini yazabilirsin.
      theme: LightTheme().theme,
      /*
      ThemeData.dark().copyWith(
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
          dense: true,
          ///yine temayı burdan yaparsan o zaman kullanımı daha efektif olucaktır
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.red,
          ///yine bunun da teması vardır ve burdan bu sekilde yapmak tüm projelerde ortaklıgı saglamaktadır taibkide sen bu özelligi ezmedigin sürece!!
        ),
        cardTheme: CardTheme(
          ///senin bütün carlarının özellikleri ortak olucaksa bunları burdan tanımlamalısın
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ///bu kodu bu sekilde yazınca tüm cardlarımda ortak olan bu oldu ezmedigim sürece!
        ),
        errorColor: ColorsItems.sulu,
        //ben buraya errorcolor atarsam bunu ilerideki widgetlarda Theme.of(context).errorColor seklidne verebilirim.
        //yine baska bir color geldiginde projeye degiştirebilicem yani o sayfa için errorcoloru
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.orange),
          filled: true,
          fillColor: Colors.white24,
          iconColor: Colors.red,
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(color: Colors.red,fontSize: 24),
        ),//yine inputtan oldugu gibi textSelectionTheme den de bazı özellikleri kolaylıkla yapabiliyorsun!
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.green,
          selectionColor: Colors.red,
          selectionHandleColor: Colors.blue
        ),
        textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.red)),
        ///bu yukarıdaki kod ise benim textField ımın içindeki yazıyı kontrol etmemi saglıyor!
        ///ama dikkat etmemiz gereken nokta su bu sefer subTitle1 lerin hepsi red oldu ehehe
        ///yani aslında bunun gibi subtitle özelliklerine burlardan degişiklikler atanmamalıdır!
        ///ha naparsın sen bu kısma özellik kazandırırsın onu da ilerleyen zamanlarda gözücez!
        ///

        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.green,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.zero,
        )
      ),
       */
      home: const WidgetSizeEnumLearnView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

///yavaştan artık bazı şeyleri da öğrenme zamanı gelmiş bunlarda core ve product klasörüdür
///core kalsoru : projeye özgü olmayan başka projelerde de kullanılabilicek olan companentleri core klasörüne atıyoruz!
///product klasoru :sadece projeye ozgu olan companentler buraya dahil olucak!




///uplash tasarım sitesidir!
///zeplin de tasarım incelemede kullanılır!
///
///
/// Kısa yollar! satırı komple seçip silme ctrl+y
/// satırı komple kopyalam ctrl+d
/// ohaa ifadeyi ctrl+alt+t ile kosul durumlarına kolaylıkla sokabiliyorum
/// yine fazlaca kopyalama yaptıysan bunun geçmişine erişebilmeyi sağlayan kısım su control+shift+v
/// bir satırda kelimenin sonuna veya başıan gitmek için ctrl+yön okları!!
/// satırları kaydırma işlemlerini ctrl+shift+yukarı aşşa yön okları ile yapabilirsiniz
/// yine geri alma sıkça yapılan birşeydir ctrl+z
/// kopyala yapıştır ctrl+c , ctrl+v
/// seçili olan ifadenin kullanılan tüm alanlarda değişiklik yapması için ctrl+shift+alt+j
/// mause ile çoklu satırı seçme alt+mause sürüklemesi
/// seçimi büyük,küçük harf yapmak ctrl+shift+u
/// kodları otomatik düzenlem ctrl+alt+l
/// bazen bazı şeyleri bulmak zordur bunun için shift+shift basarak hızlıca arama yeri açılır bu kodları bulur
/// eylemleri bulmak için ise ctrl+shift+a tuşları ile search kısmı acılıcaktır!
/// dokumantosyonu ise o kodların ctrl+q ile görürüz
/// fonksiyonların parametre listelerini görmek için ctrl+p
/// ctrl+. yaparsam o kısım kodlarını kapatır ama ... seklinde kapatır!
///
