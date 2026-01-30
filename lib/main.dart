import 'package:flutter/material.dart';

void main() {
  runApp(const MagicBooksApp());
}

class MagicBooksApp extends StatelessWidget {
  const MagicBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MagicBooks - Personalized Stories for Kids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
        ),
        fontFamily: 'Inter',
      ),
      home: const HomePage(),
    );
  }
}

// --- Models ---

class AvatarData {
  String name;
  String gender; // 'boy' or 'girl'
  Color skinTone;
  String hairStyle; // 'short', 'long', 'curly'
  Color hairColor;
  bool hasGlasses;

  AvatarData({
    this.name = '',
    this.gender = 'boy',
    this.skinTone = const Color(0xFFFFDBAC),
    this.hairStyle = 'short',
    this.hairColor = Colors.brown,
    this.hasGlasses = false,
  });
}

class BookData {
  final String title;
  final String coverImage;
  final String description;
  final String price;
  final List<String> pages;

  BookData({
    required this.title,
    required this.coverImage,
    required this.description,
    required this.price,
    required this.pages,
  });
}

final List<BookData> books = [
  BookData(
    title: 'Space Adventure',
    coverImage: 'assets/images/space.png',
    description: 'A journey across the galaxy for little astronauts.',
    price: '\$24.99',
    pages: [
      "One night, [NAME] found a glowing star under the bed. It wasn't just any star—it was a ticket to the Voyager Starship!",
      "With a WHOOSH, [NAME] zoomed past the moon. The stars twinkled like diamonds as the spaceship headed towards the Red Planet.",
      "On Mars, [NAME] met Ziggy, a friendly green alien with three eyes. 'I lost my moon-crystal,' Ziggy sighed.",
      "[NAME] looked behind a giant space-rock and found it! Ziggy was so happy, they danced a cosmic jig together.",
      "As the sun rose, [NAME] landed safely back home. A true space hero, ready for the next big adventure!"
    ],
  ),
  BookData(
    title: 'Jungle Explorer',
    coverImage: 'assets/images/jungle.png',
    description: 'Meet wild friends in the heart of the jungle.',
    price: '\$24.99',
    pages: [
      "[NAME] found a dusty, ancient map in the attic today. It showed a path to the mysterious Whispering Woods!",
      "The jungle was full of sounds! [NAME] swung on vines and marched through giant leaves, just like a real explorer.",
      "Suddenly, a baby elephant trumpeted for help! [NAME] used a sturdy branch to help the little one out of the mud.",
      "To say thank you, the monkeys led [NAME] to the Golden Banana Temple. It was the most beautiful place in the world.",
      "Heading home, [NAME] wore a crown of jungle flowers. Today was the best day ever, and the jungle was now a friend."
    ],
  ),
  BookData(
    title: 'Underwater Mystery',
    coverImage: 'assets/images/underwater.png',
    description: 'Dive deep into a world of magic and mermaids.',
    price: '\$24.99',
    pages: [
      "A glittering seashell washed up at [NAME]'s feet. When held to the ear, it whispered: 'The ocean is waiting...'",
      "In a bright yellow submarine, [NAME] dove deep. Schools of neon fish swam by, lighting up the blue water.",
      "Deep down, [NAME] met Marina the Mermaid. She was looking for a lost key to the Coral Palace.",
      "With sharp eyes, [NAME] spotted the key stuck in a giant clam. Marina cheered and the palace gates opened wide.",
      "Floating back to the surface, [NAME] saw the sunset. The ocean's mystery was solved, but the magic stayed forever."
    ],
  ),
];

