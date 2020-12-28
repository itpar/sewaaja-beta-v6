/// lib/presentation/home/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_loginn/presentation/home/pages/shared/styles.dart';
import 'package:flutter_loginn/presentation/home/pages/shared/colors.dart';
import 'package:flutter_loginn/presentation/home/pages/shared/fryo_icons.dart';
import 'package:flutter_loginn/presentation/home/pages/ProductPage.dart';
import 'package:flutter_loginn/presentation/home/pages/shared/Product.dart';
import 'package:flutter_loginn/presentation/home/pages/shared/partials.dart';

class PageHome extends StatelessWidget {


  PageHome({Key key, this.username, this.pageTitle}) : super(key: key);

  final String username;

  final String pageTitle;

  static Route<dynamic> route() =>
      MaterialPageRoute(
        builder: (context) => PageHome(),
      );

  @override
  Widget build(BuildContext context) {
    // will pick it up from here
    // am to start another template
    List<Product> foods = [
      Product(
          name: "Hamburger",
          image: "assets/images/3.png",
          price: "\$25.00",
          userLiked: true,
          discount: 10),
      Product(
          name: "Pasta",
          image: "assets/images/5.png",
          price: "\$150.00",
          userLiked: false,
          discount: 7.8),
      Product(
        name: "Akara",
        image: 'assets/images/2.png',
        price: '\$10.99',
        userLiked: false,
      ),
      Product(
          name: "Strawberry",
          image: "assets/images/1.png",
          price: '\$50.00',
          userLiked: true,
          discount: 14)
    ];

    List<Product> drinks = [
      Product(
          name: "Coca-Cola",
          image: "assets/images/6.png",
          price: "\$45.12",
          userLiked: true,
          discount: 2),
      Product(
          name: "Lemonade",
          image: "assets/images/7.png",
          price: "\$28.00",
          userLiked: false,
          discount: 5.2),
      Product(
          name: "Vodka",
          image: "assets/images/8.png",
          price: "\$78.99",
          userLiked: false),
      Product(
          name: "Tequila",
          image: "assets/images/9.png",
          price: "\$168.99",
          userLiked: true,
          discount: 3.4)
    ];

    return ListView(children: <Widget>[
      headerTopCategories(),
      deals('Hot Deals', onViewMore: () {}, items: <Widget>[
        foodItem(foods[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[0],
                );
              },
            ),
          );
        }, onLike: () {}),
        foodItem(foods[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[1],
                );
              },
            ),
          );
        }, imgWidth: 250, onLike: () {

        }),
        foodItem(foods[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[2],
                );
              },
            ),
          );
        }, imgWidth: 200, onLike: () {

        }),
        foodItem(foods[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[3],
                );
              },
            ),
          );
        }, onLike: () {

        }),
      ]),
      deals('Drinks Parol', onViewMore: () {}, items: <Widget>[
        foodItem(drinks[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[0],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 60),
        foodItem(drinks[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[1],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 75),
        foodItem(drinks[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[2],
                );
              },
            ),
          );
        }, imgWidth: 110, onLike: () {}),
        foodItem(drinks[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[3],
                );
              },
            ),
          );
        }, onLike: () {}),
      ])
    ]);
  }
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
            headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
            headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('No items available at this moment.',
                    style: taglineText),
              )
            ],
          ),
        )
      ],
    ),
  );
}
