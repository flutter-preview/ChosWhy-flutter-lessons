import 'package:flutter/material.dart';

class AnimationCrossFade extends StatefulWidget {
  const AnimationCrossFade({Key? key}) : super(key: key);

  @override
  State<AnimationCrossFade> createState() => _AnimationCrossFadeState();
}

class _AnimationCrossFadeState extends State<AnimationCrossFade> {
  bool _isVisible = false;
  void _changeVisible(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _placeHolderAnimatedWidget(),),
      floatingActionButton: FloatingActionButton(onPressed: (){_changeVisible();}),
      body: _placeHolderAnimatedWidget(),
      /*Text(
        "data",
        style: context.textTheme().titleMedium,
      ), //alttaki gibi değilde bu sekilde erişebiliyorum
      //Theme.of(context).textTheme.titleMedium,),
       */
    );
  }

  AnimatedCrossFade _placeHolderAnimatedWidget() {
    return AnimatedCrossFade(
        duration: _DurationItems.durationLow,
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class _DurationItems{
  static const Duration durationLow = Duration(seconds: 1);
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    ///dikkat burda suanda context kısmında oldugumuz için this dersek contexti zaten alıcaz!
    return Theme.of(this).textTheme;
  }
}

///burda sunu yapabilirsin hocam biz hep context çagırıyoruz bunu su sekilde yapamaz mıyız evet!
///peki benim bunu yapma amacım nedir?
///burda sunu yapmıs oluyoruz aslında context üzerinden birçok işlemin uzun uzadıya yazmaktansa burda daha kısaltılmıs halini yazabiliriz
///extension bu gücü bize katıyor!
///yine bunların daha düzenli olmasını istiyosan extension klasorü olusturup oraya düzen getirerek bu gücleri diger sayfalarda da kullanabilirsin!
///SizedBox.shrnik() ekranda ne kadara kücük bi alan kaplatabilirse varsa onu alır!!
///

///                           şimdi animasyonlara gelelim
///bi senaryom var bu senaryomda ekrandaki placeholder "ekranda kaybolup gitmesini istiyorum"
///bunu nasıl yaparım adım adım su sekilde dikkatli oku!
///1.:buton laızm bana bunun için floataçtion button yapıyorum
///2.:sonrasında bi adet visible için true false lazım onun değişkenini ayarlıyorum
///3.:bu visible değişkeninin degişmesini kontrol eden metot lazım onu yazıyorum
///4.:metodu butona atıyosun
///5.:sonrasında sen bunu short ifle gözüküp gözükmemesini ayarlarsın okey mi? evet
///dikkat:biz bunu bu sekilde yapmamamız gerekiyor cunku hali hazırda flutter biz animasyonları hazır bi şekilde sunuyor!
///bunun için ilk companent "AnimatedCrosFade()"!!! bunun amacı nedir?
///=>amacı 2 view arasında geçiş yapmayı saglar!!!
///içindeki propertyler mevcut mu mevcut bunlara ekstra bakabilirsin!
///
/// şimdi bu companenti yaptık ama burda durationları asla bu sekilde bırakmamalıyız!!!
/// bunun için hemen bi class yazalım!
///