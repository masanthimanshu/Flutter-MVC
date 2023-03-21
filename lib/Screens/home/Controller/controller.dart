import 'package:flutter_mvc/service/network.dart';
import 'package:flutter_mvc/Screens/home/Model/model.dart';

class DataController {
  Future<List<DataModel>?> getData() async {
    final data = await GetRequest().getJsonData(
      "https://jsonplaceholder.typicode.com/posts",
    );

    if (data != null) return dataModelFromJson(data);

    return null;
  }
}
