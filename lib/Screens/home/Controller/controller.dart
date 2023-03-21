import 'package:flutter_mvc/Network/requests.dart';
import 'package:flutter_mvc/Network/endpoints.dart';
import 'package:flutter_mvc/Screens/home/Model/model.dart';

class DataController {
  Future<List<DataModel>?> getData() async {
    final data = await GetRequest().getJsonData(ApiEndpoints().homeEndpoint);

    if (data != null) return dataModelFromJson(data);
    return null;
  }
}
