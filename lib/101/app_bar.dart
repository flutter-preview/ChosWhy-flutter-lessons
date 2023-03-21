import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = "Welcome Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mark_as_unread_sharp)),
          Center(child: CircularProgressIndicator()),

          ///sayfa istekleri sırasında internet bağlantısı yavassa veya herhangi bi sıkıntı istek oldugunda bu kullanılır
        ],
        centerTitle: true,

        ///sayfayı birebir yapmak için yine appbar olucak ama appbarın sanki yokmus gibi bozukmesini saglıcak özellikler var
        //bu özellikelr şunlar:
        backgroundColor: Colors.transparent,
        elevation: 0,
        //ödne gözükmesini sağlayan bir etken

        ///appbarın üstündeki durum cubugunu ayarlama da var oda su sekilde:
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leadingWidth: 23,

        ///defaultta 56pixel ama 23 veya 30 yaparak daha yakına cekebiliriz

        actionsIconTheme: IconThemeData(color: Colors.blueAccent, size: 40),
        //bulunan tüm ıconları update ediyor
        toolbarTextStyle: TextStyle(color: Colors.red),

        ///appbarın tittle vs degilde actions içerisindeki textleri oynama yapar

        automaticallyImplyLeading:
            false, //bu kod sayfada otomatik olarak back buton gelmesin demek oluyor
        //siz başka sayfa yaptıgınızda otomatik olarak backbutton gelicektir onu false yapınca gelmicektir
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}

///bazı kodlar üstü çizili oluyor yani deprecate olmuslar
///bu durumlarda acıklamalarında bunu kullan diye bişi vardır mesela toolbarTextStlye özelliği deprecate olmus bir özelliğin yeirne gelmiştir
///
