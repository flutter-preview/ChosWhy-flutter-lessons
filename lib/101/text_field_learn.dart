import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lessonone/product/sentence/sentence_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey(); ///bunun konusuna gelinilcek daha ileride


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            key: UniqueKey(),

            ///sağ aşşagıdaki yeri ayarlamama yarıyor!!
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
              /*Container(
                width: 40,
                height: 10,
                color: Colors.green[100 * ((currentLength ?? 0) / 2).toInt()],
              );

              şimdi bunu bu sekilde kullanabiliriz ama yine bunu animatedContainer verirsem ne olur onu görelim
              */
            },
            keyboardType: TextInputType.emailAddress,//baba klawye tipini ayarlıyor!!
            autofillHints: [AutofillHints.email], //girilen textin neyle tammalanıcagını belirliyor!
            maxLength: 20,

            ///burdaki property sayesidne ben klawyedeki degerlerime eriştirmeyebilirim mesela aşşagıdaki logicde bunu yaptık
            ///newvalue.text i a ya eşit ise oldvalue yu döndür dedik!
            ///işte bu tarz keywordları engelleyebiliyoruz bunu unutmuyalım
            //inputFormatters: [TextProjectInputFormatter()._formatter],

            textInputAction: TextInputAction.next, ///bu sayede bir sonraki textFormFielda geçişi klawyeden saglıyabiliyoruz!
            decoration: _InputDecorator().emailInput
          ),

          TextFormField(minLines: 2,maxLines: 4,),
        ],
      ),
    );
  }
 AnimatedContainer _animatedContainer(int? currentLength) {
   return AnimatedContainer(
          key: key,
          duration: Duration(milliseconds: 100),
          width: 10.0 * (currentLength ?? 0),
          height: 10,
          color: Colors.green,
        );
 }
}

//yine naptık dışarıya aldık!!
class TextProjectInputFormatter{
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if(newValue.text == "a")
      return oldValue;
    else
      return oldValue;
  });
}

class _InputDecorator{
  final emailInput = const InputDecoration(
    prefix: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: SentenceItems.mailTitle,
    //bu iki kod sayesinde rengini ve true veya falssunu control ediyoruz içinin rengini
    //fillColor: Colors.white,
    //filled: true,
  );
}

///yine bun textfieldları da bu sekilde yazmamız gerekmektedir aslında tabi 202 seviyede ögrenicez
///custom textfield yazmak hangilerini kastediyorum textfield decoration özelliği haricindeki özeelikler
///yine bunu themedan ayaryabiliyorum bunu ınputdecoration theme dan ayarlıyoruz bu ad altında ayarnıyor