import 'dart:async';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

class CustomDropDownItem<T> {
  final T value;
  final String text;
  final Widget prefix;

  CustomDropDownItem({this.prefix, this.value, this.text});

  @override
  String toString() {
    return "CustomDropDownItem(value: $value, text: $text)";
  }
}

class CustomDropDown<T> extends StatefulWidget {
  final String header;
  final List<CustomDropDownItem<T>> items;
  final Function(T value) onSelected;
  final Widget suffix;
  final CustomDropDownItem intialValue;
  final double maxHeight;
  final bool defaultEmpty;
  final Color headerColor;
  final Border border;
  final Color backgroundColor;
  final Color textColor;

  const CustomDropDown({
    @required this.items,
    @required this.onSelected,
    @required this.header,
    @required this.intialValue,
    this.maxHeight,
    this.headerColor,
    this.border,
    this.defaultEmpty = false,
    this.suffix,
    this.backgroundColor,
    this.textColor,
  });

  @override
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>>
    with AutomaticKeepAliveClientMixin {
  bool expanded = false;
  List<CustomDropDownItem<T>> items = [];
  CustomDropDownItem<T> selectedItem;

  @override
  void initState() {
    initItems();
    Timer(
      Duration(milliseconds: 1),
      () {
        widget.onSelected(selectedItem.value);
      },
    );
    super.initState();
  }

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.items.toString() !=
        items.where((e) => e.value != null).toList().toString()) {
      initItems();
    }
    validateList();
    return IgnorePointer(
      ignoring: emptyList,
      child: GestureDetector(
        onTap: () {
          setState(() {
            expanded = !expanded;
            controller.animateTo(0,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "${widget.header}",
                style: TextStyle(
                  color: widget.headerColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedContainer(
              height: expanded
                  ? widget.maxHeight ?? (27.0 + (50.0 * (items.length)))
                  : 55,
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                  color: widget.backgroundColor ?? overlayColor,
                  borderRadius: BorderRadius.circular(30),
                  border: widget.border),
              child: ListView(
                padding: EdgeInsets.zero,
                controller: controller,
                physics: widget.maxHeight != null
                    ? (expanded
                        ? BouncingScrollPhysics()
                        : NeverScrollableScrollPhysics())
                    : NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      selectedItem.prefix ?? SizedBox(),
                      Expanded(
                        child: Text(
                          selectedItem.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: widget.textColor ?? Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      widget.suffix ??
                          RotatedBox(
                            quarterTurns: expanded ? 2 : 0,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: widget.textColor ?? Colors.white,
                              size: 18,
                            ),
                          )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 2),
                  ...items
                      .where((element) =>
                          selectedItem.value != element.value &&
                          element.value != null)
                      .map((e) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedItem = e;

                          controller.animateTo(
                            0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                          expanded = false;

                          widget.onSelected(selectedItem.value);
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 50,
                        child: Row(
                          children: [
                            e.prefix ?? SizedBox(),
                            Expanded(
                              child: Text(
                                e.text,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: widget.textColor ?? Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool emptyList = false;

  void initItems() {
    items = widget.items;
    if (items.isEmpty) {
      setState(() {
        emptyList = true;
      });
      items.add(
        CustomDropDownItem(
          value: widget.intialValue.value,
          text: widget.intialValue.text ?? "Select",
        ),
      );
    } else {
      setState(() {
        emptyList = false;
      });
    }
    validateList();
    if (widget.defaultEmpty) {
      if (items.where((element) => element.value == null).length == 0) {
        setState(() {
          items.insert(0, CustomDropDownItem(value: null, text: ""));
        });
      }
    }
    selectedItem = items.first;
  }

  void validateList() {
    for (int i = 0; i < items.length; i++) {
      for (int j = i + 1; j < items.length; j++) {
        if (items[i].value.toString() == items[j].value.toString()) {
          throw Exception(
              "Duplicate values \'${items[i].value}\' at indices $i and $j");
        }
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
