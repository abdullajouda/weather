import 'package:flutter/material.dart';
import 'package:weather/src/services/api_controller.dart';
import 'package:weather/src/utils/constants.dart';
import 'package:weather/src/utils/helpers.dart';
import 'package:weather/src/views/home_views/search_results_page.dart';

import '../../data/responses/search_ip_response.dart';
import '../../utils/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future _future;
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: search,
          onFieldSubmitted: (value) {
            _future = ApiController.searchCities(term: value);
            setState(() {});
          },
          decoration: Constants.inputDecoration(
            suffix: IconButton(
              onPressed: () {
                if (search.text.isNotEmpty) {
                  _future = ApiController.searchCities(term: search.text);
                  setState(() {});
                }
              },
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<City>>(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            }
            List<City> cities = snapshot.data;
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              itemCount: snapshot.data.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {

                return ListTile(
                  onTap: () {
                    N.push(context, SearchResultsPage(city: snapshot.data[index],));
                  },
                  tileColor: Colors.white,
                  title:  Row(
                    children: [
                      Expanded(
                        child: Text(
                          snapshot.data[index].englishName +'\n${snapshot.data[index].country.englishName}\n${snapshot.data[index].region.englishName}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: kDarkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_circle_right_sharp,color: kDarkBlue,)
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
