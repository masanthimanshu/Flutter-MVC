import "package:flutter/material.dart";

import "controller.dart";

class SendPostRequest extends StatefulWidget {
  const SendPostRequest({Key? key}) : super(key: key);

  @override
  State<SendPostRequest> createState() => _SendPostRequestState();
}

class _SendPostRequestState extends State<SendPostRequest> {
  String? _data = "";
  bool _showLoader = true;

  final _payload = {
    "title": "foo",
    "body": "bar",
    "userId": 1,
  };

  _postData() async {
    _data = await DataController().postData(_payload);

    if (_data != null) {
      setState(() {
        _showLoader = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter MVC")),
      body: Center(
        child:
            _showLoader ? const CircularProgressIndicator() : Text(_data ?? ""),
      ),
    );
  }
}
