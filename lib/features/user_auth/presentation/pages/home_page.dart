import 'package:flutter/material.dart';
import 'package:untitled2/screens/course_screen.dart';
import 'package:untitled2/screens/fullcourse_screen.dart';
import 'package:untitled2/screens/wishlist.dart';
import 'package:untitled2/screens/videoplay.dart';
import 'package:untitled2/screens/settings.dart';
import 'package:untitled2/screens/notification.dart';
import'package:untitled2/screens/profile.dart';
import 'package:untitled2/screens/aboutus.dart';
import 'package:untitled2/screens/contactus.dart';
import 'package:untitled2/screens/terms.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List catNames = [
    "Category",
    'Classes',
    'Free Course',
    'BookStore',
    'Live Course',
    'LeaderBoard',
  ];

  List<Color> catColors = [
    Color(0xFFDFB01C),
    Color(0xFF36722E),
    Color(0xFF059E8D),
    Color(0xFF7A28A4),
    Color(0xFFB0397B),
    Color(0xFFC13544),
  ];

  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  List imgList = [
    'physics',
    'biology',
    'chemistry',
    'geography',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Change the leading widget
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.dashboard_outlined, // Use your desired icon
                    color: Color(0xFFDE9151),
                    size: 32,// Change the color here
                  ),
                  onPressed: () {
                    // Open the navigation drawer
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined,
            color: Color(0xFFDE9151),
            size: 32,), // Notification icon
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NotificationScreen(),
              ));// Add your notification logic here
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Add the Drawer here
      body:  ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Hi, Learner",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Color(0xFF5D5B51),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFF5D5B51),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Search here....",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                    itemCount: catNames.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D5B51)
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => FullCourseScreen(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                            color:Color(0xFF5D5B51),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: GridView.builder(
                    itemCount: imgList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (MediaQuery.of(context).size.height - 50 - 25)/ (4*240),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CourseScreen(imgList[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  "images/${imgList[index]}.png",
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                              SizedBox(height: 4,),
                              Text(
                                imgList[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 6,),
                              Text(
                                "55 Videos", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      AppBottomNavigationBar(), // Add the Bottom Navigation Bar here
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFFFBF3),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(
                      image: AssetImage('images/girl2.png'),
                    )),
              ),
            ),
            Center(
              child: Text(
                "User",
                style: TextStyle(color: Colors.black54, fontSize: 22),
              ),
            ),
            Center(
              child: Text(
                "user123@gmail.com",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 30,),
            // ListTile(
            //   leading: Icon(Icons.table_chart),
            //   title: Text('My Courses'),
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(
            //     //   builder: (context) => MyApp(),
            //     // ));// Close the drawer
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.video_library_sharp),
              title: Text('Videos'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ));// Close the drawer
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.note_sharp),
            //   title: Text('Pdfs'),
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(
            //     //   builder: (context) => SettingsPage(),
            //     // ));// Close the drawer// Close the drawer
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ));// Close the drawer// Close the drawer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.arrow_forward_ios_outlined),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
                ));// Close the drawer// Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ContactUsPage(),
                ));// Close the drawer// Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.note_alt_rounded),
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TermsPage(),
                ));// Close the drawer// Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppBottomNavigationBar extends StatefulWidget {
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation for the Bottom Navigation Bar
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullCourseScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoppingPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfileUI()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      showUnselectedLabels: true,
      iconSize: 32,
      selectedItemColor: Color(0xFFDE9151),
      selectedFontSize: 18,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
