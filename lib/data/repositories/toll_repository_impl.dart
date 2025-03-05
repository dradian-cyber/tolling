import '../../domain/entities/toll.dart';
import '../../domain/repositories/toll_repository.dart';
import '../datasources/toll_remote_data_source.dart';

class TollRepositoryImpl implements TollRepository {
  final TollRemoteDataSource remoteDataSource;

  TollRepositoryImpl(this.remoteDataSource);

  @override
  Future<Toll> getTollByLocation(String location) async {
    return await remoteDataSource.getTollByLocation(location);
  }
}
