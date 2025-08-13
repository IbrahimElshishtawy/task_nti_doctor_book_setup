import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final MedicalRecordModel record;
  final VoidCallback onTap;

  const RecordCard({super.key, required this.record, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        title: Text(record.title),
        subtitle: Text(record.date),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
