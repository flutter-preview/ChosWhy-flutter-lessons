import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void _changeOpacity(){
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderAnimatedWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
      }),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(opacity: _isOpacity ? 1 : 0,
            duration: _DurationItems.durationLow,
            child: Text("data",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),)),
            trailing: IconButton(
                onPressed: () {_changeOpacity();}, icon: const Icon(Icons.compress_rounded)),
          )
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

///                           şimdi animasyonlara gelelim
///bi senaryom var bu senaryomda ekrandaki placeholder "ekranda kaybolup gitmesini istiyorum"
///bunu nasıl yaparım adım adım su sekilde dikkatli oku!
///1.:buton laızm bana bunun için floataçtion button yapıyorum
///2.:sonrasında bi adet visible için true false lazım onun değişkenini ayarlıyorum
///3.:bu visible değişkeninin degişmesini kontrol eden metot lazım onu yazıyorum
///4.:metodu butona atıyosun
///5.:sonrasında sen bunu short ifle gözüküp gözükmemesini ayarlarsın okey mi? evet
///dikkat:biz bunu bu sekilde yapmamamız gerekiyor cunku hali hazırda flutter biz animasyonları hazır bi şekilde sunuyor!
///
///bunun için ilk companent "AnimatedCrosFade()"!!! bunun amacı nedir?
///=>amacı 2 view arasında geçiş yapmayı saglar!!!
///içindeki propertyler mevcut mu mevcut bunlara ekstra bakabilirsin!
///
/// şimdi bu companenti yaptık ama burda durationları asla bu sekilde bırakmamalıyız!!!
/// bunun için hemen bi class yazalım!
///
/// şimdi başka bi senaryoda biz bi ListTile içerisinde textimiz var ve buton var bu butona bastııgnda textin
/// opacitysini düşürmek istiyoruz
/// bunun için sunları yapıyoruz
/// 1.:yine bi adet bool değişken alıyosun
/// 2.:neyi değiştiricez texti o zaman bunu widget ile sarmalayıp AnimatedOpacity ile sarıyoruz
/// 3.:sizin sernayoya uygun sekilde dolduruyorsun
/// 4.:doldurduktan sonra yine sort if ile kosulu saglıyorsun
/// 5.:sornasında iconButton kısmına yine aynısını _isOpacity ile yaptıgın fonksiyonu veriyosun
/// burda dikkat edilmesi gerekn sey sudur ordaki data hep orda sadece opaklık olarak 0 aldıgından kayboluyor!!
///
///