import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/widgets/responsive_button.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  //nature images

  List images = [
    'images/montain.jpg',
    'images/mer.jpg',
    'images/sahara.jpg',
  ];

  //nature name

  List nature = [
    'Montain',
    'Sea',
    'Sahara',
  ];

  //nature descriptions

  List descriptions = [
    'Montain hikes give you an incridbleeeeeee sense of freedom along with endurance test',
    'A sea is a large body of salty water. There are particular seas and the sea. The sea commonly refers to the ocean, the wider body of seawater.',
    'The Sahara desert has dry valleys, mountains, salt flats, barren and rocky plateaus, and sand dunes. There are 20 lakes in the Sahara desert and almost all of them are saltwater lakes.',
  ];

  //
  List colors = [
    Colors.white10,
    Colors.blue.shade400,
    Colors.white10

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.cover)),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 270,
                    height: 400,
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: 'Trips'),
                        AppText(
                          text: nature[index],
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  descriptions[index],
                              color: Colors.white,
                              size: 14,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ResponsiveButton(
                            width: 100,
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).fetchPlaces();
                            })
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                        3,
                        (indexDots) => Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 8,
                              height: index == indexDots ? 25 : 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                            )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
