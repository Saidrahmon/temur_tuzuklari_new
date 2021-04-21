import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/AppRoutes.dart';
import 'package:temur_tuzuklari_new/models/title_model.dart';

class SearchTitle<T> extends SearchDelegate<T> {
  List<TitleModel> data;

  SearchTitle(this.data);

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) =>
      IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Get.back());

  @override
  Widget buildResults(BuildContext context) => Container(color: Colors.red,);

  @override
  Widget buildSuggestions(BuildContext context) {
    List listToShow;

    if (query.isNotEmpty)
      listToShow = data
          .where((e) =>
              e.title.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    else
      listToShow = data;
    return listToShow.length == 0
        ? Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'textNothing'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            color: Colors.white,
          )
        : Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: listToShow.length,
              itemBuilder: (_, i) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      listToShow[i].title,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.STORY,
                        arguments: [listToShow[i].chapter, listToShow[i].lang],
                      );
                    },
                  ),
                );
              },
            ),
          );
  }

  @override
  String get searchFieldLabel => 'textSearch'.tr;

  @override
  TextStyle get searchFieldStyle {
    return TextStyle(fontSize: 18, color: Colors.black54);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return ThemeData(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      //primaryTextTheme: theme.textTheme,
    );
  }
}
