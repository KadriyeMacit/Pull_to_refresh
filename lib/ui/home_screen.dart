import 'package:flutter/material.dart';
import 'package:swipe_refresh_example/network/home_service.dart';
import 'package:swipe_refresh_example/network/model/home_response_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeService _homeService = HomeService();
  HomeResponseModel? homeResponseModel;
  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  Future _getBooks() async {
    debugPrint("service called");
    homeResponseModel = await _homeService.getBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          _getBooks();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: homeResponseModel?.books.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      homeResponseModel?.books[index] ?? "",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
