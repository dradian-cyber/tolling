//The View complies with the ViewModel and updates the UI when the state changes
//This is a Toll Page example
//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/toll_viewmodel.dart';

class TollPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tollState = ref.watch(tollViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Toll Payment")),
      body: Center(
        child: tollState.when(
          data: (toll) => toll != null
              ? Text("Toll Fee: \$${toll.amount}")
              : Text("No toll data found"),
          loading: () => CircularProgressIndicator(),
          error: (e, _) => Text("Error: ${e.toString()}"),
        ),
      ),
    );
  }
}
