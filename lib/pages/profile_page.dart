import 'package:cooks_corner/models/recipe.dart';
import 'package:cooks_corner/pages/signin_page.dart';
import 'package:cooks_corner/theme.dart';
import 'package:cooks_corner/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
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

  Future<void> forgetLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: AppBar(
            flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        )),
                    Text('Profile',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    GestureDetector(
                      onTap: () async {
                        await forgetLogin();
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigninPage()),
                        );
                      },
                      child: Image.asset("assets/images/filter-svgrepo-com.png",
                          width: 24, height: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/8422/2e72/d307d6a0d8c04215255375826bda969c?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dUZDf1nC0DxmQUHs-13dFVkGDQI5HrsQIjIFDiI-Wetui7c3c7dwOmQR1RevUspVtOj-mpxDpcRyIKH4i9Jdr9p~t9ZlL4buYKKdA36Uz1Ml2C~QPrigY~VJBIcmM2MZ42MCFSUhD9XexcVwMkJfZ4YKZxoO1pSaVT4AAPmQG373iYNyG7QHJmd1Z062UQ8qqBKDBHmLpRgf3GW~Z-e6OwMEtWc0BS6GIg3hsjGBJfX8mC3YIfURO0sPVKvDTX5cSUtthQYf4pFxedOQjIA5y1zQRjVxpEZECG59IkJ6hppNp6mfUbaibIr7gnbyaQ36LRDSuMbqNb0vUVvB1mXTtA__",
                        width: 88,
                        height: 88,
                      ),
                    ),
                    const SizedBox(width: 28),
                    Column(
                      children: [
                        Text(
                          "29",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),
                          ),
                        ),
                        Text(
                          "Recipe",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textFaded),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 17),
                    Column(
                      children: [
                        Text(
                          "144",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),
                          ),
                        ),
                        Text(
                          "Followers",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textFaded),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 17),
                    Column(
                      children: [
                        Text(
                          "100",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),
                          ),
                        ),
                        Text(
                          "Following",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textFaded),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Sarthak Ranjan Hota",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor),
              ),
            ),
            const SizedBox(height: 5),
            Text(
                "I'm a passionate chef who loves creating delicious dishes with flair.",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textFaded),
                )),
            const SizedBox(height: 10),
            Button(
              text: "Manage Profile",
              backgroundColor: AppColors.secondary,
              width: 353,
              height: 37,
              borderRadius: 0,
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.only(left: 0, right: 14),
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
                      Tab(text: 'My Recipe'),
                      Tab(text: 'Tested recipe'),
                      Tab(text: 'Saved recipe'),
                      Tab(text: 'Cookbook'),
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
          ],
        ),
      ),
    );
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
                      Icons.visibility_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text('${widget.recipes[index].cookingTime} view',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ))),
                    const SizedBox(width: 10),
                    const Spacer(),
                    GestureDetector(
                      child: const Icon(Icons.more_vert,
                          size: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 9.1),
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
