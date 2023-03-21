import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [const LinearProgressIndicator()],
      ),
      body: Column(
        children: [
          CenterCircularProgress(),
          LinearProgressIndicator(),
          ///yine cok gözükmez ama linear progress indicator de kullanılan bişeydir!!
        ],
      ),
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
//biz bunu genelde appbarın actionunuda kullanırız!
///bunun genel özelliklerinden bazen temaya göre oynanması gereken özelliklerinden birisi de rengidir!
///bu aslında her sayfada ortaktır ve bunu yine extract widget olarak cıkartabiliriz!
///her sayfada ortak olmasından dolayı rengi de çok fazla degişmemesi gerekmektedir rengi cok degişiyosa sorundur!
///bu ortaklıktan hocam themeda varmıdır vardır tabiki !
///ha sen ben illahaki bunun rengini ezmek istiyorum diyorsan su skeilde yapıcan rengi tanımlıcaksın sonra color a atıcaksın ama sunu unutma
///o zamna centerprogress ismi degişmeli centercircularredprogress gibisinden olamlı yani ne kullanıyosna ona uygun isim olmak zorunda
///

///indicator nedir nasıl işler şu şekilde:
///şimdi kodları yazdınız sayfayı yaptınız en son internetten veri çekiceksiniz işte giriş sayfası vardır atıyorım banka olsun
///bankaya ilk girdiginizde bomboş bi ekran vardır bu ekranda sizin işte kimliginizi kontrol eder özel durumlarınızı bilgilerinizi kontrol eder bu süre boyunca
///ekranda yuvarlak birşey döner ve eger onaylanırsa bu kısmı geçersiniz onaylanmazsa su su hatası var vs şeklinde geriye döndürür hataları işte bu duruma indicator denir
///
