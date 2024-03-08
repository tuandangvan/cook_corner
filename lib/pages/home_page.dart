import 'package:cooks_corner/models/category.dart';
import 'package:cooks_corner/models/live_cooking.dart';
import 'package:cooks_corner/theme.dart';
import 'package:cooks_corner/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final faker = Faker();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        preferredSize: const Size.fromHeight(126),
        child: AppBar(
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background_2.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 21,
                right: 20.5,
                top: 57,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Hi,  ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sarthak\n',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'UI Designer & Cook',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Avatar.medium(
                      url: "https://s3-alpha-sig.figma.com/img/8422/2e72/d307d6a0d8c04215255375826bda969c?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dUZDf1nC0DxmQUHs-13dFVkGDQI5HrsQIjIFDiI-Wetui7c3c7dwOmQR1RevUspVtOj-mpxDpcRyIKH4i9Jdr9p~t9ZlL4buYKKdA36Uz1Ml2C~QPrigY~VJBIcmM2MZ42MCFSUhD9XexcVwMkJfZ4YKZxoO1pSaVT4AAPmQG373iYNyG7QHJmd1Z062UQ8qqBKDBHmLpRgf3GW~Z-e6OwMEtWc0BS6GIg3hsjGBJfX8mC3YIfURO0sPVKvDTX5cSUtthQYf4pFxedOQjIA5y1zQRjVxpEZECG59IkJ6hppNp6mfUbaibIr7gnbyaQ36LRDSuMbqNb0vUVvB1mXTtA__",
                    )
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CategoryWidget(tabController: _tabController),
          ),
          const SliverToBoxAdapter(
            child: LiveCookingWidget(),
          ),
          const SliverToBoxAdapter(
            child: SeasonSpecialWidget(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}

class SeasonSpecialWidget extends StatelessWidget {
  const SeasonSpecialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Seasional Special",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                    style: TextStyle(fontSize: 14, color: AppColors.textFaded)),
              )
            ],
          ),
          SizedBox(
            height: 124,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                final List<String> images = [
                  "https://s3-alpha-sig.figma.com/img/b031/cc7f/633f762b660014f74e917678a675d5e2?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CBAFj6QJZDF76jxJvA7xVQFyvi6X2D5tAL08YM4iKiBApR9as5H9xVgDPiQ3YFVTmcz0a08Kw34Dw~DWURZ7S~WOqyF76tQzeEiTiabENBrEHFsSB6vo~298SpXVXHSGspdUepTSjAalPdJr-qYJst55ymjSC0KDq1UA~-SfZCca5q3GYJtFnU46qydwU5VYQdO2oHw8E9vZp3H4ayx1EaeEVJCmVHQJFEGEzmoNE8oKP9ubXddnKUCQB3TdNtfUDyvlWFQGSpgMmKyMlG-kpYBAs10~wC4HJ7RlocrEGIcPpD-F8LYBNDX7v1SeGuEtV4L~MAZvrBP1S-6fa9cT5A__",
                  "https://s3-alpha-sig.figma.com/img/22cb/c6e2/e3a6c1f91b38a0626dd44970728e9b3d?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AMoUSJOQYY9paULF85wP1Bt2sGFpZMOXyqHL75NRgbwyTqj~qhxS9dA1Xw3JamjjJ6mFR-JiwcYXNStW5hJ8XyJB-7ynJ2vm7b84hr0~3mMCmnJVDsFTJ5MMiuUTcKUwt0KOqxxdN0Ddkx5sHowpso1Q9yyAE87~oaYRPq9YRSl5-PNzqeo25eGrJMBy1KilG3QhzwQ-9DMqvLL78D8XZG9DLVSONOrumsFbZveoKayE9o8DziFiscnEBJ~5P9pA0QS8182~b6bfF0JimkpVz4Bfk8EQ~C9-3kN3VLnxBrVTYRWv~Y-nRsPP2RXU7NIYdicdDD9JRbdlzrBsq1NjSA__",
                  "https://s3-alpha-sig.figma.com/img/b9b8/8938/2d9da96d533e89d2f039307de713af6c?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QndzayzChHhjDH-TlEANENUVLEAbwLOmM4HLuHoWs4yD-~Ptjp30FQ2qq1jRwTSXhI2yEfNXPjWjABXf0LJ8RVdjuhmMNlRd175vWkYwDrKfGDz2yVyuEC78LRoz~~UxmtTjsZe69k96YqZE5lYvFdL8J5aNB1y6z73RdtXiDXm9aT4Z0Is6DUBiSDInBO29yuvsLZbbLtD3AEOTD4mjQZnyXVoLKSS4Z74ojNHcWMs-vY9gIvQlyJtF~Y8~BFD81nHdJRo9n0zJttrJmxE05~E9Eb4TbLNQvUe2u3S9O2aLFRLXpwK9ori-p8dJnXq4-9PRjLhymT5lgWq7q2r1Xg__",
                  "https://s3-alpha-sig.figma.com/img/016d/f490/25b23dc3934363dfbd123c9fb8120a21?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hKOZXdSwpmQGbrHKAIrEPJM85nqySVPhNW7xEplN2xhNvkmNwydA0U8K1iW5Py199z7pipaVWWyvbElXGQBDBH31TCl5QtXSnUvw9JLFWx5uJMR5zQp1pWI-UHjhdGORTZiHtuDavlyoXX5qCJ8vGKAz3g8fMpFaaoMybS25POfD0J4MMVjTQgNdxsJUJqmzn-pUrOY26r0dhc5Y1UdPsE4wIFOHIHvHRIwDtr1ML5H87ox0N1SC-Fh-8EJKI9M~hXp0-Tob5eLKaMQNqaC30gJqO45uoyr4UfGEFM3NHetBO9K6Xi2XgmKGIJP2~6yScrZfLHw4Y4nT4OAF6tIkvg__"
                ];

                return Padding(
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  child: SizedBox(
                    height: 112,
                    width: 85,
                    child: SeasionalSpecialCard(
                      imageUrl: images[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SeasionalSpecialCard extends StatelessWidget {
  const SeasionalSpecialCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.5, right: 10.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LiveCookingWidget extends StatelessWidget {
  const LiveCookingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Live Cooking",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("See All",
                      style:
                          TextStyle(fontSize: 14, color: AppColors.textFaded))),
            ],
          ),
          SizedBox(
              height: 124,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    final List<LiveCooking> liveCookingList = [
                      const LiveCooking(
                          name: "dimpal Arora",
                          avatar:
                              "https://s3-alpha-sig.figma.com/img/15c7/fa99/dbc300ec66161211d62f8a27a8ac3512?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cSzKf8mze2rwMpD0QuyDK4sM3qwlgwifJNwEs-WrO9y6b3e8e-HetJQvJ5TelQgHvBQ2W8Wo4ck~1IBlKZuekxiQtGjiGdwc7wbtydd-GIXCCBoyExpiksP72gc-VY~pueZftrp0uPZkBbPASLbz9xyAw0dW8lzucLKJgEMuAgg1zeEQTxluxg6vPx9DGVJlgVcgDGZiGyRpiyrt63ExqbnAYaO1QeX4KhxJh~4ow1RDO4ixHiZTEq5lMUujf~yqLeSzIZ4XA0bcLt2B0rlmE4aQ3RMYcjZbOJxrQZv-txySLesfohAxk2l6fRjdyAPgWT-YzHDEAS5a4dZze89h4w__",
                          recipe: 224,
                          url:
                              "https://s3-alpha-sig.figma.com/img/853b/790a/a5dd39d52066f67e10374aac5a50a196?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eH5Kw1qCd-qv-iOdX542yDCxM9dIRCkLYONCt75D6Vv35~1q5xozrYPM58qwc6MgIYO-fme-7em1ShR5fH~gWTymECM~vOHQ5p0HCVvjwYCPBM3snro5tJL728bL1cgIHViYawRFk29hIfhzqfQE~EasU2PFmp8Cpxx0vQ1gdpJPZ1q~wPoyStMjc-~ETBwdLHJqCb~N2wj8bNo7cGTn~5vaVPBxDBuR6MLszDBHqiFwCAix8-WobcIzlHSQvZ9XjSdEguauq3knkSUkTtcX-iSFbkljHhnYOgrstBl7zI084S1bQck60NKyYSwzLzxCfm91eB272teVqaiUhjgIVg__"),
                      const LiveCooking(
                          name: "Kuniar Basuu",
                          avatar:
                              "https://s3-alpha-sig.figma.com/img/b74a/5c30/92ef00b5a8fd6342a42f8c81406f7d70?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MiNfLth9P6Lzif7UDRQzo0eMI1zjNa15rYqWHI-o-AHukXRrLCfxBaXSAxoaEt4ekjY~sfznHfmKKbnD6BGJ~uC7P3qZU9~m8KYyKLoggF44O2~OOVmNojcSdYuECzSn1yzaPlvrsWrPEn1-MvoHily9VeVwgCLqIKCAb~Hzuib3sdJxlCIH46sAeO-AooNkLvkVOgGS2b82LXife3aPWKyibjplFm4zojTE3jsn13pg7u8TjF0OP~VWCgpNWRbzyM4HdUE0hhSZGfLVqwghGEDD1Y3XZ17q-IPQ5AQ~4ixItzXxpPQljiVC9XE41B9SPjswYVHV~M9WOK08FkojfA__",
                          recipe: 118,
                          url:
                              "https://s3-alpha-sig.figma.com/img/b008/25b1/43f80cce2c49ab1d0d00cc24a4ea6714?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aMLwj0vwrgdA4K5-QnkWyl~3UkPg2JaorFgVNX5Zu2DsF4XRhpmbKbOhHAl2tiZsbVCueCLk4JgJCQF~aCpeevlcgETWlW4bQAOgju80pOmuzviLk2wci~NOEMK5DcEuxtHGAHy6LqDtY79hTozOAtaCEwoTDdp0rlwSOE5Ik27divwviQdq7RM-NSg1HZFEbtIOQr~hg-zfgq3iP9ApOZPyqflA95YX4F1ifMweGJMeUAEYk2A3PUhJ7sKjL2GFCoUuybI2wDo6-UBEjf9F0XACIecH4LvIEkgHzVJ3~YbxkCsXvY6Fq6W0iNJOMhntmOEqpLUR800yj5PEu189yQ__")
                    ];

                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        height: 124,
                        width: 229,
                        child: LiveCookingCard(
                          liveCookingData: LiveCooking(
                            name: liveCookingList[index].name,
                            avatar: liveCookingList[index].avatar,
                            recipe: liveCookingList[index].recipe,
                            url: liveCookingList[index].url,
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class LiveCookingCard extends StatelessWidget {
  const LiveCookingCard({
    Key? key,
    required this.liveCookingData,
  }) : super(key: key);

  final LiveCooking liveCookingData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, right: 8),
          child: SizedBox(
            width: 229, // adjust the width as needed
            height: 124, // adjust the height as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                liveCookingData.url,
                fit: BoxFit
                    .cover, // this is used to tell the framework how to inscribe the image into the box
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Avatar.small(
                url: liveCookingData.avatar,
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      liveCookingData.name,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${liveCookingData.recipe} recipes',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: 23,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: AppColors.primary,
                      ),
                      child: const Center(
                        child: Text(
                          'Join Live',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5.5, bottom: 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Category",
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(fontSize: 14, color: AppColors.textFaded),
                ))
          ],
        ),
        SizedBox(
          height: 306,
          child: Column(
            children: [
              TabBar(
                labelStyle: const TextStyle(
                    fontSize: 14,
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
                  Tab(text: 'Breakfast'),
                  Tab(text: 'Lunch'),
                  Tab(text: 'Dinner'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    CategoryTab(),
                    CategoryTab(),
                    CategoryTab(),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        final List<Category> categoryList = [
          const Category(
              categoryName: "Cheery pancake",
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/df8e/2349/821fded33fcdf2c362d805ff3beb29ea?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LemovKy6jHWE9V7BNaffObfA6uchNURvm0MbphNNE4eq9Re4lbDYKluntxj3De~kVsxeMlUWdn3WTjXyqvwccxfXDWU1oHvNQg0yNzcOZTOK9Ebh-jLqdeOeNZUZqWUPwfDOksIskq6I~Na82N1Equ6W7RQMyh-bvoenwmDPmCzvNuoM6MWKDlTbRjKGZZtfLEusxEY-p7FAXOCXXy6ckiuvkXcP6posiLTx6Vt2QHvSZEvi8-Flt2pupNDMIbWcWT4Dm~K1mXnS42Ok-zaPYHadkOV-4TdX0DArnhcJCmfTFKVi1XKyRuz6DYfGIec8Z5nVjREGFpkHiSdbPc7J2Q__",
              cookingTime: 20,
              evaluate: 'Hard'),
          const Category(
              categoryName: "Cheese Roti Burger",
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/dc99/a242/01e9c4d642a3998217a15130fc036af9?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kCFP3eLUkau4Y6BqIaLqG2zyZ5ET2fy1AzbuqjuVoqAvNoSMAZXu~qeUqcKf3NmH7NFv40MTWZzx9ZlQj7bALTyZuu~NXvy~mtYiTV2ilaXgqxdIjqeal1lnIBmKLe4bPHM~Cw71uQjFvPCYWSG6HaxnrbnAmVAOIkbXhxGfY3yqzq-ZwXGNJbVz3kwxQtM8ludTRVbe8GxVr~CAXZPdZEWTMRijjTbBMK9hrw94SgLX0L3l7OGJuaMSHLaG9ZcHLuxUKBWW1B29QjMuQeS2~dhjX-ieNTaG-GQt6SlaluYaVjNNIlj4fOWvEauEdpXzSD9x-mWkF~pGzK0-YWptsQ__",
              cookingTime: 60,
              evaluate: 'Easy'),
        ];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 272,
            width: 204,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.secondary,
            ),
            child: _CategoryCard(
                categoryData: Category(
                    categoryName: categoryList[index].categoryName,
                    imageUrl: categoryList[index].imageUrl,
                    cookingTime: categoryList[index].cookingTime,
                    evaluate: categoryList[index].evaluate)),
          ),
        );
      },
    );
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
