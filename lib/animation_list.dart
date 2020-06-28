import 'package:flutter/material.dart';

class MyAnimatedList extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedList({
    this.appBarTitle,
  });

  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  GlobalKey<AnimatedListState> _listKey;
  List<String> _data;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey();
    _data = ['Horse', 'Cow', 'Camel', 'Sheep', 'Goat'];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: AnimatedList(
              key: _listKey,
              shrinkWrap: true,
              initialItemCount: _data.length,
              itemBuilder: (context, index, animation) {
                return _singleItem(_data[index], animation);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () => _addOneItem(),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Add One',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => _addManyItems(),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Add many',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => _removeOneItem(),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Remove One',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _singleItem(String item, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListTile(
            title: Text(
              item,
              style: TextStyle(fontSize: 24),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              6.0,
            ),
            border: Border.all(
              color: Colors.blue[700],
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  void _addOneItem() {
    String item = "Human";
    int insertIndex = 2;
    _data.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }

  void _removeOneItem() {
    int removeIndex = 2;
    String removedItem = _data.removeAt(removeIndex);
    // This builder is just so that the animation has something
    // to work with before it disappears from view since the
    // original has already been deleted.
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      // A method to build the Card widget.
      return _singleItem(removedItem, animation);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
  }

  void _addManyItems() {
    final items = ['Rahul', 'Modi', 'Sonia'];
    int insertIndex = 2;
    _data.insertAll(insertIndex, items);
    //  doesn't have  insertAll() method.
    for (int offset = 0; offset < items.length; offset++) {
      _listKey.currentState.insertItem(insertIndex + offset);
    }
  }
}
