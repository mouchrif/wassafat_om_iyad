import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/constants.dart';

class BuildTabViewContainer extends StatelessWidget {
  final List<String> list;
  final Color cardColor;
  final String listName;
  BuildTabViewContainer({
    this.list,
    this.cardColor,
    this.listName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Card(
          color: cardColor,
          child: listName.contains("Ingredients")
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Text(
              list[index],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
          : ListTile(
            leading: CircleAvatar(
              child: Text(
                "#${index + 1}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              backgroundColor: kPrimaryColor,
            ),
            title: Text(
              list[index],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
