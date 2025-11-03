


import 'package:flutter/material.dart';

class Beneficiary {
  final String name;
  final String identifier;
  final String initial;
  final Color color;
  final bool isVerified;
  final String transactionInfo;
  final String? imageUrl;
  final bool hasBlueVerification;

  Beneficiary({
    required this.name,
    required this.identifier,
    required this.initial,
    required this.color,
    this.isVerified = false,
    required this.transactionInfo,
    this.imageUrl,
    this.hasBlueVerification = false,
  });
}


  final List<Beneficiary> beneficiaries = [
    Beneficiary(
      name: 'CR Sahab',
      identifier: '+91 6387236311',
      initial: 'CS',
      color: const Color(0xFFB2EBF2),
      isVerified: true,
      transactionInfo: '1,500 Sent on 24 Oct',
    ),
    Beneficiary(
      name: 'Vikram Active',
      identifier: '+91 8727990512',
      initial: 'VA',
      color: const Color(0xFFE1BEE7),
      isVerified: true,
      transactionInfo: '1,000 Received on 19 Oct',
    ),
    Beneficiary(
      name: 'One97 Communications Limi...',
      identifier: 'poweraccess.paytm3@axisbank',
      initial: 'OL',
      color: const Color(0xFFE1BEE7),
      isVerified: true,
      transactionInfo: '1 Received on 19 Aug',
      hasBlueVerification: true,
    ),
    Beneficiary(
      name: 'Neeraj Sharma',
      identifier: '+91 916XXXX059',
      initial: 'NS',
      color: Colors.grey.shade300,
      isVerified: true,
      transactionInfo: '150 Received on 17 Aug',
      imageUrl: 'person',
    ),
  ];