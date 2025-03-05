import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/toll_viewmodel.dart';

class TollScreen extends StatelessWidget {
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TollViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Toll Calculator")),
      body: Column(
        children: [
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: "Enter location"),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.fetchToll(locationController.text);
            },
            child: Text("Check Toll"),
          ),
          viewModel.currentToll == null
              ? Text("No toll data")
              : Text("Toll: \$${viewModel.currentToll!.amount}"),
        ],
      ),
    );
  }
}
