import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
