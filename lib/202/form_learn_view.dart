import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final String _buttonTitle = "save";
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormFieldValidator().isNotEmpty,
            /*(value){
              return (value?.isNotEmpty ?? false) ? null : "bu alan boş geçilemez";
                  //burdaki kodun anlamı su burda value null olabilir ama null degilse true null ise false dönücek
                  //şimdi burdaki kodda ne oldu burda su oldu parantez içiindeki işlem aslında true veya false işlemleri
              //ve ben eger true ise null ffalse ise String ifade döndürmek istedim!
            },
            */
            onChanged: (String value) {
              print("a");
            },
          ),
          ElevatedButton(
              onPressed: () {
                _elevatedButtonOnPress();
                ///burda biz eğer boş göndermeye calıstıgımızda bu alan boş gecilemez gibi bi ekranda text görücez tabi boş oldugu için
                ///print("okey"); koduna girmiyor buna dikkat!
              },
              child: Text(_buttonTitle)),
          CheckboxListTile(value: true, onChanged: (value){}),
        ],
      ),
    );
  }

  void _elevatedButtonOnPress() {
    if (_key.currentState?.validate() ?? false) {
      print("okey");
    }
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = "Bu alan boş geçilemez!";
}

///bu widgerları yine service post kısımlarındda oldukca kullanılan bir form widgetıdır!
/// normalde işte textfield kısmıyla hallediyoduk form kısımlarını ama burda müşteri diyorki bu kısım boş gecilmemesi gerekiyor
/// yani bir validasyona giricek diyor
///
/// ha bunları yine başka yöntemler ile de yapabilirsin ama flutter hazır bize sunuyor bunu!
///
/// textFormFiedl işte bunun kullanımı aynı textfield gibidir ama ekstradan alitador diye bi özelliği vardır!
///
/// okay companenti falan ayarladık ama ben tusa bastıgımda bu olayın oldugun nerden görücem!!
/// işte bu noktada bu form dediğimiz olaylar ortaya cıkıyor!
/// peki form nasıl kullanılıyor? nerde kullanıcaksan ona göre değişiyor eger 1 taen kullanıcaksan textformfield kullanabilirsin
/// ama birden fazla kullanıcaksan form ile sarmalayıp alt alta formtextfield kullanmalısın!
///
/// şimdi formları kullanıcaksak bizim özel bi kullanımımız var "keys" bunlar bakmalıyız o kısımlar bu noktaya giriyor!
/// flutter da hazır birçok key var peki key nedir? neden kullanırız:
/// key aslında bir statefull widgeta dogrudan erişip onun özelliklerini bize döndürmesini saglıyor!!!
/// ve bunlar sayesinde birbirleri arasında uniq widgetlar yapmıs oluyoruz
/// bazen widgetlar arasında kaymalar yasanabiliyor sorunlar cıkabiliyor keyler ile bunları cözebiliyoruz
///
/// burda neler yapıcaz ve hangi key türleri var onları görelim
/// birçok key var işte valuekey,localkey,globalkey,uniqkey vs biz burda globalkey kullanıcaz bu daha büyük birşey
/// burda globalkey ile içinde bazı özel durumları tutabiliyoruz biz bu yuzden burda bunu kullanıyoruz
///
/// ben yukarıdaki _key sayesinde formState özelliklerini yakalayabiliyorum!
/// peki bu ne demek?:
/// biz farklı companentlerde dönen degerleri yakalıcaz mesela burda elevatedbutonun içine bu dönüşün kontrolunu yazalım
///
/// şey derse müşteri ben her zaman calısmasını istiyorum bunun o zaman autovalidateMode: u kullanması gerkeiyor
/// default ataması onUserInteraction gibi bişey bunu always yaparsan istediğin senaryoyu yapmıs olursun
///
/// yine bşaka bi textformfield eklediginde eger sen birini doldurup digerini doldurmazsan yine trigerlanıcak cünkü tüm form alanında
/// aktifleştiriyorsun bu autovalidateMode'u
///
/// bazı senaryolarda da onChanged özelliğini kullanmamız gerkeiyor ama dikkat bu özellik her değişiklikte bu kısıma giriyor!
/// bu senaryolar işte textin içinde su olursa bu olsun gibisinden! veya filrtreleme özellikleri de yapılabilir!
///
/// peki gelelim bu kodları birazcık temizleme kısmına!
/// şimdi burda metotları bu sekilde bırakmıyorduk biliyosun bu yüzden bi class olusturup o metodu buraya cekicez  okey bunu yapalım hadi
/// ama bunu yaparken fonksiyonun birebir olduguna dikkat edin yaparken fonksiyon aynı olmak zorunda
/// YİNE valıdator classı için mesajların toplandıgı bir alan yapabilirsin
/// hani bunları bu sekilde yaptıgında kodların gelişmişliği oldukca artıcaktır yönetim konusunda vs!
///
/// yine bilmemiz gereken başka form fieldler da var bunların var oldugunu bilmemiz yeterlidir suanda
/// burda kullanılan en coklar arasında InputDatePicker widgetı,DropDownButtonForm widgetı var
/// bu dropdown widgetı sehir seçme gibi bi companent oluyor ya tıklıyosun aşşagıya dogru kayıyor onun gibi birşey!
/// yine flutter da hazır checkbox da var checkboxListTile ama bunu bi form fieldı yok cünkü checkbox aslında form edicek bi
/// kısmı yok!
///
