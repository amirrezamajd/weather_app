import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:weather_app/constants/my_colors.dart';
import 'package:weather_app/constants/my_size.dart';
import 'package:weather_app/constants/my_text_style.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/utility/utility.dart';
import 'package:weather_app/widgets/my_loading_widget.dart';
import 'package:weather_app/widgets/my_snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Hive.box<WeatherModel>('WeatherBox');
  bool internet = true;
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityResult = result;
      print(result);
    });
    if (_connectivityResult == ConnectivityResult.wifi ||
        _connectivityResult == ConnectivityResult.mobile ||
        _connectivityResult == ConnectivityResult.ethernet) {
      setState(() {
        internet = true;
      });
      update();
    } else {
      setState(() {
        internet = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(mySnackBar('No Internet', context));
    }
  }

  List<String> cityName = ['tehran', 'Dubai', 'London', 'New York'];
  bool isLoading = false;
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    initConnectivity();

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    setState(() {});
    super.initState();
  }

  update() async {
    setState(() {
      box.clear();
      isLoading = true;
    });
    for (var element in cityName) {
      await getWeathers(element);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getWeathers(String location) async {
    final IWeatherRepository dataSource = locator.get();
    try {
      final response = await dataSource.getWeather(location);
      response.fold((error) {}, (response) {
        box.add(response);
        setState(() {});
      });
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _main(),
      ),
    );
  }

  Widget _main() {
    return isLoading
        ? const MyLoading()
        : RefreshIndicator(
            onRefresh: () => update(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Visibility(
                    visible: !internet,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: MyColors.redColor,
                      child: const Center(child: Text('No Internet')),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MySize.paddingFromEdges),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffD0EFFC), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: searchController,
                              cursorColor: MyColors.blueLight80,
                              style: MyTextStyle.inter12,
                              decoration: InputDecoration(
                                hintText: 'Search Location...',
                                hintStyle: MyTextStyle.inter12Grey.copyWith(
                                  color: MyColors.greyColor.withOpacity(0.8),
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (searchController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySnackBar(
                                        'Please Enter Location', context));
                              } else {
                                setState(() {
                                  isLoading = true;

                                  getWeathers(searchController.text);
                                  searchController.text = '';
                                  isLoading = false;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: MyColors.greyBox,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                CupertinoIcons.plus,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: MySize.paddingFromEdges),
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        List<WeatherModel> weatherList = box.values.toList();
                        return SwipeActionCell(
                          key: ObjectKey(weatherList[index]),
                          isDraggable: true,
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                              performsFirstActionWithFullSwipe: true,
                              content: Padding(
                                padding:
                                    EdgeInsets.only(top: index == 0 ? 0 : 10),
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: MyTextStyle.inter12
                                        .copyWith(color: MyColors.redColor),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              color: Colors.transparent,
                              onTap: (CompletionHandler handler) async {
                                weatherList.removeAt(index);
                                box.delete(index);
                                setState(() {});
                              },
                            ),
                          ],
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: index == 0 ? 0 : 10),
                            decoration: BoxDecoration(
                              color: MyColors.greyBox,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(weatherList[index].cityName),
                                const Spacer(),
                                Text(
                                    '${weatherList[index].time.hour}:${weatherList[index].time.minute}'),
                                const Spacer(),
                                Text('${weatherList[index].temp}'),
                                const SizedBox(
                                  width: 10,
                                ),
                                MapString.mapStringToIcon(
                                    weatherList[index].currently, 26),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
