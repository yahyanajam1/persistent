import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/next_page.dart';

class ColorsListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "title",
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NextPage()));
              
            }, icon: const Icon(Icons.notifications,color: Colors.white,))
          ],
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(context),
        ));
  }


  Widget _buildList(context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NextPage()));

          },
          child: Container(
            color: Colors.yellow,
            height: 200,
          ),
        ),
        Container(
          color: Colors.blue,
          height: 200,
        ),
        Container(
          color: Colors.black,
          height: 200,
        )
      ],
    );
  }
}
