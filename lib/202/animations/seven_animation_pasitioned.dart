import 'package:flutter/material.dart';
import 'package:lessonone/202/animations/one_crossfade.dart';

class AnimatedPositionedView extends StatefulWidget {
  const AnimatedPositionedView({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedView> createState() => _AnimatedPositionedViewState();
}

class _AnimatedPositionedViewState extends State<AnimatedPositionedView> with TickerProviderStateMixin{
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
          const Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: _DurationItems.durationLow,
                  top: 50,
                  curve: Curves.easeInOutBack,
                  child: Text("data"),
                ),
              ],
            ),
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

///bu companent ise bir adet stack içerisinde kullanılan bir companent
///AnimatedPositioned
///
/// bu companent biraz daha işimize lazım olabilir
/// bunda companent yine kendi içeriisnde animasyonlu bir şekilde posizyonunu degiştirmede kullanabilirisn!
/// işte burdan bütün pozisyonlarına hükmedebiliyorsunuz
/// yine bunun curve diye bi adet daha propertysi var
/// bunada "curves." şeklinde yazarsak tüm öğelerine erişebiliyoruz!
/// bu property bizim animasyon hareketlerimizi kontrol eden öğedir!