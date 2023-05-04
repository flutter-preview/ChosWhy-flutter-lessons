import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final String passwordHintText = "Password";
  final String _obsureText = "#";
  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: passwordHintText,
          suffixIcon: _onVisibilityIcon()),
      obscureText: _isSecure,
      //bunu atınca nokta şeklinde geliyor!
      obscuringCharacter:
          _obsureText, //bu ise obsecureTextin görünüşünü belirliyor gibi gibi
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeSecure();
        },
        icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          duration: const Duration(milliseconds: 700),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond, //hangisini ilk gösterilecegini belirliyor
        )); ///bu kod ile de animasyonu saglamıs oluyoruz aslında!
    //Icon(_isSecure ? Icons.visibility : Icons.visibility_off));
  }
}

/// bu companenti neden böyle yaptık peki? bu direkt olarak atomik companente giriyor ama
/// bunu widget_size_enum_learn_view dosyasına entegre ediyorum
///
/// su yana müşteri visible icon istiyor peki bunu nasıl koyarız?
/// prefix ve suffix ile bi başa bi sona bişeyler eklemene yardımcı olur burda
/// prefix başa,suffix sona ekler
/// yukarıdaki kod ile de gözü açayıp kapamayı yaptık!
///
/// peki sadece dikkat ederken controller kullanmak sıkıntı olabilir : degeri almaya yarıyor
///
///burdaki IconButton kısmını bir widget olarak degil de bi metot olarak cıkartabiliriz
///
/// yine şu şekilde bi kullanım da yapabilirdik nasıl bi kullanım?
/// burdaki _onVisibilityIcon daki icon kısmında bi AnimatedCrossFade() widgetını atıyarak
///
///ikili elemanlı ve animasyon eklemek istediginde bu sekilde bi kullanım ypaılabilir!