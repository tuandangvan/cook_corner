import 'package:cooks_corner/pages/chef_detail_page.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/chef.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({Key? key}) : super(key: key);

  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
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
                        padding: const EdgeInsets.only(top: 18, left: 110),
                        child: Text('Chef',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 120),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt_outlined)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
        ),
        body: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final List<Chef> listChef = [
                const Chef(
                    name: "Kunir Bassu",
                    avatar:
                        "https://s3-alpha-sig.figma.com/img/5f0f/6b22/5a7b119faa14771e87cf1de6dd6df5d5?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XL97jq2uOY6jPTTaMNn9jM-M9XgpSK~er-5dTmibJmbimqm7whE5l-dmc7dOxaKVr5IVSHGEx3ZMzLQs7LgrA-~yYXQ4BrWV6c44mrcJncAOlgwuL7otEV3uQpZYIA7iz5TUFOgo93GMWRd2Lm16uoE7cXzpEAZfIaMFvAzKhVtRT0ghL1nr1I9ggtlrHGvtswha2LVrH0RFyZGJsXWRHq9IObN89QJAQ8MB~jN16OCvpMvwwQpt3Zmwz6LarehvFOmvWTkBw8NoaInLN13YMnXU~RtB0v1MdJoq3w4XksbnF-00ROnDInWvDB0RdyxnxiG3LoHuL2h4HCGVl0tI6w__",
                    description:
                        "I am a passionate chef devoted to crafting mouthwatering dishes with creativity and care",
                    recipe: 224,
                    rating: 5.4),
                const Chef(
                    name: "Dimpal Arora",
                    avatar:
                        "https://s3-alpha-sig.figma.com/img/15c7/fa99/dbc300ec66161211d62f8a27a8ac3512?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=muZbendlOgQ1B-elWPlQS3~m1voF4q~lC1C3fNxpqVMXyDVI1-8dhoBnNDeXwGGWhtR5tud~iz9InmIA0P9uvsT0pyTcl8dMaVnEeTVUdaP6h2cN9ysAHwJi1HeiNuXSyj7iPAkbOBPznkuHo~9YZlYpEgrCJzARuao8PwAwVxGLZfOg4OIkl6Ef2JSquajksaBpaev5GCy2EadjLv2yw~ksduvRcP1pAlZr7NPKXfdvwOdAme1ggYVGcUrozOXFsDhXPc4gvifieW5O7YS2VzeMGquEW3~AvBspZ0tmdQcRDxBWwGtQi3UqxrB5MGt6fvkfWDqmczNFsBhlw49pJg__",
                    description:
                        "I am a passionate chef devoted to crafting mouthwatering dishes with creativity and care",
                    recipe: 224,
                    rating: 5.4),
                const Chef(
                    name: "Amrila Routray",
                    avatar:
                        "https://s3-alpha-sig.figma.com/img/219a/4aff/e4d68b4d528497bd8d7c41a0d6e7637f?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PNJva6xrPAf6NC1qFN5g~rpRG2i-NyRrdypqjU7-MNiC9ilTTgT5XWKb9NIc9~IsNmoi7iBKQ7FuZbiSilqb3Td9cv13od8rNma0ckHb7BDHLDc0SVvMCn5UkE0PqnWAnxqmTVpBAA18xEUmH0Dh96IeLEZi4lgsmF53WIhlIfEQF03vYTPh2dO2rpWVCTYCeUwIgxQ8Kvq-8rXEJx6dLpL3EFj0aHYs8UNrwZXvyCzdgNLEMelRuO7DZZED~5qwZuou~D0vkOSBZclt-dElyqBVR4AHD5WD1uTwPM-t2sUAQOLkyPUaHh20XoPzxqsdE8agcsRshxQfKfSMSk1LWg__",
                    description:
                        "I am a passionate chef devoted to crafting mouthwatering dishes with creativity and care",
                    recipe: 224,
                    rating: 5.4),
                const Chef(
                    name: "Smita Agrawal",
                    avatar:
                        "https://s3-alpha-sig.figma.com/img/753a/d83a/29cf51918456ab220d6e5f706d7209cd?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RpGYmVu3Y7VlGWB4iK03j~zGMYyoTOBQL4nQZBfZ1PVIojkh2CC7EUdGvWmHbWQ0sawSvntUTnbmiKmxsJuM4JeQqWLEl9DwXTENYxK2RoU8RxbpIFh7a-4UyVbPtVCgEXgzak7fJf4e9MUVSyF5HAaSUq2Y4vsK7gb4iWMja27S5ceL8NfdVcqBefIogBZvfK9s~OLcNHdrMHCiJGVfFknaz109CXZdSmGEwJuuIVWEJCAm-CNWBQmqEOXS39DfJ1NgMXhv18CVBMa2cO8DJDmATAtuMljmY0xLfCvy~EPVgdM3aQNhhNvyi8M24Ps2iYOt3NUkTueCVYzwL7QRrg__",
                    description:
                        "I am a passionate chef devoted to crafting mouthwatering dishes with creativity and care",
                    recipe: 224,
                    rating: 5.4),
                const Chef(
                    name: "Sunil Purohit",
                    avatar:
                        "https://s3-alpha-sig.figma.com/img/f778/f15d/e15ec96cc261465fdb8b34279089b06b?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VX9Y8Ncn6niiHmIqnKkduyu5QkW0ekrGcqVRaUTIbbj90P1KptTz3DNtR2kequCQ~keg2ukzE2H~u7SJIkswv82nWelcHQJ9i5Vripd9NVQxEC2R-9mC8noB7pTMVg67pLMVLPV5IevTH-rhuS0ATel4qZ2LkhxG0vInsSuDQ2n9Z4ztt2PaC2zAETmX3r6iOngqOxIARRrgbBXrQaWx~YwvCwAU~F1Oa5QRE1WB7nC~lMKajdPM-7h~sgecmsVVy~tMy-5x1BgQN~Ro6ydR-pCVS7q0hry6N517ve8oqEkY5lcJ8eIqKx05XmnCUGVWFqbvhsjf-qvjCjYNgn6lzw__",
                    description:
                        "I am a passionate chef devoted to crafting mouthwatering dishes with creativity and care",
                    recipe: 224,
                    rating: 5.4),
              ];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChefDetailPage(chef: listChef[index],)));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                    width: 353,
                    height: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 15, bottom: 15, right: 14),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              listChef[index].avatar,
                              width: 100,
                              height: 116,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listChef[index].name,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )),
                              const SizedBox(height: 6),
                              SizedBox(
                                width: 202,
                                child: Text(
                                  listChef[index].description,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textColor),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 9),
                              Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.bookmark_fill,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("${listChef[index].recipe} Recipe",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.textColor),
                                      )),
                                  const SizedBox(
                                    width: 39,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(listChef[index].rating.toString(),
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.textColor),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 11),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 209,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.primary,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Subscribe",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
