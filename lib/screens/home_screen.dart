import 'package:flutter/material.dart';
import 'package:doctor_app_fltter/models/home_model.dart';
import 'package:doctor_app_fltter/apis/home_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomeModel> homeFuture;

  Future<HomeModel> getHome() {
    return fetchHome();
  }

  @override
  void initState() {
    homeFuture = getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor App'),
      ),
      body: FutureBuilder<HomeModel>(
        future: homeFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (snapshot.hasData) {
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  height: 200,
                  color: Colors.grey,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Categories',
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      var category = snapshot.data!.categories[index];
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.withOpacity(0.5),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              category.title ?? "unkown Category",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(category.lavel ?? "Unkown Level"),
                          ],
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(width: 10);
                    }),
                    itemCount: snapshot.data!.categories.length,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Doctors',
                  ),
                ),
                ...List.generate(
                  snapshot.data!.doctors.length,
                  (index) {
                    var doctor = snapshot.data!.doctors[index];
                    return ListTile(
                      leading: Image.network(
                        doctor.image!,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(doctor.name ?? "Unknown Doctor"),
                      subtitle: Text(
                        doctor.categoryId.toString(),
                      ),
                    );
                  },
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
