import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/carModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  Future<List<CarModel>> fetchListings() async {
    final url = Uri.parse('https://auto.dev/api/listings');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> listings = data['records'];
      return listings
          .map<CarModel>((record) => CarModel.fromJson(record))
          .toList();
    } else {
      throw Exception('Failed to load listings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<CarModel>>(
        future: fetchListings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Extraction des données de voitures
            final List<CarModel> listings = snapshot.data!;

            // Carrousel
            return Column(
              children: [
                // Carrousel
                CarouselSlider.builder(
                  itemCount: listings.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final CarModel listing = listings[itemIndex];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            listing.primaryPhotoUrl ??
                                'https://via.placeholder.com/150',
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${listing.make} ${listing.model} (${listing.year})',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: ${listing.price}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(height: 20), // Espace entre le carrousel et la grille

                // Grille de cartes
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Nombre de colonnes
                      crossAxisSpacing: 8.0, // Espacement horizontal
                      mainAxisSpacing: 8.0, // Espacement vertical
                      childAspectRatio: 0.7, // Ratio d'aspect des cartes
                    ),
                    itemCount: listings.length,
                    itemBuilder: (context, index) {
                      final CarModel listing = listings[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network(
                              listing.primaryPhotoUrl ??
                                  'https://via.placeholder.com/150',
                              fit: BoxFit.cover,
                              height: 80,
                              width: 120,
                            ),
                            ListTile(
                              title: Text(
                                ' ${listing.year} ${listing.model} ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Price: ${listing.price}',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: (){},
                                child: const Text('Disabled'),
                              ),
                                                    
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
