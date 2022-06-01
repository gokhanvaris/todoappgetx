import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../detail/view/detail_view.dart';
import '../controller/network_controller.dart';

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
                title: Text('${_controller.todoItems.length} tasks'),
              ),
              body: ListView.builder(
                itemCount: _controller.todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.off(DetailView(
                        model: _controller.todoItems[index],
                      ));
                    },
                    child: ListTile(
                      leading: Text(_controller.todoItems[index].id.toString()),
                      title: Text(_controller.todoItems[index].title ?? ''),
                      // trailing: Text(_controller.dataModel[index].completed.toString()),
                      trailing: Checkbox(
                        value: _controller.todoItems[index].completed,
                        onChanged: (value) {
                          setState(() {
                            _controller.todoItems[index].completed = value;
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
