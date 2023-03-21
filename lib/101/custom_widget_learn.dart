import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String _title = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFoodButton(title: _title,onPressed: (){}),
              )),
          CustomFoodButton(title: _title,onPressed: (){}),
        ],
      ),
    );
  }
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.title, required this.onPressed}) : super(key: key);
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: Colors.red, shape: StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: normalPadding2X,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

///utility yarar fayda demek!
class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8);
  final EdgeInsets normalPadding2X = const EdgeInsets.all(16);
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

///bazen flutterin verdigi özellikler bize yetmeyebiliyor bu nedenle custom companentler olusturuyoruz
///kendi projemize dahil edebilicegimiz bileşenler ama bunlar özel bileşen yani companent oluyor
///
///yani biraz daha oop de ileri gidersek bu sınıfı with ile eklersek classa o zaman direkt olarak redColor ı göreiblirim
///yine tabikide bu güç kazandırır ama fazla olması durumunda zararı da vardır herşeyde oldugu gibi dikkatli kullanmak gerek
///dezavantajı su olabilir 100 tane renk olursa gereksiz renk katmıs olucaz bu dezavantaj olucaktır!
///kullanılmayan seyler gelicek!
///
/// şimdi şöyle bişey var siz anasayfanızı parçalarsanız burda oldugu gibi mesela bu colorsUtilityi sadece foodButtonWidgetı kullanıcak bu sayede
/// ana sayfanız temiz kalıcak ve kalite artmıs olucak buda güzel bişidir!
///
/// //constun faydası ve zararı!!!
/// ana sınıfın const olması bellekte bir avantaj saglar buna dikkat et
/// ve bunlar ara classlarda oldugu için daha iyi bi kullanım ana sınıfta olmasındansa
///
/// şimdi geliştirdiğimiz customWidget geliştiricinin widgetın kullanıldıgı classdan kontrol edebilemsi gerekiyor
/// customWidget classının içerisinden oynamalar yapmaması gerekiyor buna dikkat sen bu widgetı dışarıdan propertyleri ile geliştirmen daha kabul edici bişidir!
///

///naptık bak companent 2 türlü kullanılıyor hem büyük olarak hem de kğcğk olarak renklerle ve title ile güzel gelişime açık yani
///geliştirici bu companenti isteigi sekilde geliştirebilir buna dikkat!!!
///yani core companentler privity yapar ana hatlar gelir ara hatları geliştirici yapar bu yuzden buna dikkat paddinglerde oynama sıkıntısı yaratabilir bazı senaryolar
///

//şimdi tıklanma durumlarında callback metodu yazmayı görelim!!
///şöyle ki core companent yapmakla widgetı dışarı cıkarmak bambaska seyler buna dikkat edelim
///core companent işte dışarıdan etkilenmemesi gerkeiyor ve bunu heryerde kullanabilmem gerekiyor
///ha yarın birgün adam dicekki kırmızı degilde pembe olsun dicek o zaman parametreli core companent onu da ilerleen zamanlarda konusucaz!!
///
