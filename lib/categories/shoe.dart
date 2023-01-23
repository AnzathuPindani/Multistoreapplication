import 'package:flutter/material.dart';
import 'package:siopa/utils/category_list.dart';
import 'package:siopa/widget/categ_widget.dart';

class ShoesCategory extends StatelessWidget {
  const ShoesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.69,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategHeadLabel(catHeadLabel: "Shoes"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: List.generate(shoes.length, (index) {
                      return SubCategModel(
                        mainCategName: "Shoes",
                        assetName: "images/shoes/shoes$index.jpg",
                        subCategLabel: shoes[index],
                        subCategName: shoes[index],
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              title: "Shoes",
            ))
      ],
    );
  }
}
