import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved/post_screen.dart';

import 'main.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {


double likeCount = 0;

  @override
  Widget build(BuildContext context) {
    bool isLiked = context.watch<LikeCount>().isLiked2;
    return SizedBox(
      child: Padding(
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
                  child: GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen(isLiked: isLiked,)));
                    },
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
                              if(isLiked==false){
                                isLiked = true;
                                context.read<LikeCount>().increment();
                              }
                              else{
                                isLiked = false;
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
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 10.0),
              //       child: Container(
              //         width: 30,
              //         height: 30,
              //         decoration: const BoxDecoration(
              //           color: Colors.black, //remove this when you add image.
              //         ),
              //         child: const Text("Image here")
              //       ),
              //     ),
              //     Column(
              //       children: const [
              //         Text("Rajan"),
              //         Text("Badiya Bhai",style: TextStyle(
              //             fontSize: 10.0
              //         ),),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ), onPress: (){},
        ),
      ),
      height: 330,
    );
  }
}