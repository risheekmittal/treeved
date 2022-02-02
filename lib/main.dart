import 'package:flutter/material.dart';
import 'package:treeved/post.dart';
import 'package:provider/provider.dart';
import 'package:treeved/post_screen.dart';
import 'package:treeved/post_screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (_) => LikeCount()),
        ChangeNotifierProvider(create : (_) => HeartCount()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostScreen2(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Post(),
            Post()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.black,),
                label: 'Home',
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined, color: Colors.black,),
                label: 'Search',
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black,),
              label: 'Profile',
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {

  const ReusableCard({ required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(color: Colors.black38, blurRadius: 15.0)
            ]
        ),
        margin: const EdgeInsets.all(15.0),
      ),
    );
  }
}

class LikeCount with ChangeNotifier {
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
