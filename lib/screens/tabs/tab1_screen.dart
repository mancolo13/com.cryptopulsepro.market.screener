import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  String _classType = 'Economy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AeroRadar • Flight Finder', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.secondary),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ORIGIN', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                          Text('NYC', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('New York (JFK)', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                      Icon(Icons.flight, color: AppTheme.primary, size: 28),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('DESTINATION', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                          Text('LHR', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.secondary)),
                          Text('London (Heathrow)', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24, height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Economy', 'Premium', 'Business'].map((c) => ChoiceChip(
                      label: Text(c),
                      selected: _classType == c,
                      selectedColor: AppTheme.primary.withValues(alpha: 0.3),
                      onSelected: (val) => setState(() => _classType = c),
                    )).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => RoutingService.openRegistrationUrl(),
              icon: const Icon(Icons.search),
              label: const Text('Search Best Fares (From \$389)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
