import 'package:flutter/material.dart';
import 'package:lessonone/101/image_learn.dart';
import 'package:lessonone/101/text_field_learn.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> with TickerProviderStateMixin,_ProjectSizeUtility{
  late final TabController tabController;
  final int durationTime = 5;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: TabNames.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabNames.values.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
            _goToButton1();
            TabNames.button1.printName();
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: sizeNotchMargin,
            child: _MyTabBar(context),
          ),
          body: _MyTabView(),
        ));
  }

  void _goToButton1() {
    return setState(() {
            tabController.animateTo(TabNames.button1.index,curve: Curves.linear,duration: Duration(seconds: durationTime));
          });
  }

  TabBar _MyTabBar(BuildContext context) {
    return TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.orangeAccent,
            padding: EdgeInsets.zero,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            tabs: [
              Tab(text: TabNames.button1.name),
              Tab(text: TabNames.button2.name),
            ],
          );
  }

  TabBarView _MyTabView() {
    return TabBarView(
          controller: tabController,
            //physics: NeverScrollableScrollPhysics(),
            children: const [
          TextFieldLearn(),
          ImageLearn(),
        ]);
  }
}

class _ProjectSizeUtility{
  final double sizeNotchMargin = 10;
}

enum TabNames{
  button1,
  button2,
}

extension TabNamesExtension on TabNames{
  void printName(){
    print(name);
  }
}


enum _ProjectColors{
  red,
  blue,
  orange,
}

extension ProjectColorsExtension on _ProjectColors{
  Color setColors(){
    switch(this){
      case _ProjectColors.red:
        return Colors.red;
      case _ProjectColors.blue:
        return Colors.blue;
      case _ProjectColors.orange:
        return Colors.orange;
    }
  }
}

//https://www.uplabs.com/posts/smart-home-app-561916e2-d4cc-40c4-a60b-65b704aa23cb
///güzel bi uygulama geliştimeye yönelik tasarım olabilir!