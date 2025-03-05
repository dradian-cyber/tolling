import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/toll_model.dart';

class TollRemoteDataSource {
  Future<TollModel> getTollByLocation(String location) async {
    final response = await http.get(Uri.parse("https://api.tollservice.com/toll/$location"));
    if (response.statusCode == 200) {
      return TollModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load toll data");
    }
  }
}
