import '../repositories/toll_repository.dart';
import '../entities/toll.dart';

class GetTollAmount {
  final TollRepository repository;

  GetTollAmount(this.repository);

  Future<Toll> execute(String location) async {
    return await repository.getTollByLocation(location);
  }
}

