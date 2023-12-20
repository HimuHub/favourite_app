import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class fav_screen extends StatefulWidget {
  const fav_screen({super.key});

  @override
  State<fav_screen> createState() => _fav_screenState();
}

class _fav_screenState extends State<fav_screen> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite app"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fav_screen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteprovider.slecteditem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.slecteditem.contains(index)) {
                          return value.removeitem(index);
                        }
                        value.additem(index);
                      },
                      title: Text("Item" + index.toString()),
                      trailing: Icon(value.slecteditem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      )),
    );
  }
}
