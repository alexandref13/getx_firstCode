import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Controller extends GetxController {
  var name = "Alexandre".obs;
  changeName() => name.value = "Roberta";

  var counter = 0.obs;
  increment() => counter++;
}

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Clique: ${c.counter}")),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Ir pra Outra tela"),
          onPressed: () => Get.to(
            Other(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              child: Text('Voltar para HomePage'),
              onPressed: () => Get.back(),
            ),
          ),
          Center(
            child: Obx(
              () => Text("${c.counter}"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}
