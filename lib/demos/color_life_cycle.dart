import 'package:flutter/material.dart';
import 'package:lessonone/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            _changeBackground();
          }, icon: const Icon(Icons.clear)),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(child: ColorDemos(initialColor: _backgroundColor,)),
        ],
      ),
    );
  }

  void _changeBackground() {
    return setState(() {
            _backgroundColor = Colors.pink;
          });
  }
}

///burda diyor ki clear iconuna bastıgında ben diyor bunu silmek istiyorum diyor ben bunu nasıl yapıcam diyor
///
/// şimdi şu şey var silme işlemi olması için baska sayfadaki stateyi tetiklediginden o sayfadan bunu propert olarak almam lazm rengi bu yüzden oraya gidiyoruz
/// degişkeni vs ayarladıktan sonra initState olarak kullanıyoruz çünkü daha sayfa build edilmeden önce calısıyor bu bu sayede herhangi bir renk degişimi olmadan direkt
/// girilen bir renk varsa onu giriyor!!! bu çok önemli bak
/// initStatede setstate kullanmama gerek de yok cunku build edilmedi ki daha sayfa!
/// şimdi coloru verdigimde bak ne oldu defaultta pink oldu cunku butonlara henüz tıklanmadı bu sayede bu şekilde hallettik devam edelim bakalım
///
/// ama halaa silme işlemi olucak bu nasıl olucak peki
/// null ataması ise bir deger almadıgı için yer kaplama da yapmıcaktır bu yönden iyidir!
///
/// şimdi ben bu backgroundColoru Colorsççpink yaptım tıklandıgında icona ama yenilenmicektir peki ne yapıcaz!
/// initialColor a backgroundColoru verelim verdikten sonra kızdı kızması dogal cunku null alabilir degil onu null yaptık
/// ve eger initState içine gititk bu initialColor null gelirse diyoruz bunu Colors.transparent yap diyoruz
///
/// ee herşeyi yaptık yine olmadı ne oldu da olmuyor bi bakalım! neyi unuttuk burda iconButtonu setstate yapmadık onu yapalım tamamdır
/// ee ama gene olmuyor işte welcome to lifeCycle ehehehe kısaca senaryo su
/// yukaridaki widgettan aşşagıdaki widgetı etkilemeye calısıyoruz
///
/// çizim olarak anlatıcak olursam işte dallanmıs bir agacım var agacın tepesi buton aşşagısı ise bu renk degişimi companeneti
/// yukarıdan aşşagıya veri akıyor ama aşşagıdan yukarıya akmıyor işte bunu nasıl yaparım da aşşagıdan yukarıya aktarbilirim?
/// işte burda didUpdateWidget lifeCycle devreye giriyor!
/// color_demosda yazıyoruz
/// bunu yazdıkdan sonra didUpdateWidget sayesinde tak yapabildik!!
///
/// ee ama ben bidaha tıkladıgımda bu olmuyor bunu hani yapmıstık işte şimdi debuging yapmayı ögrenicez!!
/// sıkıntı su aslında didUpdateWidgetta gidiyoruz orda bi sıkıntı var buna bakıyorum teker teker kodları inceliyorum
///
/// sıkıntıyı çözdük peki ben bunu bu sekilde görmek aklıma gelmeseydi ne yapabilirdim o zaman
/// inspect(widget) yazsaydım widgetı ispect yani gelen veri durumunu görebiliyordum.