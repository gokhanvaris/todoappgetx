import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controller/network_controller.dart';
import '../../home/view/home_view.dart';

import '../../../data/model/data_model.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.model}) : super(key: key);

  final DataModel model;
  final _controller = Get.find<NetworkController>();
  late final modelId = model.id;

  int getID(int modelId) {
    if (modelId == null) {
      return 0;
    } else {
      return modelId - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(textEditingController),
    );
  }

  Column _buildBody(TextEditingController textEditingController) {
    return Column(
      children: [
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(labelText: model.title),
        ),
        const SizedBox.shrink(),
        TextButton(
            onPressed: () {
              _controller.todoItems[getID(model.id ?? 0)].title = textEditingController.text;

              Get.to(const HomeView());

              // _controller.itemList = model as RxList<DataModel>;
            },
            child: const Text('Save'))
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('${model.id.toString()}. task'),
    );
  }
}
