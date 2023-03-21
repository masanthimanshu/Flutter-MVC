import 'package:flutter/material.dart';
import 'package:flutter_mvc/Screens/home/Model/model.dart';
import 'package:flutter_mvc/Screens/home/Controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModel>? _data = [];
  bool _showLoader = true;

  _getData() async {
    _data = await DataController().getData();

    if (_data != null) {
      setState(() {
        _showLoader = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter MVC")),
      body: _showLoader
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _data?.length,
              itemBuilder: (e, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _data![index].title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(_data![index].body ?? ""),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
