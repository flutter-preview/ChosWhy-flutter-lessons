import 'package:flutter/material.dart';
import 'package:lessonone/202/animations/one_crossfade.dart';

class AnimationIconView extends StatefulWidget {
  const AnimationIconView({Key? key}) : super(key: key);

  @override
  State<AnimationIconView> createState() => _AnimationIconViewState();
}

class _AnimationIconViewState extends State<AnimationIconView> with TickerProviderStateMixin{
  late AnimationController controller;
  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: _DurationItems.durationLow); //burdaki vsync senkronizasyon demek
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderAnimatedWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                opacity: _isOpacity ? 1 : 0,
                duration: _DurationItems.durationLow,
                child: Text(
                  "data",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                )),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: const Icon(Icons.compress_rounded)),
          ),
          AnimatedDefaultTextStyle(
              duration: _DurationItems.durationLow,
              //context.textTheme().titleMedium ?? const TextStyle(),
              style: (_isVisible ? context.textTheme().headlineMedium : context.textTheme().titleMedium) ?? const TextStyle(),
              child: const Text("furkan")),
          AnimatedIcon(
              icon: AnimatedIcons.arrow_menu,
              progress: controller,
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderAnimatedWidget() {
    return AnimatedCrossFade(
      duration: _DurationItems.durationLow,
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
      _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class _DurationItems {
  static const Duration durationLow = Duration(seconds: 1);
}

///AnimatedIcon kısmına geldik!
///şimdi burda biz Iconu veriyoruz ama burda normal ıconlardan farklı olarak AnimationIcons. şeklinde veriyoruz
///birde ekstradan progress adlı property var bunda controller kullanmamız gerekicek animationController
///
/// şimdi bi ufak tricki point veriyoruz hatırlatma! late atıyosan sen bi durumda vericeksin ama
/// bu durumları hangi durumda buna deger atanıcagını bilmiyosan başlangıc için initState içinde
/// degerini atıyaibilirsin!
///
/// şimdi bunları ayarladık işte olayını ayarlıcaz yine floatactionbuttondan yapalım!
/// şimdi bazen özel animasyonlarınızı kendiniz yapıcaksınız ve bu controller kısmından siz kontrollerinizi nereye gidicegini degerlerini
/// vs burdan verebilirsiniz ne ypaıyosunuz "controller." ... şeklinde
/// ama bizim için şimdilik controller.animateTo(1) yeterli olucaktır!
/// ama yine flutterın hazır verdigi şeyler bizim için yeterli olabilir tabi siz harbiden bi front-endci iseniz yapın knk
///
/// günün sonunda bakın icon menuye dönüştü!!!! demekki iconun ismi bu yüzden arrowMenu imiş
/// metotda sürekli olarak 1 oldugu için bunnu aslında bi duruma sokarak 0 ve 1 durumuna baglıyalım!
/// bu sekilde cok daha iyi oldu!!!
///