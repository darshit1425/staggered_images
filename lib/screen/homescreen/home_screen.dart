import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'provider/home_provider.dart';

class HOme_Screen extends StatefulWidget {
  const HOme_Screen({Key? key}) : super(key: key);

  @override
  State<HOme_Screen> createState() => _HOme_ScreenState();
}

class _HOme_ScreenState extends State<HOme_Screen> {
  Home_provider? providerF;
  Home_provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Home_provider>(context, listen: false);
    providerT = Provider.of<Home_provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,

        // backgroundColor: Color(0xffAAAAAA),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Recycler View",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(5.5 / 8, crossAxisRatio: 0.9),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: providerF!.Images.length,
            (context, index) {
              return ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          offset: Offset(4, 3),
                          spreadRadius: 1)
                    ],
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 28, color: Colors.white),
                      left: BorderSide(width: 5, color: Colors.white),
                      right: BorderSide(width: 5, color: Colors.white),
                      top: BorderSide(width: 10, color: Colors.white),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "${providerF!.Images[index]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "${providerF!.Name[index]}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
