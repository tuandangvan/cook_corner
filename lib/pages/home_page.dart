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
                  "https://s3-alpha-sig.figma.com/img/b031/cc7f/633f762b660014f74e917678a675d5e2?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=f4S9lFaMM8wvHgqU2dmV7vw5Cs8ekD0o1PEw8XzONBcyJIiuLDFTjhaEt1N-HKM5sTCfKH12~cfW783Io4ETFYBHOwI9DmdHuUyarLAKbrAsfMcEu5GsTF~KzfgExQt6pDAsHtAdRn0-PhDmRVmqzzZtCB60hbe1vZB4TskbTHon48C2rCKKE~tFv~deTUmsgnjDGBi2FTcCmlLzmtPk6GS6Nbh9wwSlbNuLtDw1j7M6HhAo4xQFttHdMFbid6oGQHSUmNugR2tQma3n3jY55p86~A-kN75qxqvJS4~yQ-XYBgXff~~jFjuJD6sUCjBl-CIaLq3IDmNNtSOIHyZ7MA__",
                  "https://s3-alpha-sig.figma.com/img/22cb/c6e2/e3a6c1f91b38a0626dd44970728e9b3d?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Cs5AQ~Ooxio4V9T70JL0uGF6wkD3oBj1fi8ZZ7H-VHxluETziAy7nrY1~5ZTzDKNpZETnzQb~HpzkuATWWVOJnpTIdWuiQW~rdX0N6BM-9G3WDteaXAqbiyVGRXuM7LO5C2uiIPf19-6tBd4-FbC0V8EdIt70vZxEBRbV252bZVPVKRPQyhyu8XO0DQhYcX7eRvKamaMtXKvV9MnaoCYEwqVbvZqxgP21CxwSQqK5eP5UvA~Am13CHzZad5LVTOutHnhfI9EIwH9BYbpPkLDxABlCBAylO3GJIKOH3cgoSUmKGGKV5UElyFEYx8-NEVQKNp3RybQJ64NeEIkV7WXWQ__",
                  "https://s3-alpha-sig.figma.com/img/b9b8/8938/2d9da96d533e89d2f039307de713af6c?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=clzRtzupISt8FdoJ4SryhQyKtAKMoVq1Z8vMvn2mFP8ynZAMMO0Om8KFgc2hHSpbEZaImhsTkx~~OwFuSytoFFVQ-hOc741jNkt6ePA7h16WIp8EKe7h8IOuek43kJkf61Nusol5mR3z-Bl71tp4C1DaQu9WIgJJg9Q95UQjvX2Nlw7Wl5B0PVOGFXlXHNDhSBg1DVGzjKxBW9JPEwMlcBX1UZ-PNoDLhKIiSlAoK3UxSN167bcqgDy-I0nd-hNLXWN-32eedPLwg2EvQQVyLV2Cr5kaNFfZIrC8Z4I-sa0eKO9PZkrZ74V5SB8LpTZUTcbRC2oN~BJ3-F4t1tF~OQ__",
                  "https://s3-alpha-sig.figma.com/img/016d/f490/25b23dc3934363dfbd123c9fb8120a21?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mwXwaobMRvN1jaNU-tnBZfVmj1pPgr1u8gf9B8tYkfY-ERJlPBqcddQHM86oF1bpsVn6RMkRbX~0apq7gGKkCgaqPERnEv4r21aNN0IV1pkXpZGInEQHEPhY6PTUXDxTs624PoGHcaY6zq3Lu0lMJYnoXoaXligbeuTwESB7ygD~7NjgtdRwte5n8phKQL8U6LAU8PLji3L6DJIcR7RtFZZ0WH0c521yruFM0pkwwLe3DKH3MaCidlFbT9Sa3uywCrHrOs6jvvQUwbopsk3WE~e8laJNWmtRAmwQ4nq1OvKJlKDAOU8rnXCqv-eWFJ-vDR2h9Z1m5tnUdSfBGmohjA__"
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
                              "https://s3-alpha-sig.figma.com/img/15c7/fa99/dbc300ec66161211d62f8a27a8ac3512?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZZJC2WM5xr3y00a~S2YeG-OrGOvy3TXrrhVw2j7RFuRbyBqcR4fGGAAPNjFx6b-WaW-8vaUIddquY0fVY8ofqDXk9N8DEidDWop55hNaN4QDuU07TqwYSfs2k2Wj0bhu~ztrpjFGDFVSRaXkDCubsZ298EP8adAtM0Uk7nxsHGil7N3SlTtlX2lKz0bb2gk2pvU~JjfnyrnsIw1S9mJkZiMZ7OuBPwOVev6PNuVcjMZ2nmRFkFD7QI9nbP-2MV5J4BPzsEF5hxtQ7OdL52Pb7i4D3AqSe3bRJzq2PKQo~-5okO3ORXjeyEovvyo3u1C~ZEzX3dqExWIKX-Csy31cUQ__",
                          recipe: 224,
                          url:
                              "https://s3-alpha-sig.figma.com/img/853b/790a/a5dd39d52066f67e10374aac5a50a196?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fRr~2clol7hRdZOAz-oS9h6MSS6WPaqy9MdHBFdu9CoS2qVhGH9RiRTGqdhbi8j3Xt2wUlUzKL-hOHMyl2PxqS~NjSfSEC0ZknWCBE34Of39XN5JMApfoc2Z8M3bz6rFQA-SU9Ov85I0YgnEuqPu6YxeTnEh923CdEzuZsy8~oOB35cusp5mQGttagRcDPSB5OUMsT2J8b9G4cbPGuBrBE6NbSecGVxouq7VZoCvP2PQp0LsWhSdjrgIfzUFaicnjM6tVm4OISzipECLKvYpUbt8i~mNQMDJ8GNbKmj2rKA7NRTf23NDlb8D8FGVh5kKTRDdrzsTxe3jzqyZ-jkPmw__"),
                      const LiveCooking(
                          name: "Kuniar Basuu",
                          avatar:
                              "https://s3-alpha-sig.figma.com/img/b74a/5c30/92ef00b5a8fd6342a42f8c81406f7d70?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AppjuZ1SDhsO3bRAOGF~CGpEEFOxSndBgs4miwO5HU2D3xTt7UvIIqtjY03L-Lmr4SdkU02fUbZB8Kwdey9BEVDb66Rfe0d1IK6LsASKHfXYs8N0gsnezGQDsAX9fbs3rJs6Nj9incu0l040rJiRCBZlBnDZI~xsg03HOb2N3T70TuqoxOLpwKBXNbOYrw6XO92I5RSiaX2AmA5D~Uy6VRx3gMDjA-ri19pRYjEIbUKhN9QY-3-N6DDni55SZ7ho~8SNjcN4jLbBH7Vmsn7QVgzGUrYP6ntM9CZa7gwnDWbUPJTrf9M7-kvwTTVgnBp543NZOkvnNfoarj0hxPmKUA__",
                          recipe: 118,
                          url:
                              "https://s3-alpha-sig.figma.com/img/b008/25b1/43f80cce2c49ab1d0d00cc24a4ea6714?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jusVXndLnyIM9ge0hzRxOSVN~dW2PScf6CKP7RQgsxwG8ih~esOpw-byeVMYyAPGkh1N5AniaHAqexVTjuaQYc9Hh88~u9sTQyokDKc5p-2i8scSw1VPteih0pIlFnRF3BZ1xczTZEQf-TiAeeimDH3z6xiuDAOF1zT~32Tus-mcc1NVj9t0o4iqtDRjiEQHJvfZr-2eJq2qIC96RkyU4G3lsP9APVJr7RPj1OV8ifvxImcuAxHXuPbe7qyDhaVVF60CaE4qrYp-fXV4VLRbdF~odtOBUuVYIBV5fwylK6bmEKzms3gbRF1GHDFj3Jc-Xzg3yCkzRAPe6nxgKj1rYg__")
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
                  "https://s3-alpha-sig.figma.com/img/df8e/2349/821fded33fcdf2c362d805ff3beb29ea?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eyKe3471i16LWhC~3Tygu0QHmuB~3UIEV08bfA2Z0ztQ~T9zKcK7Eb6tXFoB9d8THW8NTHE1O-fZMufNa9iFop2K9xuP9oPKxsR7Nw3AC4XsHOkicMrioe0mi75wDVGH9IpRmt1xRXwhUGVmeS4czg1enxFRD2tWySnGQHi6KKtJKIo1peEoprIh0pyCV53mHvPCf-D-qGqBPciYDxgPFfSb8k2dP9u0DXrLdxeXifcHxjx~ZeNvke9hyQC13ItynvAtj96xS4aAyyonZtQJc9TjhEKEvesTWMjX1DVZrJ6cRal6JMH1hWjrmwlsibyfPpDK0mXJx35vmO3NWtHTqQ__",
              cookingTime: 20,
              evaluate: 'Hard'),
          const Category(
              categoryName: "Cheese Roti Burger",
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/dc99/a242/01e9c4d642a3998217a15130fc036af9?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qEvEe-Cum643o2RHJfC9uxwRl5JWs3V6wGNCdgPA6ibvrejPV7e7Pct8~fjMin6g-bST6u6gSfTKhCr9FRBZ7sXiH3muXOvdqjo8vKrDhsb9TMXMeeCJJOi8mF9lA9ZHAAMB4qmz7y2PDh55FWiilum3bowZdCWx8dJOKf5FpfnluVr8ubVEJFqrtxixk4tJc1ZudoelDfWkHKNViIO~s3dLirnq0pPGdgfwGstMRFcz6Fx5GFg4XrBFfkegCf3xTsVufEudztc-RvmvaOr5DbxXELRaPYWYYe7e1DNUqfR686T6QbGW2i01xOAsong94IClhV~WPLUl8CHnsnY0Pw__",
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
