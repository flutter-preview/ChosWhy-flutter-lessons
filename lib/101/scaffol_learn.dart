import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
        ///bu kod butona tıklandıgında bottomda bir drawer oldugu gibi bir çarşaf çekmece ne dersek iste onu cıkartıyor mesela!
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  height: 200,
                ));
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: "icon"),
          BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: "icon"),
        ],
      ),
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Scaffold samples"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
