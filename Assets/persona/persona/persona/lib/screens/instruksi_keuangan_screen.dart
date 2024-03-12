import 'package:flutter/material.dart';
// import 'package:persona/widgets/bottom_navbar.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';

class InstruksiKeuanganScreen extends StatefulWidget {
  const InstruksiKeuanganScreen({Key? key}) : super(key: key);

  @override
  _InstruksiKeuanganScreenState createState() =>
      _InstruksiKeuanganScreenState();
}

class _InstruksiKeuanganScreenState extends State<InstruksiKeuanganScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Widget TopBar() {
      return Container(
        width: screenWidth * 1,
        padding: EdgeInsets.only(top: 0, bottom: screenHeight * 0.8),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/keuangan');
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'personA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    Widget BodyInstruksiKerja() {
      return Container(
        width: screenWidth,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90, left: 10, right: 10),
                  child: Container(
                    height: 200,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        Image.asset('assets/keuangan.png',
                            width: 90, height: 90),
                        Text(
                          'Introduction',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/introductionKeuangan');
                          },
                          child: Text('Detail'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7da0ca)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90, left: 10, right: 10),
                  child: Container(
                    height: 200,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/keuangan.png',
                            width: 90, height: 90),
                        Text(
                          'Peraturan Perusahaan',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Detail'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7da0ca)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/keuangan.png',
                            width: 90, height: 90),
                        Text(
                          'ESS',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Detail'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7da0ca)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/keuangan.png',
                            width: 90, height: 90),
                        Text(
                          'Silvi',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Detail'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7da0ca)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    int _selectedIndex = 2;
    void _onItemTapped(int index) {
      if (index != _selectedIndex) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/reminder');
            break;
          case 2:
            Navigator.pushNamed(context, '/learning');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      }
    }

    Widget BottomNavBar() {
      return CustomLineIndicatorBottomNavbar(
        selectedColor: Color(0xff7da0ca),
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Reminder',
            icon: CupertinoIcons.bell_fill,
          ),
          CustomBottomBarItems(
            label: 'Learning',
            icon: CupertinoIcons.book_solid,
          ),
          CustomBottomBarItems(
            label: 'Profile',
            icon: Icons.person_rounded,
          ),
        ],
      );
    }

    // Widget BottomNavBar() {
    //   return BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home, color: Color(0xff7da0ca)),
    //         label: 'Home',
    //         // backgroundColor: Colors.red,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.bell_fill, color: Color(0xff7da0ca)),
    //         label: 'Reminder',
    //         // backgroundColor: Colors.green,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.book_solid, color: Color(0xff7da0ca)),
    //         label: 'Learning',
    //         // backgroundColor: Colors.purple,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person_rounded, color: Color(0xff7da0ca)),
    //         label: 'Profile',
    //         // backgroundColor: Colors.pink,
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Color(0xff7798C1),
    //     onTap: _onItemTapped,
    //   );
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bghome.png'),
                fit: BoxFit.cover,
              )),
            ),
            BodyInstruksiKerja(),
            TopBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