// --- Screens ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _Header(),
            const _HeroSection(),
            const _FeaturedBooksSection(),
            const _HowItWorks(),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _FeaturedBooksSection extends StatelessWidget {
  const _FeaturedBooksSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Explore Our Magic Library',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Discover stories for every age and interest',
            style: TextStyle(fontSize: 18, color: Color(0xFF636E72)),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: books.map((book) => _BookCard(book: book)).toList(),
          ),
        ],
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final BookData book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              book.coverImage,
              height: 350,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  book.description,
                  style: const TextStyle(color: Color(0xFF636E72), height: 1.4),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalizationPage(book: book),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Personalize'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalizationPage extends StatefulWidget {
  final BookData book;

  const PersonalizationPage({super.key, required this.book});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  final AvatarData _avatar = AvatarData();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalizing: ${widget.book.title}'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Row(
        children: [
          // Left: Controls
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customize Your Hero',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  
                  // Name Input
                  const Text('Child\'s Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    onChanged: (val) => setState(() => _avatar.name = val),
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Gender
                  const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _choiceChip('Boy', _avatar.gender == 'boy', () => setState(() => _avatar.gender = 'boy')),
                      _choiceChip('Girl', _avatar.gender == 'girl', () => setState(() => _avatar.gender = 'girl')),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Skin Tone
                  const Text('Skin Tone', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _colorSelect(const Color(0xFFFFDBAC), _avatar.skinTone, (c) => setState(() => _avatar.skinTone = c)),
                      _colorSelect(const Color(0xFFF1C27D), _avatar.skinTone, (c) => setState(() => _avatar.skinTone = c)),
                      _colorSelect(const Color(0xFFE0AC69), _avatar.skinTone, (c) => setState(() => _avatar.skinTone = c)),
                      _colorSelect(const Color(0xFF8D5524), _avatar.skinTone, (c) => setState(() => _avatar.skinTone = c)),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Hair Style
                  const Text('Hair Style', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _choiceChip('Short', _avatar.hairStyle == 'short', () => setState(() => _avatar.hairStyle = 'short')),
                      _choiceChip('Long', _avatar.hairStyle == 'long', () => setState(() => _avatar.hairStyle = 'long')),
                      _choiceChip('Curly', _avatar.hairStyle == 'curly', () => setState(() => _avatar.hairStyle = 'curly')),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Hair Color
                  const Text('Hair Color', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _colorSelect(Colors.brown, _avatar.hairColor, (c) => setState(() => _avatar.hairColor = c)),
                      _colorSelect(Colors.black, _avatar.hairColor, (c) => setState(() => _avatar.hairColor = c)),
                      _colorSelect(const Color(0xFFD4AF37), _avatar.hairColor, (c) => setState(() => _avatar.hairColor = c)), // Blonde
                      _colorSelect(const Color(0xFFA52A2A), _avatar.hairColor, (c) => setState(() => _avatar.hairColor = c)), // Red
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Glasses
                  Row(
                    children: [
                      const Text('Glasses', style: TextStyle(fontWeight: FontWeight.bold)),
                      Switch(
                        value: _avatar.hasGlasses,
                        onChanged: (val) => setState(() => _avatar.hasGlasses = val),
                        activeColor: const Color(0xFF6C63FF),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Right: Preview
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFFF8F9FA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarPreview(avatar: _avatar),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_avatar.name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a name!')),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryBookPage(book: widget.book, avatar: _avatar),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Generate My Story'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _choiceChip(String label, bool isSelected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) => onTap(),
        selectedColor: const Color(0xFF6C63FF).withOpacity(0.2),
        labelStyle: TextStyle(color: isSelected ? const Color(0xFF6C63FF) : Colors.black),
      ),
    );
  }

  Widget _colorSelect(Color color, Color selectedColor, Function(Color) onSelect) {
    bool isSelected = color == selectedColor;
    return GestureDetector(
      onTap: () => onSelect(color),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF6C63FF) : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }
}

class AvatarPreview extends StatelessWidget {
  final AvatarData avatar;

  const AvatarPreview({super.key, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [const Color(0xFF6C63FF).withOpacity(0.1), Colors.transparent],
              ),
            ),
          ),
          
          // Avatar Drawing
          SizedBox(
            width: 250,
            height: 300,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Face
                Positioned(
                  top: 50,
                  child: Container(
                    width: 150,
                    height: 180,
                    decoration: BoxDecoration(
                      color: avatar.skinTone,
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                ),
                
                // Hair
                _buildHair(),

                // Eyes
                Positioned(
                  top: 110,
                  child: Row(
                    children: [
                      _eye(),
                      const SizedBox(width: 40),
                      _eye(),
                    ],
                  ),
                ),

                // Mouth
                Positioned(
                  top: 170,
                  child: Container(
                    width: 40,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),

                // Glasses
                if (avatar.hasGlasses)
                  Positioned(
                    top: 100,
                    child: Row(
                      children: [
                        _glassFrame(),
                        Container(width: 10, height: 2, color: Colors.black54),
                        _glassFrame(),
                      ],
                    ),
                  ),

                // Body (Shoulders)
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 200,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHair() {
    if (avatar.hairStyle == 'short') {
      return Positioned(
        top: 30,
        child: Container(
          width: 160,
          height: 60,
          decoration: BoxDecoration(
            color: avatar.hairColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(80)),
          ),
        ),
      );
    } else if (avatar.hairStyle == 'long') {
      return Positioned(
        top: 30,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Sides
            Container(
              width: 170,
              height: 200,
              decoration: BoxDecoration(
                color: avatar.hairColor,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            // Top
            Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                color: avatar.hairColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(80)),
              ),
            ),
          ],
        ),
      );
    } else { // Curly
       return Positioned(
        top: 20,
        child: Wrap(
          children: List.generate(12, (i) => Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: avatar.hairColor, shape: BoxShape.circle),
          )),
        ),
      );
    }
  }

  Widget _eye() {
    return Container(
      width: 15,
      height: 15,
      decoration: const BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
    );
  }

  Widget _glassFrame() {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class StoryBookPage extends StatefulWidget {
  final BookData book;
  final AvatarData avatar;

  const StoryBookPage({super.key, required this.book, required this.avatar});

  @override
  State<StoryBookPage> createState() => _StoryBookPageState();
}

class _StoryBookPageState extends State<StoryBookPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F2F6),
      appBar: AppBar(
        title: Text(widget.book.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(child: Text('Page ${_currentPage + 1} of 5', style: const TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Center(
        child: Container(
          width: 1000,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30)],
          ),
          child: Row(
            children: [
              // Left side: Illustration
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(scale: 0.8, child: AvatarPreview(avatar: widget.avatar)),
                      const SizedBox(height: 20),
                      Text(
                        'Inside the Story...',
                        style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Right side: Story Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chapter ${_currentPage + 1}',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.book.pages[_currentPage].replaceAll('[NAME]', widget.avatar.name),
                        style: const TextStyle(
                          fontSize: 24,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentPage > 0)
                            TextButton.icon(
                              onPressed: () => setState(() => _currentPage--),
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Back'),
                            )
                          else
                            const SizedBox(),
                          if (_currentPage < 4)
                            ElevatedButton.icon(
                              onPressed: () => setState(() => _currentPage++),
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text('Next Page'),
                            )
                          else
                            ElevatedButton(
                              onPressed: () {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Purchase functionality coming soon!')),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                              child: const Text('Buy This Book'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Original Components (Refactored to match new style) ---

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          const Icon(Icons.auto_stories, color: Color(0xFF6C63FF), size: 40),
          const SizedBox(width: 10),
          const Text(
            'MagicBooks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
          ),
          const Spacer(),
          _navLink('Home'),
          _navLink('Our Books'),
          _navLink('How it works'),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            ),
            child: const Text('Login / Signup'),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(onPressed: () {}, child: Text(title, style: const TextStyle(color: Color(0xFF636E72), fontWeight: FontWeight.w600))),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      color: const Color(0xFFF0F2FF),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Make Your Child the Hero of Their Own Adventure',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, height: 1.2),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create personalized books that spark imagination. Add your child\'s name, choose their appearance, and embark on magical journeys together.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF636E72), height: 1.5),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  ),
                  child: const Text('Start Creating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Image.asset('assets/images/space.png', width: 400),
          ),
        ],
      ),
    );
  }
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      color: const Color(0xFF2D3436),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _stepItem(Icons.edit, 'Customize', 'Enter name & pick appearance'),
          _stepItem(Icons.visibility, 'Preview', 'Read the story online'),
          _stepItem(Icons.local_shipping, 'Print', 'Delivered to your door'),
        ],
      ),
    );
  }

  Widget _stepItem(IconData icon, String title, String desc) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF6C63FF), size: 40),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 10),
        Text(desc, style: TextStyle(color: Colors.white.withOpacity(0.7))),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: const Center(child: Text('© 2026 MagicBooks Inc.')),
    );
  }
}
