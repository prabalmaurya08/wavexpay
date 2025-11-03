

import 'package:flutter/material.dart';

class Suggestion {
  final String name;
  final String? initial;
  final Color color;
  final bool isVerified;
  final String? imageUrl;

  Suggestion({
    required this.name,
    this.initial,
    required this.color,
    this.isVerified = false,
    this.imageUrl,
  });
}

class Contact {
  final String name;
  final String number;
  final String initial;
  final Color color;

  Contact({
    required this.name,
    required this.number,
    required this.initial,
    required this.color,
  });
}

  final List<Suggestion> suggestions = [
    Suggestion(name: 'Cr Sahab', initial: 'CS', color: const Color(0xFFB2EBF2), isVerified: false),
    Suggestion(name: 'Vikram Active', initial: 'VA', color: const Color(0xFFE1BEE7), isVerified: true),
    Suggestion(name: 'One97 Communicatio', initial: 'OL', color: const Color(0xFFE1BEE7), isVerified: true),
    Suggestion(name: 'Neeraj Sharma', initial: 'NS', color: Colors.grey, isVerified: true, imageUrl: 'person1'),
    Suggestion(name: 'Prabal', initial: 'P', color: Colors.grey, isVerified: false, imageUrl: 'person2'),
    Suggestion(name: 'Rajesh (awpl)', initial: 'R', color: const Color(0xFFFFE0B2), isVerified: false),
    Suggestion(name: 'Sanjay', initial: 'S', color: const Color(0xFFFFE0B2), isVerified: false),
    Suggestion(name: 'Gandharva Wife', initial: 'GW', color: const Color(0xFFFFAB91), isVerified: false, imageUrl: 'person3'),
    Suggestion(name: 'Mummy', initial: 'M', color: Colors.black, isVerified: false, imageUrl: 'person4'),
    Suggestion(name: 'Pintu Wife Alld', initial: 'PA', color: const Color(0xFFF8BBD0), isVerified: false),
    Suggestion(name: 'Ro House. Sharma', initial: 'RS', color: const Color(0xFFBBDEFB), isVerified: false),
    Suggestion(name: 'Aadhaar Bank', initial: 'AB', color: Colors.grey, isVerified: false, imageUrl: 'person5'),
  ];

  final List<Contact> contacts = [
    Contact(name: 'A. P.  A: Patiala Principle', number: '9780979737', initial: 'AP', color: const Color(0xFFBBDEFB)),
    Contact(name: 'Aadhaar Bank', number: '7409627321', initial: 'AB', color: const Color(0xFFB2DFDB)),
    Contact(name: 'Aakash TL', number: '7894103073', initial: 'AT', color: const Color(0xFFFFE0B2)),
    Contact(name: 'Aaren S. C', number: '8949144371', initial: 'AC', color: const Color(0xFFFFE0B2)),
    Contact(name: 'Aaryan active BBDU', number: '8582056544', initial: 'AB', color: const Color(0xFFFFF9C4)),
    Contact(name: 'Abhay Suniyawan', number: '8076801937', initial: 'AS', color: const Color(0xFFB2EBF2)),
  ];
