import 'package:flutter/material.dart';
import '../../../models/app_user.dart';
import '../../../models/fost.dart';
import '../../../models/fost_enums.dart';
import '../widgets/fost_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Donnée factice pour l'utilisateur actuel
  final AppUser _mockUser = const AppUser(
    id: '1',
    name: 'Bibs',
    avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
  );

  // Liste de données factices pour les Fosts
  final List<Fost> _mockFosts = [
    Fost(
      id: 'f1',
      description: 'Prêt de mon livre "Le Seigneur des Anneaux"',
      category: FostCategory.books,
      status: FostStatus.ongoing,
      type: FostType.mutual,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now().subtract(const Duration(days: 5)),
      creatorId: '1',
      lastEditorId: '2',
      otherPartyId: '2',
      creatorRole: FostRole.lender,
    ),
    Fost(
      id: 'f2',
      description: 'Rendre service : aider au déménagement de Marie',
      category: FostCategory.services,
      status: FostStatus.confirmed,
      type: FostType.mutual,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now(),
      creatorId: '2',
      lastEditorId: '1',
      otherPartyId: '1',
      creatorRole: FostRole.other,
    ),
    Fost(
      id: 'f3',
      description: 'Brouillon : idée de cadeau pour l\'anniversaire de maman',
      category: FostCategory.other,
      status: FostStatus.draft,
      type: FostType.solo,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
      creatorId: '1',
      lastEditorId: '1',
      creatorRole: FostRole.other,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeHeader(),
              const SizedBox(height: 24),
              _buildActionBar(),
              const SizedBox(height: 24),
              
              Text(
                'Mes Fosts Actuels',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              _buildFostList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFostList() {
    if (_mockFosts.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48.0),
          child: Text('Vous n\'avez aucun fost pour le moment.'),
        ),
      );
    }
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _mockFosts.length,
      itemBuilder: (context, index) {
        final fost = _mockFosts[index];
        return FostCard(fost: fost);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 0),
    );
  }

  Widget _buildWelcomeHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(_mockUser.avatarUrl),
          backgroundColor: Colors.grey.shade200,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bonjour, ${_mockUser.name}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Content de vous revoir.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionBar() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add, size: 18), label: const Text('New Fost')),
            const SizedBox(width: 8),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.people_outline, size: 18), label: const Text('Friends')),
            const SizedBox(width: 8),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.inventory_2_outlined, size: 18), label: const Text('Inventory')),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list), tooltip: 'Filtrer les Fosts'),
      ],
    );
  }
}
