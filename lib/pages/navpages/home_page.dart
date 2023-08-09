import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

import '../../cubit/app_cubit_state.dart';
import '../../cubit/app_cubits.dart';
import '../../models/data_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //tabController

  late TabController tabController;

  //Controlling tabController

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  //.......

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //Menu And profile image

          Container(
            padding: const EdgeInsets.only(top: 17, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Discover Text

          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const AppLargeText(text: 'Discover'),
          ),
          const SizedBox(
            height: 10,
          ),

          //TabBar

          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  const CircleTabIndicator(color: Colors.black, radius: 4),
              tabs: const [
                Tab(text: 'power'),
                Tab(text: 'Inspiration'),
                Tab(text: 'Emotions'),
              ],
            ),
          ),

          //TabBarViw

          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [

                //1

                Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: BlocBuilder<AppCubits, CubitState>(
                      builder: (context, state) {
                        if (state is LoadedState) {
                          List<Place> places = state.places;

                          return ListView.builder(
                            itemCount: places.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              Place place = places[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 15.0, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<AppCubits>(context).fetchdetailedPlace(places[index]);
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(place.images!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(); // Handle other states if needed
                        }
                      },
                    )),

                // 2

                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 10),
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage('images/travel.png'),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                ),

                //3

                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 10),
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage('images/travel.png'),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          //Explore more

          Container(
            margin: const EdgeInsets.all(8.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: 'Explore more',
                  size: 20,
                ),
                AppText(
                  text: 'See All',
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),

          //Explore more Items

          Container(
            height: 80,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 50),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage('images/travel.png'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 50, top: 7),
                        child: const AppText(
                          text: 'Missoum',
                          color: Colors.grey,
                          size: 10,
                        ),
                      ),
                    ],
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

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  const CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
