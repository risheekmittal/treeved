import 'package:flutter/material.dart';
import 'package:treeved/post.dart';
import 'package:treeved/post_screen.dart';

class PostScreen2 extends StatefulWidget {
  const PostScreen2({Key? key}) : super(key: key);

  @override
  _PostScreen2State createState() => _PostScreen2State();
}

class _PostScreen2State extends State<PostScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(background: Post(),titlePadding: EdgeInsets.only(left: 35,bottom: 20),
              title: Text("Comments", style: TextStyle(color: Colors.black, fontSize: 13),),

            ),
          ),
          SliverList(delegate:
          SliverChildListDelegate(
            [
              Comment(),
              Comment(),
              Comment(),
              Comment(),
              Comment(),
              Comment(),
            ]
          ))
        ],
      ),
    );
  }
}
