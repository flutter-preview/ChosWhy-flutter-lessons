import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd; ///bu karakterler sonradan değişmeyeceklerdir!
  @override
  //müşteri bize sunu diyor furkan diyor mesaj tekse tek yoksa cift yaz diyor!
  //yukarıda ne yaptık late final yaptık 1 kez initstete le degeriin alıcak ve bidaha degeri değişmicek anlamına gelen kodu yazdık

  ///artık _isOdd u widget.message.lenght.isOdd yerine heryerde kullanabilirim
  ///
  /// initState aslında bir constructer metotdur ve sadece 1 kez calısır buna dikkat edelim!
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    //bu aşşagıdaki logic asla init state içerisinde bu sekilde acık acık yazılmamalıdır!
    /*
    if(_isOdd){
      _message+= "cift";
    }
    else
      _message += "Tek";
    */
    _computeData();
  }
  void _computeData(){
    if(_isOdd){
      _message+= " cift";
    }
    else
      _message += " Tek";
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  ///bunu yine pek tercih etmyoruz cunku her yenilikte cagırılıyor diye muhtemelenü

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget != widget.message){
      _message = widget.message;
      _computeData();
      setState(() {});
      ///burda ne oldu peki eski value ile yeni value birbirine eşit degilse _message yeni data ile eşitle
      ///computdatayı cagır teklik ciftlik durumunu sonra ekranımı güncelle yaptım!!
      ///bu tarz bir snaryo yaptık!!!
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    ///bu ise salfalarıımzı call edicegimiz zaman kullanıcagımız bir özellik
    ///yani aslında dispose sayfanın cıktıgı yani bi sayfadan diger sayfaya geçiş yapıldıgında eski sayfanın
    ///öldüğünüde cagrılan bişeydir
    ///bunu ise genelde bu değişkenlerimizi burada kullanırız cunku gereksiz yere uygulamada kullanılmasın birnevi fonksiyon içerisinde nesne yaratma
    ///burda ne oluyor sonrasında o nesne bellekten siliniyor burda da bu degişkenleri buraya yazdıgımızda bu degişkenlerimiz siliniyor ama sayfayı geri cagırdıgımızda
    ///yeniden oluşuyor

    _message = "";
    ///yani sayfayla işiniz bitti o zaman burda bunları öldürme işlemini yapıyoruz
    ///bu degerler null olabilir clearlanabilir veya bu sekilde kalabilir!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_message),
          //hemen aşaşgıdaki koda gerek kalmıyor yani yukarıda message controlu yaptıgımızdan ötürü,direkt ekranda gösterebilirim değişkeni
          /*_isOdd
              ? Text("Kelime tek")
              : Text("kelime çift"),
    */
        ),
        body: _isOdd
            ? TextButton(onPressed: () {}, child: Text(_message))
            : ElevatedButton(
                onPressed: () {},
                child: Text(_message),
              ));
  }
}


///şimdi biz bir sunucu olur veya başka biryer olur işte biryerden data gelicek ve biz bu data ile işlemler yapıcaz
///bu datanın durumuna göre işlemlerimizi yaparken artık sürekli olarak short if lemş kullanıcaz işte bu durumda sürekli olarak bunları
///kullanmak artık işlerin kızıştıgının göstergesidir
/// bu durumda lifeCycle lar devreye giriyor
///
/// lifeCyclardan birisi initStatedir! bu initStateler uygulama yuklenmeden önce cağrılıyor ve bunlar okunduktan sonra
/// build metodu okunmaya başlıyor buna dikkat edelim!
/// initStateden önce logic ekranı güncelleyemezsini cünkü daha ekran çizilmemiştir daha initStateden sonra ekran çizilicektir
///
/// şimdi söyle birşey var yukarıdaki dışarıya açık olan classdaki veri değiştirilemez degilmi aynen bundan dolayı ben dışarıdan gelen mesajlarımı
/// widget.değişkenadı şeklşnde o classdaki verilere erişebilirim bu bir
/// ikincisi de bu verileri ben initState içerisinde private class içindeki private değişkenlerime atıyabilirim ekran çizilmeden hemen önce
/// bu da bana verim sağlıcaktır
/// ve sonrasında da init state içerisinde koşullarımı yani logiclerimi de yazabilirim!!!
///
/// şimdi söyle bişey var ekran yüklenmeden önce message degeri atandıgı için bunun güncellenmesiyle alakalı bi durum söz konusu olmadıgı için initState
/// içerisinde benim setstate fonksiyonu yazmama gerek yok!
///
///
/// temelde 4 adet lifeCyclePropertysi var bunlardan bir digeri ise didChangeDependencies() dir
/// bu property ise aslında widgetınızda cok büyük bir değişiklik olucagı zaman tekrardan calısıyor ve o sekilde sayfayı geri yeniliyor buna dikkat edelim
/// bu initStateden sonra calısır ilk calısırkenki durumunda drowdan önce calısır dedi hocamız onda sıkıntı yokmuş
/// bunun cagrılması işte içerideki state degeri tkrardan cagrıldıgında veya verilerde bir değişiklik bir güncelleme oldugunda tekrardan cagrılıyor diyebilirizz kısacası
///
/// 3. olarak da didUpdateWidget() propertysidir buda yaygın olarak kullanılmaz ama yine oldukca yararlıdır!
/// bu companentdeki oldWidget eski data ya ulastırabiliyor bizi şöyle bişi yaparsak eger suan dikkat
///
/// son olarak ise 4.companent :dispose
///
/// hangi senaryolarda hangisini kullanmak gerektigini yazalım buraya:
/// initState : bizim valuelarımzıı sayfa yüklenmeden önce kontrol etmemizde yarıyor
/// didChangeDependencies : bizim sayfamızın genel olarak statesinde bir değişiklik oldugunda kullanılıyor
/// didUpdateWİdget : bu ise sadece widgetların yenilenmesi durumunda kullanılan bir companent diyebiliriz!!!
///dispose : bu ise yine sayfayla işimiz kalmadıgında o değişkenleri öldürmek için kullanıyoruz
///