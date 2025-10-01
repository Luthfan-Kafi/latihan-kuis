import 'package:flutter/material.dart';
import 'package:lat_kuis/login_screen.dart';
import 'vehicle-data.dart';
import 'vehicle_detail.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selamat Datang, $username',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.brown[700],
        elevation: 0,
      ),
      backgroundColor: Colors.brown[50],
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vehicleList.length,
        itemBuilder: (context, index) {
          final daftar = vehicleList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleDetailScreen(daftar: daftar),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                    child: Container(
                      width: 120,
                      height: 100,
                      color: Colors.grey[200],
                      child: Image.network(
                        daftar.imageUrls[0],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.error, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            daftar.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            daftar.type,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // GridView.builder(
      //   padding: const EdgeInsets.all(12),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 0.85,
      //     crossAxisSpacing: 12,
      //     mainAxisSpacing: 12,
      //   ),
      //   itemCount: vehicleList.length,
      //   itemBuilder: (context, index) {
      //     final daftar = vehicleList[index];
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => VehicleDetailScreen(daftar: daftar),
      //           ),
      //         );
      //       },
      //       child: Card(
      //         elevation: 3,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(12),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Expanded(
      //               child: ClipRRect(
      //                 borderRadius: const BorderRadius.vertical(
      //                   top: Radius.circular(12),
      //                 ),
      //                 child: Container(
      //                   color: Colors.grey[200],
      //                   child: Image.network(
      //                     daftar.imageUrls[0],
      //                     fit: BoxFit.contain,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text(
      //                 daftar.name,
      //                 textAlign: TextAlign.center,
      //                 maxLines: 2,
      //                 overflow: TextOverflow.ellipsis,
      //                 style: const TextStyle(
      //                   fontWeight: FontWeight.w600,
      //                   fontSize: 14,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
