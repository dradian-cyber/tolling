//Handles reading/writing toll data
//
import '../models/toll_model.dart';
import 'database_helper.dart';

class TollLocalDataSource {
  final DatabaseHelper databaseHelper;

  TollLocalDataSource(this.databaseHelper);

  Future<void> cacheToll(TollModel toll) async {
    await databaseHelper.insertToll(toll);
  }

  Future<List<TollModel>> getCachedTolls() async {
    return await databaseHelper.fetchAllTolls();
  }
}
