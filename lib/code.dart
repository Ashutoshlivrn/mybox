import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<String> list1 = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<String> list2 = [];
  List<String> tempList = [];
  Map<String, bool> listValues = {
    'A': false,
    'B': false,
    'C': false,
    'D': false,
    'E': false,
    'F': false,
    'G': false,
    'H': false,
    'I': false,
    'J': false,
    'K': false,
    'L': false,
    'M': false,
    'N': false,
    'O': false,
    'P': false,
    'Q': false,
    'R': false,
    'S': false,
    'T': false,
    'U': false,
    'V': false,
    'W': false,
    'X': false,
    'Y': false,
    'Z': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _column1(),
            _column2(),
          ],
        ),
      ),
    );
  }

  Widget _column1() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: list1.map(
                  (item) => CheckboxListTile(
                title: Text(item),
                value: listValues[item],
                onChanged: (val) {
                  setState(
                        () {
                      listValues[item] = val!;
                      if (val == true) {
                        tempList.add(item);
                      } else {
                        tempList.remove(item);
                      }
                    },
                  );
                },
              ),
            ).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                  _removeFromList1();
                },
              );
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }

  Widget _column2() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: list2
                .map(
                  (item) => CheckboxListTile(
                title: Text(item),
                value: listValues[item],
                onChanged: (val) {
                  setState(
                        () {
                      listValues[item] = val!;
                      if (val == true) {
                        tempList.add(item);
                      } else {
                        tempList.remove(item);
                      }
                    },
                  );
                },
              ),
            )
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                    () {
                  _removeFromList2();
                },
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _removeFromList1() {
    for (String alphabet in tempList) {
      listValues[alphabet] = false;
      list1.remove(alphabet);
      list2.contains(alphabet) ? null : list2.add(alphabet);
    }
    list2.sort((a, b) => a.toString().compareTo(b.toString()));
    tempList.clear();
  }

  void _removeFromList2() {
    for (String alphabet in tempList) {
      listValues[alphabet] = false;
      list2.remove(alphabet);
      list1.contains(alphabet) ? null : list1.add(alphabet);
    }
    list1.sort((a, b) => a.toString().compareTo(b.toString()));
    tempList.clear();
  }
}
