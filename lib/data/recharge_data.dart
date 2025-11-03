


import 'package:flutter/material.dart';

class SavedNumber {
  final String operator;
  final String name;
  final String number;
  final String addedOn;
  final Color color;
  final List<Plan> quickPlans;

  SavedNumber({
    required this.operator,
    required this.name,
    required this.number,
    required this.addedOn,
    required this.color,
    required this.quickPlans,
  });
}

class Plan {
  final String data;
  final int price;
  final bool isPopular;

  Plan({required this.data, required this.price, this.isPopular = false});
}

class Contact {
  final String number;
  final String altNumber;
  final Color color;

  Contact({required this.number, required this.altNumber, required this.color});
}

class RechargePlan {
  final int price;
  final String validity;
  final String data;
  final String description;
  final String? badge;
  final String category;

  RechargePlan({
    required this.price,
    required this.validity,
    required this.data,
    required this.description,
    this.badge,
    required this.category,
  });
}




  final List<SavedNumber> myNumbers = [
    SavedNumber(
      operator: 'VI',
      name: 'SIM 2',
      number: '8437024071',
      addedOn: '17 Jan',
      color: Colors.red,
      quickPlans: [
        Plan(data: '1 GB', price: 26, isPopular: true),
        Plan(data: '6 GB', price: 48),
        Plan(data: '20 GB', price: 99),
      ],
    ),
    SavedNumber(
      operator: 'Airtel',
      name: 'SIM 1',
      number: '9434970650',
      addedOn: '24 Apr',
      color: Colors.red,
      quickPlans: [
        Plan(data: '2 GB', price: 29, isPopular: true),
        Plan(data: '8 GB', price: 55),
      ],
    ),
  ];

  final List<Contact> contacts = [
    Contact(number: '+91 84232 90608', altNumber: '8423290608', color: Colors.orange),
    Contact(number: '+91 90414 17387', altNumber: '9041417387', color: Colors.blue),
    Contact(number: '+91 96738 77332', altNumber: '9673877332', color: Colors.amber.shade700),
    Contact(number: '+91 99140 42424', altNumber: '9914042424', color: Colors.amber.shade700),
  ];




  final List<String> tabs = [
    'Made for you',
    '5G Unlimited',
    'Add On Data',
    'NonStop',
  ];

  final List<RechargePlan> plans = [
    RechargePlan(
      price: 698,
      validity: '56 days',
      data: 'Unlimited',
      description: 'Get Unlimited Data & Calls + 100 SMS/Day for 56 Days. Enjoy Full day unlimited data, Everyday.',
      badge: 'Save Rs 98 vs Rs 398 plan',
      category: 'Made for you',
    ),
    RechargePlan(
      price: 22,
      validity: '1 days',
      data: '1GB',
      description: 'Add-On Data pack: Get 1GB for 1 day (till 11:59 PM). No Service Validity. No Outgoing SMS',
      badge: 'Popular',
      category: 'Made for you',
    ),
    RechargePlan(
      price: 48,
      validity: '3 days',
      data: '6GB',
      description: 'Add-On Data pack: Get 6GB for 3 days. No Service Validity. No Outgoing SMS',
      badge: 'Double Data',
      category: 'Made for you',
    ),
    RechargePlan(
      price: 33,
      validity: '2 days',
      data: '2GB',
      description: 'Add-On Data pack: Get 2GB Data valid for 2 Days. No Service Validity.',
      category: 'Made for you',
    ),
    RechargePlan(
      price: 101,
      validity: '30 days',
      data: '5GB',
      description: 'Get 5GB with 1 month of JioHotstar mobile subscription. Validity:30D. No Service Validity',
      category: 'Made for you',
    ),
  ];

  final List<RechargePlan> recommendedPlans = [
    RechargePlan(
      price: 398,
      validity: '28 Days',
      data: 'Unlimited',
      description: 'Validity Plan',
      category: 'Recommended',
    ),
    RechargePlan(
      price: 26,
      validity: '1 Day',
      data: '1.5 GB',
      description: 'Data Plan',
      category: 'Recommended',
    ),
  ];
