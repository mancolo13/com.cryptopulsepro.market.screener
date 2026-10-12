import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final deals = [
      {'city': 'Paris (CDG)', 'price': '\$420', 'disc': '-35%', 'dates': 'Nov 12 - Nov 19'},
      {'city': 'Tokyo (HND)', 'price': '\$780', 'disc': '-20%', 'dates': 'Dec 02 - Dec 14'},
      {'city': 'Dubai (DXB)', 'price': '\$510', 'disc': '-28%', 'dates': 'Nov 20 - Nov 28'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exclusive Travel Deals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: deals.length,
        itemBuilder: (context, i) {
          final d = deals[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d['city'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(d['dates'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(d['price'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.secondary)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                      child: Text(d['disc'] as String, style: const TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
