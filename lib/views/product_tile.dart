import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:ProductList/models/product.dart';
import 'product_details.dart';
class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    double oldprice = product.price.toDouble();
    double newprice = (oldprice*26)/100;
    double discount = oldprice-newprice;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(

                  child: Container(
                    height: 150,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: (){

                  },
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: product.isFavorite.value
                              ? Icon(Icons.favorite_rounded)
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            product.isFavorite.toggle();
                          },
                        ),
                      )),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text(
                'Current Price: ${discount} TK',
                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 22, fontFamily: 'avenir')),
            SizedBox(height: 8),
            Text(
                'Previous Price: ${{product.price}} TK',
                style: TextStyle(color: Colors.blueGrey,fontSize: 12, fontFamily: 'avenir',decoration: TextDecoration.lineThrough)),
            SizedBox(height: 8),
            Text(
                '${product.category}',
                style: TextStyle(color: Colors.deepPurple,fontSize: 12, fontFamily: 'avenir')),
            SizedBox(height: 8),
            ReadMoreText(
              'Description: ${product.description}',
              trimLines: 1,
              style: TextStyle(color: Colors.black,fontSize: 12, fontFamily: 'avenir'),
              colorClickableText: Colors.red,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Expand',
              trimExpandedText: ' Collapse ',
            ),
          ],
        ),
      ),
    );
  }
}
