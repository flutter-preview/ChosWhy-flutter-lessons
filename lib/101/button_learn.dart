import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                } else
                  return Colors.white;

                ///burda ne yaptık sunu yaptık burda buttonu customize edebiliyoruz naptık peki burda olabilicek durumlara göre değişiklikler yapıyoruz
                ///mesela resolveWith ile butonun arkaplan rengini tıklandıgında yeşil bırakıldıgında ise beyaz olmasını istedim
              })
                  //MaterialStateProperty.all<Color>(Colors.deepPurple),
                  ),
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.subtitle1,
              )),

          ///onpressed e null atarsak kendine has dizaynı var ve kullanılabilir!!

          ElevatedButton(onPressed: () {}, child: Text("Selam")),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          FloatingActionButton(onPressed: () {}),
          BackButton(),
          OutlinedButton.icon(
              onPressed: () {}, icon: Icon(Icons.add), label: Text("data")),
          //bu da işte iconla texti yanyana koyan bir companent
          OutlinedButton(
              onPressed: () {},
              child: Text(""),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                disabledBackgroundColor: Colors.indigoAccent,
                shape: CircleBorder(),
              )),

          InkWell(child: Text("Custom"), onTap: () {}),
          Container(
            height: 100,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 40, left: 40, bottom: 10),
                child: Text(
                  "Place Bid",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )),

          ///ınkwell sadece chilldinin kapladıgı alanı alıp da oraya has özellikler atar!
          ///ama daha öne cıkan öelliği ise daha fazla customize edilir bir özellikleri olmasıdır daha fazla propertye sahiptir
        ],
      ),
    );
  }
}

//Borders:

///ileri seviye customize ediceksek bunları genel olarak "theme"dan yapmamız daha saglıklı olucaktır!!
