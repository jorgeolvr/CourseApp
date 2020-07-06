import 'package:course_app/constants.dart';
import 'package:course_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/menu.svg"),
                  Image.asset("assets/images/user.png")
                ],
              ),
              SizedBox(height: 30),
              Text("Olá Jorge,", style: kHeadingextStyle),
              Text("Ache o curso ideal para você", style: kSubheadingextStyle),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  onChanged: (String str) {
                    print(str);
                  },
                  decoration: InputDecoration(
                    hintText: "Pesquise por alguma coisa",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFF5F5F7),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categorias",
                    style: kTitleTextStyle,
                  ),
                  InkWell(
                    child: Text(
                      "Ver Todos",
                      style: kSubtitleTextStyle.copyWith(color: kBlueColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(0),
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Cursos',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ],
          )),
    );
  }
}
