import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/bagModel.dart';
import '../widget/bagview.dart';

class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("evaly",style: GoogleFonts.rowdies(fontSize: 60),)),
        actions: [
          Icon(Icons.person_outline,size: 50,)
        ],
        toolbarHeight: 80,
      ),
      body: GridView.builder(
          itemCount: bags.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2),
          itemBuilder: (context,index){
            return BagView(
              imagepath: bags[index].image,
              name: bags[index].name,
              desc: bags[index].desc,
              price: bags[index].price,

            );
          }),
    );
  }
}
