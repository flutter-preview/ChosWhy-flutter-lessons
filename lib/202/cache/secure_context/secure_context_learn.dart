
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShareContextLearn extends StatefulWidget {
  const ShareContextLearn({Key? key}) : super(key: key);

  @override
  State<ShareContextLearn> createState() => _ShareContextLearnState();
}

class _ShareContextLearnState extends State<ShareContextLearn> {
  final _storage = const FlutterSecureStorage();
  late TextEditingController controller;
  String _title = "";
  void saveItems(String data){
    setState(() {
      _title = data;
    });
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? "";
    
    if(_title.isNotEmpty){
      print("Bu adam önceden appi kullanmıs!");
      controller.text = _title;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    getSecureItems();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      floatingActionButton: FloatingActionButton.extended(onPressed: () async {
        await _storage.write(key: _SecureKeys.token.name, value: _title);
      }, label: const Text("Save")),
      body: TextField(
        controller: controller,
        minLines: 3,
        maxLines: 4,
        onChanged: saveItems,
      ),
    );
  }
}

enum _SecureKeys{
  token,
}

///geldik şimdi burda herzamanki mantık aslında sudur : paketi nasıl kullanıyor bunu anlamaktır!
///bu pakette her istek Future bunları okuyup vs geliştirip projede gösteriyoruz!
///ekranı tasarladık işte
///
/// yine burdaki senaryo su save e bastıktan sonra biz burda ekranda kaydetsin bu yazdıgımızı istiyoruz!
/// burda savebutonunun metoduna yazarken bu paketin "write" metodu aslında herşeyi string olarak saklıyor yani farklı türleri
/// kullanıcaksan stringden parse etmen gerekiyor!
/// yine keyleri enum içinde tutuyoruz tokeni bu sekilde saklamalıyız mesela!
/// sonra ayarlıyorsun tertemiz kullanıyosun projede!
///
/// daha sonra da okumak için napıyoruz initState içeriisnde bi metot okumak istiyoruz işte bu metodun adı da getSecureItems olsun
/// işlemleri hallettik burda read ile tek bi item okuyosun readAll ile hepsini okuyabiliyorsun!
///
/// işte burda naptık yine daha önceden yaptııgmız gibi kodlarımızı yazdık aslında!
///
/// peki gelelim token nedir?: token alsında bir String yani text şeklinde özel şifrelenmiş bir öğe aslında!
/// peki ne işe yarıyor su sekilde bu tokeni bilen bi kişi tokenin içinde saklı oldugu verileri alabilir demek oluyor
/// Encode(gizleme) olarak token texti oluyor Decode(çözme) olarak da json tipinde veriler oluyor aslında!
/// bunu örnek olarak jwt yazdıgında json Web Tokens sitesinde bulabilirsin!
///
/// şimdi şöyle oluyor adam sana bu keyi veriyor servisten sende bunu alıyosun ve private keyin oluyor ,sen keyi kullanarak
/// içindeki verilere ulasabiliyorsun.
/// yine bu söylediğim sitede kendi tokenlarınızı olusturabiliyorsunuz burda verify kısmı oluyor onun 3. kısmında keyi değiştirebiliyorsun!
/// bu keylerin private oldmasına dikkat edelim sadece 2 taraf bilsin!
/// örnek bi token : eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQmYvUAJnI36rry3eWuRKO5Q5Q7rY1SYUk6cyJjTUTI7o
///
///
/// işte burda tokeni girdi _title e ve save etti ardından app i sildi ve burda bu jwt yi parse eden paletler var onlar yine Veli hocanın
/// kanalda mevcut işte burda adam şunu yapıyor!
/// getSecureItems metodunda işlemleri ypaıcaz
/// burda _title degilde token olarka düşün önemli degil eğer tokeni varsa işte şey yazalım: bu adam önceden kullanmıs appi ve tokeni bu: "token"
/// işte buna göre logicler yazılabilir!
/// tabi biz appi silip tekrar yüklediğimizde veriler gidiyor ama bu ios a özel birşey bunun için androidde bi yol var mı bakmadım!
///
/// bu datalar kriptolu ve şifrelenmiştir yani! bu dataya erişilmesi biraz daha zordur bu sekilde kaydedildiğinde! ama sharedPref.
/// de daha kolaydır erişmek!
///
/// !!!!!!!TOKEN OLUŞTURMA VS BUNLARA BİR BAK!