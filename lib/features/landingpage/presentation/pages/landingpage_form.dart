import 'package:flutter/material.dart';

class LandingPageForm extends StatefulWidget {
  const LandingPageForm({super.key});

  @override
  LandingPageFormState createState() => LandingPageFormState();
}

class LandingPageFormState extends State<LandingPageForm> {
  // Zustandsvariablen für das Auf- und Zuklappen der Sektionen
  bool isHeroSectionExpanded = false;
  bool isAboutMeSectionExpanded = false;
  bool isContactSectionExpanded = false;
  bool isDsgvoSectionExpanded = false;
  bool isMailchimpSectionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildExpandableSection(
            title: 'Hero Section',
            isExpanded: isHeroSectionExpanded,
            toggleExpansion: () =>
                setState(() => isHeroSectionExpanded = !isHeroSectionExpanded),
            child: const Text('Inhalte der Hero Section'),
          ),
          _buildExpandableSection(
            title: 'About Me Section',
            isExpanded: isAboutMeSectionExpanded,
            toggleExpansion: () => setState(
                () => isAboutMeSectionExpanded = !isAboutMeSectionExpanded),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Kurze Bio',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          _buildExpandableSection(
            title: 'Contact Section',
            isExpanded: isContactSectionExpanded,
            toggleExpansion: () => setState(
                () => isContactSectionExpanded = !isContactSectionExpanded),
            child: Column(
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nachricht',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Senden'),
                ),
              ],
            ),
          ),
          _buildExpandableSection(
            title: 'DSGVO Section',
            isExpanded: isDsgvoSectionExpanded,
            toggleExpansion: () => setState(
                () => isDsgvoSectionExpanded = !isDsgvoSectionExpanded),
            child: const Text('DSGVO Informationen'),
          ),
          _buildExpandableSection(
            title: 'Mailchimp Integration Section',
            isExpanded: isMailchimpSectionExpanded,
            toggleExpansion: () => setState(
                () => isMailchimpSectionExpanded = !isMailchimpSectionExpanded),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'E-Mail für Newsletter',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback toggleExpansion,
    required Widget child,
  }) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: toggleExpansion,
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
        ],
      ),
    );
  }
}
