// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context){
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if(products == null || products.isEmpty){
      return const <Card>[];
    }
    final ThemeData themeData = Theme.of(context);
    final NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );
    return products.map((product){
      return Card(
        // TODO: Adjust card heights (103)
        child: Column(
          //CrossAxisAlignment.start: 头部对齐, CrossAxisAlignment.center:居中对齐
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //图片形状由 AspectRatio 决定，而不是提供的图片本身的形状
            //AspectRatio : A widget that attempts to size the child to a specific aspect ratio.
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                  product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102), 图片是由 BoxFit 进行绘制的，（在这个案例中）默认是 .scaleDown 模式
                fit: BoxFit.fitWidth,
              ),
            ),
            
            Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product == null ? '': product.name,
                        style: themeData.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                          product == null ? '': numberFormat.format(product.price),
                          style: themeData.textTheme.caption,
                      ),
                    ],
                  ),
                ),
            ),
            
          ],
        ),
        elevation: 0.0,
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductsRepository.loadProducts(Category.all));
  }
}
