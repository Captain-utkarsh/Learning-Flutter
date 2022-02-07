import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_signup/screens/widget/user_data_details.dart';

class MoreItems extends StatefulWidget {
  const MoreItems({Key? key}) : super(key: key);

  @override
  _MoreItemsState createState() => _MoreItemsState();
}

class _MoreItemsState extends State<MoreItems> {
  List<String> dropdownSublist = ['Kotlin', 'Java', 'Flutter'];
  List<String> dropdownItems = ['Android', 'IOS', 'QA', 'Web', 'BA'];
  String? dropdownValue = '';
  int val = 0;
  // TextEditingController _typeaheadController = TextEditingController();
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
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadField<User?>(
                  hideSuggestionsOnKeyboardHide: true,
                  textFieldConfiguration: const TextFieldConfiguration(
                      decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search Username',
                  )),
                  suggestionsCallback: UserData.getSuggestions,
                  itemBuilder: (context, User? suggestion) {
                    final user = suggestion!;
                    return ListTile(
                      title: Text(user.name),
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Hero(
                          tag: 'Img index $val',
                          child: Image.network(
                            user.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  onSuggestionSelected: (User? suggestion) {
                    final user = suggestion!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetailPage(user: user)));
                  }),
            ),
            DropdownButton<String>(
                isExpanded: false,
                value: dropdownValue,
                style: const TextStyle(color: Colors.blueAccent),
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
      ),
    ));
  }
}

class User {
  final String name;
  final String imageUrl;

  const User({
    required this.name,
    required this.imageUrl,
  });
}

class UserData {
  static final faker = Faker();
  static final List<User> users = List.generate(
    10,
    (index) => User(
      name: faker.person.name(),
      imageUrl: 'https://source.unsplash.com/random?user+face&sig=$index',
    ),
  );

  static List<User> getSuggestions(String query) =>
      List.of(users).where((user) {
        final userLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return userLower.contains(queryLower);
      }).toList();
}
