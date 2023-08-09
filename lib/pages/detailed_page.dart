import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/widgets/app_buttons.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

import '../models/data_models.dart';
import '../widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;
  int gottenStar = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocBuilder<AppCubits, CubitState>(
          builder: (context, state) {
            if(state is PlaceState){
              
            Place place = state.props[0];

            return Stack(
              children: [
                
                //image

                Positioned(
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              place.images as String,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),

                //Icon 1

                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),

                //Icon 2

                Positioned(
                  right: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),

                //

                Positioned(
                  top: 250,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        //name and price

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: place.name as String),
                            AppLargeText(
                              text: '\$ ${place.price}',
                              color: Colors.purple,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //location

                         Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.purple,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: place.exactPlace as String,
                              color: Colors.purple,
                              size: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //stars

                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: (index < gottenStar)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(place.stars.toString())
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //People Text

                        const AppLargeText(
                          text: 'People',
                          size: 22,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //Number of people in group

                        const AppText(
                          text: 'Number of people in group',
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //Numbers

                        Wrap(
                          children: List.generate(
                              5,
                              (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: AppButton(
                                      size: 50,
                                      color: Colors.black,
                                      backgrouncolor: selectedIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                      bordercolor: Colors.black,
                                      w: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //Description

                        const AppLargeText(
                          text: 'Description',
                          size: 22,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //text of Description

                        SizedBox(
                          width: double.maxFinite,
                          child: AppText(
                            text:place.description as String,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),

                //two button

                Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const AppButton(
                            size: 50,
                            color: Colors.black,
                            backgrouncolor: Colors.grey,
                            bordercolor: Colors.black,
                            w: Icon(Icons.favorite_border),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ResponsiveButton(
                            isResponsive: true,
                            width: double.maxFinite,
                            onTap: () {})
                      ],
                    ))
              ],
            );
          }else {
            return Container();
          }
            }

        ),
      ),
    );
  }
}
