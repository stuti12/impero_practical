import 'package:flutter/material.dart';
import 'package:practical_stuti/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(text: AppStrings.categoryOne,),
            Tab(text:  AppStrings.categoryTwo,),
            Tab(text: AppStrings.categoryOne,),
            Tab(text:  AppStrings.categoryFour,),
          ],),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon:const Icon(Icons.search),
            ),
          ],
        ),
        body: TabBarView(children: [
          Container(color: Colors.red,),
          Container(),
          Container(),
          Container()
        ]),
      ),
    );
  }
}
