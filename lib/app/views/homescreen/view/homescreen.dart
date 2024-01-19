import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practical_exam/app/utils/helpers/newsapi_helper.dart';
import 'package:practical_exam/app/utils/models/newapimodel/newsapimodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    int d = DateTime.now().day;
    int m = DateTime.now().month;
    int y = DateTime.now().year;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News"),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Companies sources",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: NewsHelper.newsHelper.ApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel>? data = snapshot.data as List<NewsModel>?;

            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: data[i].url);
                  },
                  child: Container(
                    height: h / 3,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.primaries[i],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(23),
                      ),
                    ),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border,
                            size: 44,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${data![i].name},",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data![i].description},",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: GoogleFonts.poppins(fontSize: 34),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
        },
      ),
    );
  }
}
