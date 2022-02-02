import 'package:flutter/material.dart';

class MoreItems extends StatefulWidget {
  const MoreItems({Key? key}) : super(key: key);

  @override
  _MoreItemsState createState() => _MoreItemsState();
}

class _MoreItemsState extends State<MoreItems> {
  List<String> dropdownSublist = ['Kotlin', 'Java', 'Flutter'];
  List<String> dropdownItems = ['Android', 'IOS', 'QA', 'Web', 'BA'];
  String? dropdownValue = '';
  bool? value1 = false;
  bool? value2 = false;
  bool? value3 = false;
  bool? value4 = false;
  int _radioval = 1;
  bool _switchVal = false;
  bool _switchVal2 = false;
  bool _switchVal3 = false;

  _MoreItemsState() {
    dropdownValue = dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          DropdownButton<String>(
              isExpanded: false,
              value: dropdownValue,
              style: TextStyle(color: Colors.blueAccent),
              elevation: 10,
              borderRadius: BorderRadius.circular(5.0),
              icon: const Icon(Icons.arrow_downward_rounded),
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              }),
          // Row(
          //   children: [
          //     Radio(value: 4, groupValue: 4, onChanged: (_){})
          //   ],
          // ),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(dropdownItems[0]),
              value: value1,
              onChanged: (bool? value) {
                setState(() {
                  value1 = value!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(dropdownItems[1]),
              value: value2,
              onChanged: (bool? value) {
                setState(() {
                  value2 = value!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(dropdownItems[2]),
              value: value3,
              onChanged: (bool? value) {
                setState(() {
                  value3 = value!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(dropdownItems[3]),
              value: value4,
              onChanged: (bool? value) {
                setState(() {
                  value4 = value!;
                });
              }),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height * 0.05,
                child: RadioListTile(
                  value: 1,
                  groupValue: _radioval,
                  onChanged: (val) {
                    setState(() {
                      _radioval = val as int;
                    });
                  },
                  title: Text(dropdownItems[0]),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.05,
                child: RadioListTile(
                  value: 2,
                  groupValue: _radioval,
                  onChanged: (val) {
                    setState(() {
                      _radioval = val as int;
                    });
                  },
                  title: Text(dropdownItems[1]),
                ),
              ),

              // RadioListTile(
              //   value: 3,
              //   groupValue: _radioval,
              //   onChanged: (val) {
              //     setState(() {
              //       _radioval = val as int;
              //     });
              //   },
              //   title: Text(dropdownItems[2]),
              // ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.05,
                child: RadioListTile(
                  value: 4,
                  groupValue: _radioval,
                  onChanged: (val) {
                    setState(() {
                      _radioval = val as int;
                    });
                  },
                  title: Text(dropdownItems[3]),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.05,
                child: RadioListTile(
                  value: 5,
                  groupValue: _radioval,
                  onChanged: (val) {
                    setState(() {
                      _radioval = val as int;
                    });
                  },
                  title: Text(dropdownItems[4]),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(dropdownItems[0]),
              const SizedBox(
                width: 5.0,
              ),
              Switch(
                  value: _switchVal,
                  onChanged: (bool val) {
                    setState(() {
                      _switchVal = val;
                    });
                  }),
              Text(dropdownItems[1]),
              const SizedBox(
                width: 5.0,
              ),
              Switch(
                  value: _switchVal2,
                  onChanged: (bool val) {
                    setState(() {
                      _switchVal2 = val;
                    });
                  }),
              Text(dropdownItems[2]),
              const SizedBox(
                width: 5.0,
              ),
              Switch(
                  value: _switchVal3,
                  onChanged: (bool val) {
                    setState(() {
                      _switchVal3 = val;
                    });
                  }),
            ],
          )

          ///RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
        ],
      ),
    ));
  }
}
