import 'package:flutter/material.dart';
import 'package:one_car_rental_driver_app/model/earning_model.dart';

class EarningsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earnings'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '330.00',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: earnings.length,
        itemBuilder: (context, index) {
          return EarningsCard(item: earnings[index]);
        },
      ),
    );
  }
}

class EarningsCard extends StatelessWidget {
  final EarningsItem item;

  const EarningsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.dateTime,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(item.location),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tip Added', style: TextStyle(color: Colors.grey)),
              Text(item.tip),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Your Amount', style: TextStyle(color: Colors.grey)),
              Text(item.amount),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('You Rated', style: TextStyle(color: Colors.grey)),
              Row(
                children: List.generate(
                  item.rating,
                  (index) =>
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<EarningsItem> earnings = [
  EarningsItem(
    dateTime: "25 Oct, 2021, 08:41 PM",
    location: "JAFZA ONE - Sheikh Zayed Road - Dubai - United Arab Emirates",
    amount: "AED 11.75",
    tip: "AED 0.00",
    rating: 5,
  ),
  EarningsItem(
    dateTime: "25 Oct, 2021, 08:40 PM",
    location: "Badami Logistics - Dubai - United Arab Emirates",
    amount: "AED 11.03",
    tip: "AED 0.00",
    rating: 5,
  ),
  EarningsItem(
    dateTime: "25 Oct, 2021, 08:38 PM",
    location: "Badami Logistics - Dubai - United Arab Emirates",
    amount: "AED 11.03",
    tip: "AED 0.00",
    rating: 5,
  ),
];
