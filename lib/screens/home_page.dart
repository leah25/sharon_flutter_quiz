import 'package:flutter/material.dart';
import 'package:sharon_flutter_quiz/api_data/names_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List body = [];
  @override
  void initState() {
    Names().nameList().then((value) {
      setState(() {
        body = value;
      });
      // print('vvvvvvvvvvvvvvvvv${body!.length}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = body.length;

    var nums = [for (int i = 0; i < totalItems; i++) i];

    return Scaffold(
      appBar: AppBar(
        title: const Text("List Of The First 5 Users"),
      ),
      body: (body.length == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: nums.take(5).length,
              itemBuilder: (context, int i) => ListTile(
                    title: Text(body[i]["name"]),
                  )),
    );
  }
}
