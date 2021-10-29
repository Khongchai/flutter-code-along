import "package:flutter/material.dart";

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem(this.id, this.title, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: Image.network(imageUrl, fit: BoxFit.cover),
            footer: GridTileBar(
              leading: IconButton(
                icon: const Icon(Icons.favorite),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print("lksjdf");
                },
              ),
              backgroundColor: Colors.black87,
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print("lksjdf");
                },
              ),
            )),
      ),
    );
  }
}
