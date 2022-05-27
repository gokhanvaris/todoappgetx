import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp_getx/data/service/controller/network_controller.dart';
import 'package:todoapp_getx/ui/detail/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<NetworkController>();

    return _buildScaffold(_controller);
  }

  Obx _buildScaffold(NetworkController _controller) {
    return Obx(
      (() => _controller.isLoading.isTrue
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Loading'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('${_controller.dataModel.length.toString()} tasks'),
              ),
              body: ListView.builder(
                itemCount: _controller.dataModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.off(DetailView(
                        model: _controller.dataModel[index],
                      ));
                    },
                    child: ListTile(
                      leading: Text(_controller.dataModel[index].id.toString()),
                      title: Text(_controller.dataModel[index].title),
                      // trailing: Text(_controller.dataModel[index].completed.toString()),
                      trailing: Checkbox(
                        value: _controller.dataModel[index].completed,
                        onChanged: (value) {
                          setState(() {
                            _controller.dataModel[index].completed = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ))),
    );
  }
}
