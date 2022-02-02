import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:treeved/post.dart';
import 'main.dart';
List<Widget>list = [
  Comment(),
];
class PostScreen extends StatefulWidget {
  PostScreen({required this.isLiked});
  bool isLiked;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ReusableCard(
                colour: Colors.white,
                cardChild: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20),
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black, //remove this when you add image.
                              ),
                              child: const Text("")
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0,top: 25),
                                child: Text("Alok",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("08 January 2022",style: TextStyle(color: Colors.grey),),
                            ),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(width: 280,height: 80,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,top: 10, right: 15),
                      child: Text('A collision of sci-fi, drama and horror, "Before I Fall" earns points for ambition',style: TextStyle(fontWeight: FontWeight.w600),),
                    ),
                    const Divider(
                        color: Colors.grey
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(alignment: Alignment.topLeft,child: SizedBox(height: 20,
                        child: GestureDetector(onTap: () {},
                            child: const Text("10 comments", style: TextStyle(color: Colors.grey),)),
                      )),
                    ),
                    const Divider(
                        color: Colors.grey
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 30,
                              child: IconButton(
                                  onPressed: (){
                                      if(widget.isLiked==false){
                                        widget.isLiked = true;
                                        print("aaaa");
                                        context.read<LikeCount>().increment();
                                      }
                                      else{
                                        widget.isLiked = false;
                                        context.read<LikeCount>().decrement();
                                      }

                                  },
                                  icon: context.watch<LikeCount>().isLiked ? Icon(Icons.thumb_up, size: 20,) : Icon( Icons.thumb_up_off_alt, size: 20,)),
                            ),
                            Text("${context.watch<LikeCount>().likes} likes",style: TextStyle(fontSize: 10),)
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 30,
                              child: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.share, size: 20,)),
                            ),
                            Text("Share",style: TextStyle(fontSize: 10),)
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 30,
                              child: GestureDetector(
                                onTap: (){},
                                child: Row(
                                  children: [
                                    Text("4.1"),
                                    const Icon(Icons.star, size: 20,)
                                  ],
                                ),
                              ),
                            ),
                            Text("Avg. Rating",style: TextStyle(fontSize: 10),)
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                        color: Colors.grey
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Align(alignment: Alignment.centerLeft,child: Text("Comments",style: TextStyle(fontWeight: FontWeight.bold)),),
                    ),
                    Container(height: 300,
                      child: ListView.builder(itemBuilder: (context, index){
                        Widget widget = list.elementAt(index);
                        return widget;

                      }, itemCount: list.length,),),
                  ],
                ), onPress: (){},
              ),
            ),
          ],
        )
    );
  }
}

class Comment extends StatefulWidget {
  Comment({
    Key? key,
  }) : super(key: key);

  bool isLiked = false;

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 10),
      child: Align(alignment: Alignment.centerLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                  child: const Text("")
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0,top: 10),
                      child: Text("Tada",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("08 January 2022",style: TextStyle(color: Colors.grey, fontSize: 10),),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Text("Would definitely watch it."),
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                                if(widget.isLiked==false){
                                widget.isLiked = true;
                                print("aaaa");
                                context.read<HeartCount>().increment();
                                }
                                else{
                                widget.isLiked = false;
                                context.read<HeartCount>().decrement();
                                }
                 }, icon: context.watch<HeartCount>().isLiked ? Icon(Icons.favorite, size: 20,) : Icon( Icons.favorite_border, size: 20,)),
                Text("${context.watch<HeartCount>().likes}",style: TextStyle(fontSize: 10),),
                TextButton(onPressed: (){
                  setState(() {
                    list.add(TextField(decoration: InputDecoration(hintText: 'Hint ${list.length+1}'),));
                  });
                }, child: Text("Reply",))
              ],
            )
          ],
        ),
      ),
    );
  }
}
class HeartCount with ChangeNotifier {
  int _likes = 0;
  bool isLiked = false;
  int get likes => _likes;
  bool get isLiked2 => isLiked;

  void increment(){
    _likes++;
    notifyListeners();
    isLiked = true;
  }
  void decrement(){
    _likes--;
    isLiked = false;
    notifyListeners();
  }
}