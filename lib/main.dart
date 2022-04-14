import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Floating Action Buttons'),
        ),
        // floatingActionButton: FabCircularMenu(
        //   fabOpenIcon: const Icon(Icons.flutter_dash),
        //   children: [
        //     IconButton(onPressed: () {
        //       print('home');
        //     }, icon: const Icon(Icons.home)),
        //     IconButton(onPressed: () {
        //       print('person');
        //     }, icon: const Icon(Icons.person)),
        //     IconButton(onPressed: () {
        //       print('group');
        //     }, icon: const Icon(Icons.group))
        //   ],
        //
        // ),
        // body: HawkFabMenu(
        //     body: const Center(child: Text('Hello'),),
        //     items: [
        //       HawkFabMenuItem(
        //           label: 'Home',
        //           ontap: () {},
        //           icon: const Icon(Icons.home)
        //       ),
        //       HawkFabMenuItem(
        //           label: 'Profile',
        //           ontap: () {},
        //           icon: const Icon(Icons.person)
        //       ),
        //       HawkFabMenuItem(
        //           label: 'Friends',
        //           ontap: () {},
        //           icon: const Icon(Icons.group)
        //       ),
        //     ]),
        floatingActionButton: FloatingActionBubble(
          onPress: () {
            if(_animationController.isCompleted){
              _animationController.reverse();
            }else{
              _animationController.forward();
            }
          },
          animation: _animation,
          items: [
            Bubble(
                icon: Icons.home,
                iconColor: Colors.blue,
                title: 'Home',
                titleStyle: const TextStyle(),
                bubbleColor: Colors.amber,
                onPress: () {}),
            Bubble(
                icon: Icons.person,
                iconColor: Colors.blue,
                title: 'Profile',
                titleStyle: const TextStyle(),
                bubbleColor: Colors.amber,
                onPress: () {}),
            Bubble(
                icon: Icons.group,
                iconColor: Colors.blue,
                title: 'Friends',
                titleStyle: const TextStyle(),
                bubbleColor: Colors.amber,
                onPress: () {})
          ],
          backGroundColor: Colors.red,
          iconColor: Colors.green,
          iconData: Icons.add,
        ),
      ),
    );
  }
}
