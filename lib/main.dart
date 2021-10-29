import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List _items = [];

  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/messages_list.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["items"];
  //   });
  // }

  // Widget _buildFixedList(Color color, String _text) {
  //   return Container(
  //     color: color,
  //     child: Center(
  //       child: Text(
  //         _text,
  //         style: TextStyle(color: Colors.white, fontSize: 25),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: CircleAvatar(
                          backgroundColor: Colors.white54,
                          radius: 25,
                          backgroundImage: showData[index].containsKey('avatar')
                              ? NetworkImage(showData[index]['avatar'])
                              : const NetworkImage(
                                  'https://static.thenounproject.com/png/3134331-200.png'),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3, top: 2),
                              child: Text(
                                showData[index]['first_name'] +
                                    " " +
                                    showData[index]['last_name'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              showData[index]['username'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(showData[index].containsKey("status")
                                  ? showData[index]['status']
                                  : ''),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 10, bottom: 10),
                            child: Text(showData[index]['last_seen_time']),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: showData[index].containsKey("messages")
                                ? CircleAvatar(
                                    backgroundColor: Colors.purple.shade400,
                                    radius: 13,
                                    child: Text(
                                        showData[index]['messages'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)))
                                : const Text(' '),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: showData.length,
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/messages_list.json"),
        ),
      ),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         centerTitle: true,
  //         title: const Text('Messages'),
  //       ),
  //       body: Center(
  //           child: FutureBuilder(
  //         builder: (context, snapshot) {
  //           var showData = json.decode(snapshot.data.toString());
  //           return ListView.builder(
  //             itemBuilder: (BuildContext context, int index) {
  //               return ListTile(
  //                 title: Text(showData[index]['first_name']),
  //                 subtitle: Text(showData[index]['last_name']),
  //               );
  //             },
  //             itemCount: showData.length,
  //           );
  //         },
  //         future: DefaultAssetBundle.of(context)
  //             .loadString("assets/messages_list.json"),
  //       )));
  // }

  // @override
  // Widget build(BuildContext context) {

  //   return Scaffold(
  //     appBar: AppBar(

  //       title: Text(widget.title),
  //     ),
  //     body: CustomScrollView(
  //       slivers: <Widget>[
  //         SliverFixedExtentList(
  //           itemExtent: 200,
  //           delegate: SliverChildListDelegate([
  // _buildFixedList(Colors.cyan, "Cyan"),
  // _buildFixedList(Colors.green, "Green"),
  // _buildFixedList(Colors.orange, "Orange"),
  // _buildFixedList(Colors.amberAccent, "AmberAccent"),
  // _buildFixedList(Colors.blueGrey, "Blue Grey"),
  // _buildFixedList(Colors.cyan, "Cyan"),
  // _buildFixedList(Colors.green, "Green"),
  // _buildFixedList(Colors.orange, "Orange"),
  // _buildFixedList(Colors.amberAccent, "AmberAccent"),
  // _buildFixedList(Colors.blueGrey, "Blue Grey"),
  // _buildFixedList(Colors.cyan, "Cyan"),
  // _buildFixedList(Colors.green, "Green"),
  // _buildFixedList(Colors.orange, "Orange"),
  // _buildFixedList(Colors.amberAccent, "AmberAccent"),
  // _buildFixedList(Colors.blueGrey, "Blue Grey"),
  // _buildFixedList(Colors.cyan, "Cyan"),
  // _buildFixedList(Colors.green, "Green"),
  // _buildFixedList(Colors.orange, "Orange"),
  // _buildFixedList(Colors.amberAccent, "AmberAccent"),
  // _buildFixedList(Colors.blueGrey, "Blue Grey"),
//             ]),
//           ),
//         ],
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//}
