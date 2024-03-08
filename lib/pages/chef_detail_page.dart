import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';

class ChefDetailPage extends StatefulWidget {
  final Chef chef;
  const ChefDetailPage({Key? key, required this.chef}) : super(key: key);

  @override
  State<ChefDetailPage> createState() => _ChefDetailPageState();
}

class _ChefDetailPageState extends State<ChefDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Recipe> listRecipe = [
    Recipe(
        recipeName: "Egg Omlet",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/f2b2/a0f4/bca297ef579e6efc869bdd2d06414c28?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AIweGYn98NzCZky3zQ-MqZ281ICfi6IJgwJ6OtkgoHpnMtAuCVaHJ4UF6d3Y7EWKifP3HvDIUrVJbjtRdeswI2dKOFLA~67T1cnSL3vI6Pc3qQhsyIm0H8jWtosGkwqpdeNKx~8spMAh0OkFmz0keLzRq5AFyiXI-q-AqzpUMDXU1NlCNLNGWFhRwbG3BxDEpEfFvtO5wWzIxxiFuh6ZshVGC5Gk-8kRn1spsngUqHzT6bQ-aCF7YOclnkYcgqds18Syi~i3Ys-njhNyeWRneB65u-YNMLY~FKgJdgctG7Q0ejl1e6lUt91D~N1cPwuW64SeuQ52z0Nm0FzsIJA5eg__",
        cookingTime: 20,
        evaluate: "Hard",
        favorite: false),
    Recipe(
        recipeName: "Chicken Burger",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/1070/ad91/9fab35f5cea96371d4e9e5cff3474762?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YXwrqLWD2be17jwEhV9WiTT9okw8tTczQFZx7UWbsKdWbTtBC--Czz5ZRxrWrACNFJWn06R8XVIGLMXfjI57wXV8CacKSx65~ZosaIEMCKeEbcGMctmCWo7xttNiVYMBS8q-DmbNwt7gyu42EyO8N3seebX9E4gbwOF1uxtcrjsQttPqa4TJLcXbx7c1fbItmIvUXmzmcFAEAcLbKQYriWTlHB41OSY7V3MNJsG4Wr5La7VBU2Ibr-rV-DBZafRrvyqVEJFOMuR3Za5eOIf8wm93r9MnvJrAZE7nqyRdq2OOTLdXboZbz8f1xgBIYHj4kSgpykWnYMw-LbS33GrR3Q__",
        cookingTime: 50,
        evaluate: "Easy",
        favorite: true),
    Recipe(
        recipeName: "Onion Pizza ",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/c232/65d1/e2e1c320eb195a0d4c389148d4e13d3e?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VtRiM0eHPr4iFYG5xf48IeqrYFfb~A7yVoFTvwD4Ju25yjeGHhOoFDGtWND~aVRI5zyUgTQeBeWsXLK0U3GrAXA-4erp3Y-JzyX0bNc9d85UBsbz-QdcDWZwMWVPFoZZVW1UsYlsbXAa3eIrPKYr~SAE0u3tiG1~SqKf~CmMt0ZZ4g4r1m9WAO6-LbBmumPcmMXf9uhpahtg4-OOD~3L3iuWcLFVR35xXm08eJABKeHK5UKYiCu6cz3npbcwiMmUylzXkBBG2Mh25rI8OqVPsw89HDOSVBxqj0rEX7YPET884ykze1XxVinRfP8jEGtcmPiwHWwfiuxQN8l9KedboQ__",
        cookingTime: 20,
        evaluate: "Easy",
        favorite: false),
    Recipe(
        recipeName: "Cheery Pastry",
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/be25/ea18/78d801b803c73c3b58c63c4a6b5f9526?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aYqRCBYImV3qOxujLe2ouheC85nEYKzlTMq~xzq9y0sKaZ9VbFgdl8kFPcrhMaK1pA0An4SJXFJ5XpikyzIStk6OFqjArdr0GpFhn-u4PRlVUxJ8LGgbWkLmw~r8FWmZ0nU8IjThLqTtiiBTjFQ4j-dEI2cd9Y7vVhtbmkPkCc~OSGE56w0KdcKdOvd0JDukHQF-x~qLOvoJzmmGTQYa-XkU2nXX~gK0zn4NgOvQk60Lk3nkc35GNVyRxAQGtp66lWCy1kMGLE7zBCcvLDmwnBqmhiOelDTzk1B7aSK1xTBkZMBGdRk06t1VY5YaDoxMQ9v6Xw6-96irIISbRlNhHg__",
        cookingTime: 20,
        evaluate: "Hard",
        favorite: false),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
              flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 0, left: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 23,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            )),
                      ),
                    ),
                    SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 18, left: 235),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primary,
                          ),
                          child: const Center(
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          )),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      widget.chef.avatar,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.chef.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 287,
                    child: Text(
                      widget.chef.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textFaded),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    width: 420,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding:
                                  const EdgeInsets.only(left: 0, right: 14),
                              labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold),
                              controller: _tabController,
                              labelColor: Colors.black,
                              indicator: UnderlineTabIndicator(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: AppColors.textColor),
                                  insets: EdgeInsets.zero),
                              unselectedLabelColor: Colors.grey,
                              tabs: const <Widget>[
                                Tab(text: 'New Recipe'),
                                Tab(text: 'Vegan'),
                                Tab(text: 'Soups'),
                                Tab(text: 'Non-Veg'),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  TabView(recipes: listRecipe),
                                  TabView(recipes: listRecipe),
                                  TabView(recipes: listRecipe),
                                  TabView(recipes: listRecipe),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class TabView extends StatefulWidget {
  final List<Recipe> recipes;
  const TabView({
    super.key,
    required this.recipes,
  });

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 11,
      childAspectRatio: 169 / 209,
      children: List.generate(widget.recipes.length, (index) {
        return Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              width: 169,
              height: 209,
              widget.recipes[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 9,
            right: 9,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.recipes[index].favorite =
                      !widget.recipes[index].favorite;
                });
              },
              child: Stack(children: [
                Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(217, 217, 217, 0.35),
                  ),
                ),
                Positioned(
                  top: 6.5,
                  left: 6.5,
                  child: Icon(
                    widget.recipes[index].favorite
                        ? Icons.bookmark_outlined
                        : Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ]),
            ),
          ),
          Positioned(
            left: 12.07,
            right: 12.71,
            bottom: 8.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.recipes[index].recipeName,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                Row(
                  children: [
                    const Icon(
                      Icons.alarm_on_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text('${widget.recipes[index].cookingTime} min',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ))),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.sentiment_neutral,
                      size: 12,
                      color: widget.recipes[index].evaluate == "Hard"
                          ? AppColors.textFaded
                          : Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(widget.recipes[index].evaluate,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 12,
                          color: widget.recipes[index].evaluate == "Hard"
                              ? AppColors.textFaded
                              : Colors.white,
                        ))),
                  ],
                ),
              ],
            ),
          )
        ]);
      }),
    );
  }
}
