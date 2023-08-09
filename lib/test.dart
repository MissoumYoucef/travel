//class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   late List<Place> p;

//   @override
//   void initState() {
//     super.initState();
//     fetchPlaces().then((places) {
//       setState(() {
//         p = places;
//       });
//     });
//   }

//   Future<List<Place>> fetchPlaces() async {
//     List<Place> places;
//     try {
//       places = await DataServices().getInfo();
//     } catch (e) {
//       places = [];
//     }
//     return places;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Place>>(
//       future: fetchPlaces(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error loading data'));
//         } else if (snapshot.hasData && snapshot.data!.isEmpty) {
//           return const Center(child: Text('No data available'));
//         } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//           return Center(child: Text(snapshot.data![0].name ?? 'nothing'));
//         }
//         return const Center(child: Text('Unknown error'));
//       },
//     );
//   }
// }