import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class SelectionListTile extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;

  const SelectionListTile({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ListTile(
            title: Text(
              text,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.headline5?.color,
              ),
            ),
            trailing: isSelected
                ? Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              height: 20,
              width: 20,
              child: Icon(
                Icons.check,
                size: 20,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            )
                : Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              height: 20,
              width: 20,
            ),
            onTap: () => onTap.call(),
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2.0,
        ),
      ],
    );
  }
}
