import 'package:flutter/material.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);

  int _currentPageIndex = 0;
  void _updatePageIndex(int index){
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.slowMiddle);
              },
              child: Icon(Icons.chevron_left)),
          FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.slowMiddle);
              },
              child: Icon(Icons.chevron_right)),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: true, ///bu özellik bizim sayfayı ortada başlatıyor
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}

///pageview widgetını bir viewportFraction propertysi cok güzel bir trick gösterelim bu companent
///0.7 verdiginde boyutunu 0.7 ayarlıyor her bir elemanını ve diger sayfanın bir bölümünü bize gösterme imkanı sunuyor
///

///PageView widgetı oldukça faydalıdır cogu App da kullanılır peki bu widget nasıl bir iş yapıyor
///pageView : aslında bir ekran gibi kullanabiilirsinzi oda su sekilde bizim bir sayfamız var ve bu sayfayı istedigin gibi sınırlayabilirsin
///bu sayfayı sola kaydırarak sayfaları bu sekilde görebilirsin bunu güçü veriyor bize bu widget!
///
///bak setstate yapmadım cunku pageView controlleri kendisi bir state tutuyor zaten bu yuzden onu kullanmak burda gereksizdir buna dikkat et unutma
///
/// yine sayfaları yani pageleri control edebilmek için onpageChange propertysini kullanabilirz bunu da yukarıdaki şeklde yapıyoruz
///
///