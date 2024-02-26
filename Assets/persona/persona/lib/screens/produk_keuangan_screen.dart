import 'package:flutter/material.dart';
// import 'package:persona/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';

class ProdukKeuanganScreen extends StatefulWidget {
  const ProdukKeuanganScreen({Key? key}) : super(key: key);

  @override
  _ProdukKeuanganScreenState createState() => _ProdukKeuanganScreenState();
}

class _ProdukKeuanganScreenState extends State<ProdukKeuanganScreen> {
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

    Widget showModal() {
      return ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 10,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                width: 50,
                height: 500,
                color: Colors.white,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/detailProdukKeuangan.png',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'KPM adalah produk pembiayaan sepeda motor dari BCA Multi Finance yang diperuntukkan bagi masyarakat umum, perusahaan, maupun kolektif yang membutuhkan sepeda motor baru. KPM hadir dengan berbagai tenor dan DP yang sesuai dengan kemampuan Anda. KPM memberikan kemudahan bertransaksi dengan bekerjasama dengan Indomaret, Alfamart group, Kantor Pos dan BCA untuk pembayaran angsuran.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Text('Selengkapnya'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff7da0ca)),
        ),
      );
    }

    Widget ProdukMenu() {
      return Center(
        child: Container(
          width: screenWidth,
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/kpm.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Kredit Pemilikan Motor',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  child: const Text(
                                    'Produk pembiayaan masyarakat yang membutuhkan motor baru',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: showModal(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/ksm.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Kredit Sepeda Motor',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  child: const Text(
                                    'Produk pembiayaan motor baru khusus nasabah BCA',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: showModal(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/kmb.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Kredit Motor Bekas',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  child: const Text(
                                    'Produk pembiayaan bekas bagi peminat motor bekas',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: showModal(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffF0EFEF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/kms.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Kredit Mobil Seken',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  child: const Text(
                                    'Produk pembiayaan mobil seken bagi masyarakat umum',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: showModal(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    int _selectedIndex = 2;
    void _onItemTapped(int index) {
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
              label: 'Learning', icon: CupertinoIcons.book_solid),
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
            SingleChildScrollView(
              child: ProdukMenu(),
            ),
            TopBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
