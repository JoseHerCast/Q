import 'package:flutter/material.dart';
import 'package:licencias/models/store.dart';
import 'package:licencias/models/store_list.dart';
import 'package:licencias/widgets/main_appbar.dart';
import 'package:licencias/widgets/store_card.dart';

class StoreListScreen extends StatefulWidget {
  Color categoryColor;
  StoreListScreen({
    Key? key,
    required this.categoryColor,
  }) : super(key: key);

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  List<Store> stores = StoreList.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: 'Detalles'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: stores.length,
                itemBuilder: (BuildContext context, int index) {
                  return StoreCard(
                    store: stores[index],
                    categoryColor: widget.categoryColor,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
