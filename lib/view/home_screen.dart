import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/modals/JuzModal.dart';
import 'package:quranproject/reprository/Surah_repository.dart';
import 'package:quranproject/utils/para_widget.dart';
import 'package:quranproject/view_model/JuzViewModal.dart';
import 'package:quranproject/view_model/surahName_viewModel.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  SurahNameViewModal names = SurahNameViewModal();
  JuzViewModal juzInfo = JuzViewModal();

  int _bindex = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    //fetchData();
    names.getSurahInfo(); // Assuming getSurahInfo() is an asynchronous method
    setState(() {});
  }

  void fetchData() async {
    await names
        .getSurahInfo(); // Assuming getSurahInfo() is an asynchronous method
    setState(() {}); // Update the state after fetching the data
  }

  @override
  Widget build(BuildContext context) {
    final JuzViewModal juzViewModal = Provider.of<JuzViewModal>(context);

    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      backgroundColor: Color(0xffDAD8E8),
      body: ChangeNotifierProvider<SurahNameViewModal>(
          create: (BuildContext context) => names,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(19 / 360),
                        child: Image.asset(
                          "assets/menu.png",
                          scale: 3.0,
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      const Text(
                        "Quran App",
                        style: TextStyle(
                            color: Color(0xff672CBC),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      RotationTransition(
                          turns: AlwaysStoppedAnimation(22 / 360),
                          child: Image.asset(
                            "assets/search.png",
                            scale: 3.0,
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 12,
                  ),
                  child: Text(
                    "Assalamualaikum",
                    style: TextStyle(color: Color(0xff8789A3), fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 8,
                  ),
                  child: Text(
                    "Tanvir Ahassan",
                    style: TextStyle(
                        color: Color(0xff240F4F),
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    RotationTransition(
                        turns: AlwaysStoppedAnimation(19 / 360),
                        child: Image.asset("assets/Frame 30.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Consumer<SurahNameViewModal>(
                          builder: (context, value, _) {
                        return Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RotationTransition(
                                    turns: AlwaysStoppedAnimation(19 / 360),
                                    child: Image.asset(
                                      "assets/cib.png",
                                      scale: 2.0,
                                    )),
                                const Text(
                                  "Last Read",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              ],
                            ),

                            // STATIC TEXT
                            InkWell(onTap: () {
                              setState(() {
                                _bindex++;
                              });
                            }, child: Consumer<SurahNameViewModal>(
                                builder: (context, value, _) {
                              switch (value.surahnamelist.status) {
                                case Status.Loading:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case Status.Error:
                                  return Center(
                                      child: Text(value.surahnamelist.message
                                          .toString()));
                                case Status.Completed:
                                  return Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          value.surahnamelist.data
                                              .data![_bindex].name
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 33),
                                        ),
                                        Text(
                                          "Ayats: ${value.surahnamelist.data.data![_bindex].numberOfAyahs.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  );
                              }
                            })) // STATIC TEXT
                          ],
                        );
                      }),
                    )
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        controller: _tabController,
                        //dividerColor: Colors.black,
                        unselectedLabelColor: Color(0xff8789A3),
                        tabs: const [
                          Tab(
                            child: Text(
                              'Surah',
                              style: TextStyle(color: Color(0xff672CBC)),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Para',
                              style: TextStyle(color: Color(0xff672CBC)),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Page',
                              style: TextStyle(color: Color(0xff672CBC)),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Hijab',
                              style: TextStyle(color: Color(0xff672CBC)),
                            ),
                          ),
                        ]),
                  ),
                ),
                Divider(
                  height: 3.0, // Adjust the height as needed
                  color: Color(0xff8789A3), // Adjust the color as needed
                ),
                Container(
                  color: Color(0xffDAD8E8),
                  width: double.maxFinite,
                  height: 250,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Consumer<SurahNameViewModal>(
                          builder: (context, value, _) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: value.surahnamelist.data.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Stack(children: [
                                Image.asset(
                                  "assets/counting.png",
                                  scale: 1.0,
                                ),
                                Positioned(
                                  top: 22,
                                  left: 21,
                                  child: Text(
                                    names.surahnamelist.data.data![index].number
                                        .toString(),
                                    style: TextStyle(
                                        color: Color(0xff240F4F),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                              title: Text(
                                names
                                    .surahnamelist.data.data![index].englishName
                                    .toString(),
                                style: const TextStyle(
                                    color: Color(0xff240F4F), fontSize: 20),
                              ),
                              subtitle: Text(
                                " ${names.surahnamelist.data.data![index].revelationType.toString()} \t \t ${names.surahnamelist.data.data![index].numberOfAyahs.toString()} VERSES",
                                style: const TextStyle(
                                    color: Color(0xff8789A3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                names.surahnamelist.data.data![index].name
                                    .toString(),
                                style: TextStyle(
                                    color: Color(0xff863ED5), fontSize: 20),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.teal,
                            );
                          },
                        );
                      }),
                      // Consumer<JuzViewModal>(
                      //   builder: (context,value,_) {
                      //     return ListView.separated(
                      //       shrinkWrap: true,
                      //       itemCount:value.allJuz.length,
                      //       itemBuilder: (context, index) {
                      //         final JuzModal juzModal=value.allJuz[index];
                      //         return ListTile(
                      //             leading: Image.asset(
                      //               "assets/counting.png",
                      //             ),
                      //             title: Text(' Al-Fatih'
                      //             ,
                      //             style: TextStyle(
                      //             color: Color(0xff240F4F), fontSize: 20),
                      //         ),
                      //         subtitle: Text(
                      //         " ${juzModal.data?.number} MECCAN \t \tألْفَاتِحَة 7 VERSES",
                      //         style: TextStyle(
                      //         color: Color(0xff8789A3), fontSize: 12),
                      //         ),
                      //         trailing: Text(
                      //         " ألْفَاتِحَة",
                      //         style: TextStyle(
                      //         color: Color(0xff863ED5), fontSize: 20)
                      //         ,
                      //         )
                      //         ,
                      //         );
                      //       },
                      //       separatorBuilder:
                      //           (BuildContext context, int index) {
                      //         return const Divider(
                      //           thickness: 1,
                      //           indent: 10,
                      //           endIndent: 10,
                      //           color: Colors.teal,
                      //         );
                      //       },
                      //     );
                      //   }
                      // ),
                      // Text("Sojsdfalf"),
                      ParaWidget(),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              "assets/counting.png",
                              scale: 1.0,
                            ),
                            title: Text(
                              " Al-Fatih",
                              style: TextStyle(
                                  color: Color(0xff240F4F), fontSize: 20),
                            ),
                            subtitle: Text(
                              " MECCAN \t \tألْفَاتِحَة 7 VERSES",
                              style: TextStyle(
                                  color: Color(0xff8789A3), fontSize: 12),
                            ),
                            trailing: Text(
                              " ألْفَاتِحَة",
                              style: TextStyle(
                                  color: Color(0xff863ED5), fontSize: 20),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.teal,
                          );
                        },
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              "assets/counting.png",
                              scale: 1.0,
                            ),
                            title: Text(
                              " Al-Fatih",
                              style: TextStyle(
                                  color: Color(0xff240F4F), fontSize: 20),
                            ),
                            subtitle: Text(
                              " MECCAN \t \tألْفَاتِحَة 7 VERSES",
                              style: TextStyle(
                                  color: Color(0xff8789A3), fontSize: 12),
                            ),
                            trailing: Text(
                              " ألْفَاتِحَة",
                              style: TextStyle(
                                  color: Color(0xff863ED5), fontSize: 20),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.teal,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        //iconSize: 40,
        // selectedItemColor: Color(0xff672CBC),
        // unselectedItemColor: Color(0xff8789A3),
        type: BottomNavigationBarType.shifting,
        currentIndex: _bindex,
        onTap: (int index) {
          setState(() {
            _bindex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            label: "1",
            icon: RotationTransition(
                turns: AlwaysStoppedAnimation(17 / 360),
                child: Container(
                    height: 50,
                    child: Image.asset(
                      "assets/quran.png",
                      scale: 0.1,
                    ))),
            // backgroundColor: Color()
          ),
          BottomNavigationBarItem(
            label: "1",
            icon: RotationTransition(
                turns: AlwaysStoppedAnimation(17 / 360),
                child: Container(
                    height: 50,
                    child: Image.asset(
                      "assets/light.png",
                      scale: 0.9,
                    ))),
            // backgroundColor: Color()
          ),
          BottomNavigationBarItem(
            label: "1",
            icon: RotationTransition(
                turns: AlwaysStoppedAnimation(17 / 360),
                child: Container(
                    height: 50, child: Image.asset("assets/praying.png"))),
            // backgroundColor: Color()
          ),
          BottomNavigationBarItem(
            label: "1",
            icon: RotationTransition(
                turns: AlwaysStoppedAnimation(17 / 360),
                child: Container(
                    height: 50, child: Image.asset("assets/pray.png"))),
            // backgroundColor: Color()
          ),
          // BottomNavigationBarItem(
          //   label: "1",
          //   icon: RotationTransition(
          //       turns: AlwaysStoppedAnimation(17/360),
          //       child: Image.asset("assets/bookmark.png")),
          //   // backgroundColor: Color()
          // ),
        ],
      ),
    );
  }
}
