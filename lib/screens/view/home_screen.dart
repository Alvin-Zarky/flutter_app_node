import 'package:flutter/material.dart';
import 'package:flutter_app_node/widgets/list_todo.dart';
import 'package:flutter_app_node/widgets/modal_sheet.dart';
import 'package:flutter_app_node/utils/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showBottomSheetBar() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 1,
        child: ModalBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheetBar,
        backgroundColor: const Color.fromARGB(255, 87, 209, 91),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    Row(
                      children: const [
                        Icon(Icons.notifications),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.mail),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35, bottom: 13),
                  child: Row(
                    children: const [
                      Text(
                        "What's up,",
                        style: kTextTitleHome,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Alvin",
                        style: kTextTitleHome,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Today's task".toUpperCase(),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      letterSpacing: 0.8,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: const [
                      Image(
                        height: 140,
                        fit: BoxFit.cover,
                        image: AssetImage("lib/assets/img/no-data.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "No Data",
                        style: TextStyle(
                          color: Color.fromARGB(255, 170, 170, 170),
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTodoTile(
                        title: "Web Developer",
                        function: showBottomSheetBar,
                      ),
                      ListTodoTile(
                        title: "Mobile Developer",
                        function: showBottomSheetBar,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
