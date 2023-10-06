import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerativeChat extends StatefulWidget {
  const GenerativeChat({super.key});

  @override
  State<GenerativeChat> createState() => _GenerativeChatState();
}

class _GenerativeChatState extends State<GenerativeChat> {
  List<String> messages = [];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Messages List
        messages.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(messages[index]));
                  },
                ),
              )
            : const SizedBox
                .shrink(), // Display nothing when there are no messages

        // Welcome Text when no messages are present
        messages.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  'Willkommen zu Fotodesk Pro Chat AI',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox
                .shrink(), // Display nothing when there are messages

        // Place Chat and Choice Boxes at the bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _choiceBoxes(),
              _generativeChat(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _generativeChat() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 650.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blueGrey[200]!,
                  Colors.blueGrey[300]!,
                ],
              ),
            ),
            child: TextFormField(
              controller: _controller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Schreibe deine Nachricht hier...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.w),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        messages.add(_controller.text);
                        _controller.clear();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Seien Sie immer vorsichtig, ChatGPT kann ungenaue Antworten liefern.',
              style: TextStyle(
                  color: Color.fromARGB(223, 150, 138, 137), fontSize: 12),
            ),
          ),
          SizedBox(
            height: 32.h,
          )
        ],
      ),
    );
  }

  Widget _choiceBoxes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const ChoiceBox(
                title: 'Beliebte Fotos',
                subtitle: 'Welche Bilder kaufen Kunden am meisten?',
              ),
              SizedBox(
                height: 16.h,
              ),
              const ChoiceBox(
                title: 'Umsatzanalyse',
                subtitle: 'Wie schneidet Q4 im Vergleich zu Q3 ab?',
              ),
            ],
          ),
          SizedBox(
            width: 16.h,
          ),
          Column(
            children: [
              const ChoiceBox(
                title: 'E-Mail Angebot für Jeffrey',
                subtitle: 'Erstelle mir das Hochzeitsangebot für Jeffrey',
              ),
              SizedBox(
                height: 16.h,
              ),
              const ChoiceBox(
                title: 'Termin Absage für Herrn Mustermann',
                subtitle: 'Sage den Termin für morgen bei Mustermann ab',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChoiceBox extends StatefulWidget {
  final String title;
  final String subtitle;

  const ChoiceBox({super.key, required this.title, required this.subtitle});

  @override
  ChoiceBoxState createState() => ChoiceBoxState();
}

class ChoiceBoxState extends State<ChoiceBox> {
  bool _isHovering =
      false; // Zustand, um zu überprüfen, ob der Mauszeiger über der Box schwebt

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle selection here
      },
      onHover: (hovering) {
        setState(() {
          _isHovering = hovering;
        });
      },
      borderRadius: BorderRadius.circular(
          30), // Dies sorgt dafür, dass der InkWell-Effekt abgerundet ist
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 310.w,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: _isHovering
              ? Colors.white.withOpacity(.2)
              : Colors.white.withOpacity(.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[300]!, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            MouseRegion(
              onHover: (_) {
                // Show the arrow icon when hovering
              },
              child: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
