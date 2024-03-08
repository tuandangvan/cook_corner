
import 'package:cooks_corner/models/models.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: AppBar(
              flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 0, left: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18,),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios, size: 20,)),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 80),
                        child: Text('What to eat\n    today?',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFEDEDED),
                      filled: true,
                      hintText: 'Search recipes',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      suffixIcon: const Icon(Icons.search),
                      suffixIconColor: AppColors.textColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(42),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent search",
                    style: TextStyle(fontSize: 12, color: AppColors.textColor),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Clear",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.textColor),
                      )),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              Flexible(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  final List<Search> searchs = [
                    const Search(name: "Egg Omlet", dateSearch: 4, image: "https://s3-alpha-sig.figma.com/img/f2b2/a0f4/bca297ef579e6efc869bdd2d06414c28?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AIweGYn98NzCZky3zQ-MqZ281ICfi6IJgwJ6OtkgoHpnMtAuCVaHJ4UF6d3Y7EWKifP3HvDIUrVJbjtRdeswI2dKOFLA~67T1cnSL3vI6Pc3qQhsyIm0H8jWtosGkwqpdeNKx~8spMAh0OkFmz0keLzRq5AFyiXI-q-AqzpUMDXU1NlCNLNGWFhRwbG3BxDEpEfFvtO5wWzIxxiFuh6ZshVGC5Gk-8kRn1spsngUqHzT6bQ-aCF7YOclnkYcgqds18Syi~i3Ys-njhNyeWRneB65u-YNMLY~FKgJdgctG7Q0ejl1e6lUt91D~N1cPwuW64SeuQ52z0Nm0FzsIJA5eg__"),
                    const Search(name: "Salad", dateSearch: 2, image: "https://s3-alpha-sig.figma.com/img/413f/ebb2/1f7448512a19956bd6e284e061b8d8ed?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fAauFB7rsu1j9f9F7phyu2Yu~7BCCFYIUNgQzDGWrjKTV7M~WOP0r5Zxosf5zrbkuTkt0TlZkGadC0EVkFAmSmJ~UVnTJB5Ka0vcZoliN8RhuQv~SihWRlKZB6plydvDIwULRlChSYCfM4LIF4Ar8krRYJkG9SD-qDux9VR5imaVJxgA3xsazUgyyNBuc1m0CK8aC632qfNpg3unz2Halk5XRSBtKEgZHSwtcxy5uUxf7Tz7RAqtiU2vPxeCt86knqWcapevm8zbKGcZ-W0ckjrmUpb6Z-isyPSQiOWVMDY~9m-01dRoi7Cyxb7jVkAGkYd7C-i4K4iFwCWAgek~XQ__"),

                  ];

                  return Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: Image.network(
                              searchs[index].image,
                              width: 63,
                              height: 61,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(searchs[index].name,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor),
                                  )),
                              Text("${searchs[index].dateSearch} day Ago",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textFaded),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      if (index == 1)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Popular Recipes",
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.textColor),
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      "See All",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textColor),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 272,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final List<Category> categoryList = [
                                        const Category(
                                            categoryName: "Bada Pao",
                                            imageUrl:
                                                "https://s3-alpha-sig.figma.com/img/6299/6dfb/0797855b3b853a0defd40d3da55c1108?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VBIto6wI3AiyEyhAOM6-tfGUR-2MnoCUnK-~bjMlaQwp4TlkiOaHRv~XTr34Bnz1Ez90qJif-EewKiBByRjuK4TMCFM-YTJC9pynqV5oJIrpIB0IOWG1D7k-4my5ewgP2oRHMB1rXqJ3njs9k46KsPyZb5QY4~k8aXGHdhCYvbDbMzqrgLAPv6E-N~b86m5bawxz9AMhxi8vNjtNrUb9Fq5L1XrpmwpWGcFNPXEl5vy1SBkvx8hsin90qh1xdfsshbflxdXGOaVxxyT8CZGSXzPHjE39zXL7Ze1MeIYyqfDFC3fCUJfhydxc85LyGT1bXgqcA4Afo-7Pak6GdaDJgw__",
                                            cookingTime: 35,
                                            evaluate: 'Hard'),
                                        const Category(
                                            categoryName: "Cheese Roti Burger",
                                            imageUrl:
                                                "https://s3-alpha-sig.figma.com/img/dc99/a242/01e9c4d642a3998217a15130fc036af9?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KHJN~7kenYxvVpS2u0BPlGBjE4S0aSOtlOdePff3NjFtrLME~GEe4hmM4jb0SEZMi1mJxYLygKp6i-J3lhT3lM9ows16dudFEVKJtQwq7WsMUQZ8TD2i2l53UnL-AnZpmZ0HCVvd-KWvEFhD-j1v-8jubjiRJmCgBetRdZ1dOiFE7hnUUqLkN2KFBLmujZSGaCbIpktUn0Id6FO039Asz7fddPGbJg3KCScDTru0F~v1CtTSzU4~HN5ckEUCQJbiR-rrupsIpN1NmCEP~RBdp6vuioUAuCatg6XUahA7Qh-IjrmMk2bvAIay75uU2~ZQhxmRJrGpyhJy0hMFS2U1dw__",
                                            cookingTime: 60,
                                            evaluate: 'Easy'),
                                      ];
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height: 272,
                                              width: 204,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(36),
                                                color: AppColors.secondary,
                                              ),
                                              child: _CategoryCard(
                                                  categoryData:
                                                      categoryList[index])));
                                    })),
                          ],
                        )
                    ],
                  );
                },
              )),
            ],
          ),
        ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  final Category categoryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 0),
          child: SizedBox(
              width: 177,
              height: 180,
              child: Image.network(categoryData.imageUrl)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 9),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(categoryData.categoryName,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3.0, left: 9),
          child: Row(
            children: [
              const Icon(
                Icons.alarm_on_outlined,
                size: 12,
                color: AppColors.textFaded,
              ),
              const SizedBox(width: 5),
              Text('${categoryData.cookingTime} min',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textFaded,
                  ))),
              const SizedBox(width: 10),
              const Icon(
                Icons.sentiment_neutral,
                size: 12,
                color: AppColors.textFaded,
              ),
              const SizedBox(width: 5),
              Text(categoryData.evaluate,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textFaded,
                  ))),
            ],
          ),
        )
      ],
    );
  }
}
