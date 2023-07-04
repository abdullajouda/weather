import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather/src/components/loader.dart';
import 'package:weather/src/services/api_controller.dart';
import 'package:weather/src/utils/constants.dart';
import 'package:weather/src/utils/helpers.dart';
import 'package:weather/src/utils/theme.dart';
import 'package:weather/src/views/home_views/search_page.dart';

import '../../data/responses/daily_forecast_response.dart';
import '../../utils/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future _future;
  Future _5DayFuture;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _future = ApiController.dailyForecast(days: 1);
    _5DayFuture = ApiController.dailyForecast(days: 5);
    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    _future = ApiController.dailyForecast(days: 1);
    _5DayFuture = ApiController.dailyForecast(days: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Data.ipData.englishName),
        actions: [
          IconButton(
            onPressed: () {
              N.push(context, SearchPage());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SmartRefresher(
        header:  ClassicHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: [
            FutureBuilder<DailyForecastResponse>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverFillRemaining(child: Loader());
                  }
                  return SliverPadding(
                      padding: Constants.kPadding,
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Day',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: kDarkBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${DateTime.now().day}/${DateTime.now().month}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: kDarkBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: kBlue,
                                height: 30,
                              ),
                              Text(
                                '${snapshot.data.dailyForecasts.first.temperature.minimum.value.toStringAsFixed(0)} ' +
                                    snapshot.data.dailyForecasts.first.temperature
                                        .minimum.unit,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kDarkBlue.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                snapshot.data.dailyForecasts.first.day.iconPhrase,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kDarkBlue.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                snapshot.data.headline.text,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kDarkBlue.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: kDarkBlue,
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Night',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${DateTime.now().day}/${DateTime.now().month}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: kBlue,
                                height: 30,
                              ),
                              Text(
                                '${snapshot.data.dailyForecasts.first.temperature.minimum.value.toStringAsFixed(0)} ' +
                                    snapshot.data.dailyForecasts.first.temperature
                                        .minimum.unit,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                snapshot
                                    .data.dailyForecasts.first.night.iconPhrase,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])));
                }),
            FutureBuilder<DailyForecastResponse>(
              future: _5DayFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter();
                }
                return SliverPadding(
                  padding: Constants.kPadding
                      .add(EdgeInsets.only(top: 30, bottom: 50)),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('EEEE').format(
                                  snapshot.data.dailyForecasts[index].date),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: kDarkBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.sunny),
                                Expanded(
                                  child: Text(
                                    snapshot.data.dailyForecasts[index].day
                                        .iconPhrase,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.nights_stay),
                                Expanded(
                                  child: Text(
                                    snapshot.data.dailyForecasts[index].night
                                        .iconPhrase,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.thermostat),
                                Expanded(
                                  child: Text(
                                    snapshot.data.dailyForecasts[index]
                                            .temperature.minimum.value
                                            .toStringAsFixed(0) +
                                        ' - ' +
                                        snapshot.data.dailyForecasts[index]
                                            .temperature.maximum.value
                                            .toStringAsFixed(0) +
                                        ' ' +
                                        snapshot.data.dailyForecasts[index]
                                            .temperature.minimum.unit,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      childCount: snapshot.data.dailyForecasts.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
