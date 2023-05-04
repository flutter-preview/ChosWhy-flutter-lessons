import 'package:flutter/material.dart';
import 'package:lessonone/demos/password_text_field.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({Key? key}) : super(key: key);

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const PasswordTextField(),
          Card(
            child: Container(
              height: WidgetSizes.normalCardHeight.value(), // bunu bu sekilde cagırıyoruz
              color: Colors.green,
            ),
          ),
        ],
      )
    );
  }
}

enum WidgetSizes{
  normalCardHeight,
  circleProfileWidth,
}

extension WidgetSizeExtension on WidgetSizes{
  double value(){
    switch(this){
      ///burda this diyerek enuma erişebiliyoruz buna dikkat!
      case WidgetSizes.normalCardHeight:
        return 30;
        break;
      case WidgetSizes.circleProfileWidth:
        return 25;
        break;
    }
  }
}

///width extension ile size yapma
///biz bi card yapıcagımız zaman neler olucagı az  cok belirlidir neler olması lazım oldugunda,
///burda özel olarak sizeler verilmeyebilir ama bu sizeleri yine genel olarak enumlar ile de yönetebiliyruz
///
/// bunları bu sekilde yazdıktan sonra sunu diyoruz
/// su sekilde musteri bizden bi card companenti isteyebilir ve biz geçici olarak işte görüp 30 degerini verdik
/// ama bundan sonra biz burda 30 u ne yapmamız gerekiyor?
/// biz şimdi burda daha önceden extension kullanmıstık demi bunu kulanarak enumun içindekilere deger atıcaz
/// ama burda dikkat edilmesi gerekn nokta sudur:
/// bunu bu sekilde entegre ettikten sonra burda nasıl cagırıcaz hocam peki? su sekilde
/// enum üzeirnden extensiona erişicez bu sekilde kullanıcaz
/// bunu bu sekilde cagırdıgımızda bu aldıgı degerleri generic olarak bu sekilde kullanabiliyoruz!!
/// bu bazı sayfalarda bu sekilde oldukca güç katıcaktır yine paddingleri de yazabiliriz
///