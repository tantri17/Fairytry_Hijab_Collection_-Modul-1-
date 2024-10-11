// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykoskutri/app/modules/Checkoutpengajuan/views/checkoutpengajuan_view.dart';
import 'package:mykoskutri/app/modules/Message/views/message_view.dart';
import 'package:share_plus/share_plus.dart';
import '../../CheckoutPengajuan/views/checkout_pengajuan_view.dart';

class RoomDetailView extends StatelessWidget {
  final String roomTitle;
  final String price;
  final String description;
  final List<String> imagePaths;

  const RoomDetailView({
    Key? key,
    required this.roomTitle,
    required this.price,
    required this.description,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Get.snackbar("Info", "Added to favorites");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset(
                    'asset/th (1).jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/th (2).jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/th (3).jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/th.jpeg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            buildTitleSection(),
            const SizedBox(height: 10),
            buildLocationRow(),
            const SizedBox(height: 10),
            buildRatingRow(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            buildDescriptionSection(),
            const SizedBox(height: 20),
            buildPriceSection(),
            const SizedBox(height: 20),
            buildFacilitiesSection(),
            const SizedBox(height: 20),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          roomTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Get.snackbar("Info", "All photos opened.");
          },
          child: const Text("See all Photos"),
        )
      ],
    );
  }

  Widget buildLocationRow() {
    return Row(
      children: const [
        Chip(
          label: Text('Woman'),
          backgroundColor: Colors.pink,
          labelStyle: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 10),
        Icon(Icons.location_on, size: 16, color: Colors.grey),
        Text('Jl. Tata Surya 3 No. 15'),
      ],
    );
  }

  Widget buildRatingRow() {
    return Row(
      children: const [
        Icon(Icons.star, color: Colors.orange, size: 16),
        SizedBox(width: 5),
        Text('4.9'),
        SizedBox(width: 5),
        Text('(110)'),
        SizedBox(width: 5),
        Text('30 successful transactions'),
      ],
    );
  }

  Widget buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kos managed by RaKo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          'Just got online',
          style: TextStyle(color: Color.fromARGB(255, 130, 253, 134)),
        ),
        const SizedBox(height: 10),
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(description),
      ],
    );
  }

  Widget buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: const TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 124, 252, 128),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Fasilitas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        Chip(label: Text('Wifi')),
        SizedBox(height: 5),
        Chip(label: Text('Kulkas')),
        SizedBox(height: 5),
        Chip(label: Text('Parkir')),
        SizedBox(height: 5),
        Chip(label: Text('Laundry')),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(ChatView());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB4E0C4),
          ),
          child: const Text('Chat pemilik'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Share.share(
                'Check out this room: $roomTitle\nPrice: $price\nDescription: $description');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text('Share'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Get.to(CheckoutPengajuanView());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFC8C8),
          ),
          child: const Text('Check out'),
        ),
      ],
    );
  }
}
