import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mykoskutri/app/modules/SuccessPage/views/success_page_view.dart';

class CheckoutPengajuanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperWidget(),
            const SizedBox(height: 10),
            BookingDetails(),
            const SizedBox(height: 10),
            PaymentSummary(),
            const SizedBox(height: 10),
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}

class StepperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 3, // Spasi antar elemen
      children: [
        _stepItem("Pengajuan", true),
        _stepItem("menyetujui", true),
        _stepItem("Pembayaran", true),
        _stepItem("Berhasil", true),
      ],
    );
  }
}

Widget _stepItem(String title, bool isCompleted) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: isCompleted ? Colors.green : Colors.grey,
        child: Icon(
          isCompleted ? Icons.check : Icons.circle_outlined,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 3),
      Text(title),
    ],
  );
}

class BookingDetails extends StatefulWidget {
  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        Get.snackbar(
          "Selesai",
          "Tanggal berhasil dipilih: ${DateFormat('EEEE, dd MMMM yyyy').format(_selectedDate!)}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
        );

        Future.delayed(Duration(seconds: 2), () {
          Get.to(SuccessPage());
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset('asset/th (1).jpeg'),
              title: const Text('Kos dekat UMM'),
              subtitle: const Text('Jl. Raya Jetis'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Booking start date'),
              trailing: TextButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  _selectedDate == null
                      ? 'Select date'
                      : DateFormat('EEEE, dd MMMM yyyy').format(_selectedDate!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First payment details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Dormitory rental fees'),
                Text('500.000'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total first payment'),
                Text(
                  '500.000',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Get.snackbar("Success", "Booking confirmed!");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Check out',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
