import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_toll_amount.dart';
import '../../domain/entities/toll.dart';

class TollViewModel extends StateNotifier<AsyncValue<Toll?>> {
  final GetTollAmount getTollAmount;

  TollViewModel(this.getTollAmount) : super(const AsyncValue.loading());

  Future<void> fetchToll(String location) async {
    try {
      final toll = await getTollAmount.execute(location);
      state = AsyncValue.data(toll);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

