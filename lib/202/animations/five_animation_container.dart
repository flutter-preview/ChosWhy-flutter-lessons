import 'package:flutter/material.dart';
import 'package:lessonone/202/animations/one_crossfade.dart';

class AnimationContainerView extends StatefulWidget {
  const AnimationContainerView({Key? key}) : super(key: key);

  @override
  State<AnimationContainerView> createState() => _AnimationContainerViewState();
}

class _AnimationContainerViewState extends State<AnimationContainerView> with TickerProviderStateMixin{
  final double kZero = 0;
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
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            width: _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            height: _isVisible ? kZero :  MediaQuery.of(context).size.width * 0.2,
            color: Colors.red,
            margin: const EdgeInsets.all(10),
          ),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            width: MediaQuery.of(context).size.width * 0.2,
            height: _isVisible ? kZero :  MediaQuery.of(context).size.width * 0.2,
            color: Colors.red,
            margin: const EdgeInsets.all(10),
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

///simdi de AnimatedContainer kısmı var
///bu bildigimiz containerın hareketli hali knk peki ne demek bu hareketli hali?
///
/// şimdi bizim senaryoda su var knk ya diyor müşteri bu container ekranın yüzde 10 unu kapsasın diyor o zaman
/// daha önce göstermedigim bi kullanım var!
/// ama bunu bu sekilde kullanırken dikkat null alabilen bişi bu ve sen bunu çarparken veya bölerken null olan birşeyi
/// bölemezsin diyor ondan dolayı null ise su deger olsun dersen daha kullanıslı olucaktır!
/// ama bunların galiba bu sekilde kullanımında hata alıyoruz bu yuzden bunları mediaQueryden almak hatasız olucaktır!
///
/// bu sekilde media lı sekilde yazınca bunlara yine extension ile özellik olarak kazandıraibliriz!!
/// mesela burda coloru degistirdigimde kendisi degisiyor
/// sornasında margin verdiigmde hareket ediyor
/// hani bu tarz özellikleri kendisi yapıyor animated container oldugu için
///
/// mesela işte is_visible true ise 0 false ise bu verelim
///
/// mesela işte listviewda kullanıcaksın napıcaksın sayfada üst kısıma bilgiler var ama listview hareketi aktif olduugnda
/// o companenet yukarıya dogru kalkıcak olsun
/// mesela bu companenti yapabilirsin bununla ve harika birşey olur sahsen!!!!
///
/// ekstra bi kullanım ise sudur: simdi kodlarda oldukca fazla 0 vardır bunlar için hani genel bi classın vardır verileri tüm sayfaya dagıttın degişkenlerini kullandıgın
/// oraya gidersin final double kZero = 0; şeklinde tanımlarsın 0 lar yerine bunları kullanırsın!!!