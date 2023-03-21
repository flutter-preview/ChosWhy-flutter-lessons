import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _TitleTextWidget(),
          _TitleTextWidget(),
          _TitleTextWidget(),
          _TitleTextWidget(),
          _TitleTextWidget(),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({super.key,this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "data",
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
///bu sayfaya özgü component olmasını istiyosan private ypa!!
///yine dedigim gibi daha karmasık işlemlerde extract widget yapıyoruz ama daha basit işlemlerde extarct method kullanıyoruz!
///