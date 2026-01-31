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
  String imagePath;
  Color skinTone;
  Color hairColor;

  AvatarData({
    this.name = '',
    this.gender = 'boy',
    this.imagePath = 'assets/images/characters/boy1.png',
    this.skinTone = const Color(0xFFFFDBAC),
    this.hairColor = Colors.brown,
  });
}

class BookData {
  final String title;
  final String coverImage;
  final String description;
  final String price;
  final List<String> pages;
  final bool isISpy;

  BookData({
    required this.title,
    required this.coverImage,
    required this.description,
    required this.price,
    required this.pages,
    this.isISpy = false,
  });
}

final List<String> boyCharacters = List.generate(6, (i) => 'assets/images/characters/boy${i + 1}.png');
final List<String> girlCharacters = List.generate(6, (i) => 'assets/images/characters/girl${i + 1}.png');

final List<BookData> books = [
  BookData(
    title: 'I Spy Adventure',
    coverImage: 'assets/images/cover_updated.jpg',
    description: 'A classic game of I Spy, personalized just for you!',
    price: '\$24.99',
    isISpy: true,
    pages: [
      "I spy with my little eye, [NAME] hiding behind a big red boat! Can you find them?",
      "Now [NAME] is near the lighthouse. Is that a cat climbing up the stairs? Keep looking!",
      "I spy [NAME] in a submarine! Deep under the sea, looking for sunken treasure.",
      "Look! [NAME] is riding in a helicopter over a field of giant strawberries. How silly!",
      "Finally, I spy [NAME] at home, reading their very own 'I Spy' book. Great job, explorer!"
    ],
  ),
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
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(book.coverImage == 'assets/images/cover_updated.jpg' ? 'assets/images/cover_updated.jpg' : (book.coverImage == 'assets/images/cover.jpg' ? 'assets/images/cover.jpg' : book.coverImage), height: 350, width: 300, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
                const SizedBox(height: 10),
                Text(book.description, style: const TextStyle(color: Color(0xFF636E72), height: 1.4)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(book.price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF6C63FF))),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalizationPage(book: book)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

  final List<Color> _skinTones = [
    const Color(0xFFFFDBAC),
    const Color(0xFFF1C27D),
    const Color(0xFFE0AC69),
    const Color(0xFF8D5524),
    const Color(0xFFC68642),
  ];

  final List<Color> _hairColors = [
    Colors.brown,
    const Color(0xFF4B2C20),
    const Color(0xFF000000),
    const Color(0xFFD4A017),
    const Color(0xFFA52A2A),
    const Color(0xFFE2A76F),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personalizing: ${widget.book.title}'), elevation: 0, backgroundColor: Colors.transparent),
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
                  const Text('Customize Your Hero', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
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
                  const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _choiceChip('Boy', _avatar.gender == 'boy', () {
                        setState(() {
                          _avatar.gender = 'boy';
                          _avatar.imagePath = boyCharacters[0];
                        });
                      }),
                      _choiceChip('Girl', _avatar.gender == 'girl', () {
                        setState(() {
                          _avatar.gender = 'girl';
                          _avatar.imagePath = girlCharacters[0];
                        });
                      }),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('Skin Tone', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _skinTones.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() => _avatar.skinTone = _skinTones[index]),
                          child: Container(
                            width: 40,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: _skinTones[index],
                              shape: BoxShape.circle,
                              border: Border.all(color: _avatar.skinTone == _skinTones[index] ? Colors.blue : Colors.grey, width: 2),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('Hair Color', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _hairColors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() => _avatar.hairColor = _hairColors[index]),
                          child: Container(
                            width: 40,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: _hairColors[index],
                              shape: BoxShape.circle,
                              border: Border.all(color: _avatar.hairColor == _hairColors[index] ? Colors.blue : Colors.grey, width: 2),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('Select Character Base', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      String path = _avatar.gender == 'boy' ? boyCharacters[index] : girlCharacters[index];
                      bool isSelected = _avatar.imagePath == path;
                      return GestureDetector(
                        onTap: () => setState(() => _avatar.imagePath = path),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: isSelected ? const Color(0xFF6C63FF) : Colors.transparent, width: 3),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Image.asset(path),
                        ),
                      );
                    },
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text('Book Preview', style: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    BookCoverPreview(avatar: _avatar, book: widget.book),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (_avatar.name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a name!')));
                          return;
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StoryBookPage(book: widget.book, avatar: _avatar)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Generate My Story'),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
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
}

class BookCoverPreview extends StatelessWidget {
  final AvatarData avatar;
  final BookData book;
  const BookCoverPreview({super.key, required this.avatar, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background cover
            Image.asset('assets/images/cover_updated.jpg', width: 400, height: 400, fit: BoxFit.cover),
            
            // Character with tone filters inside a circular lens - Adjusted to cover placeholder
            Positioned(
              top: 85, // Moved up to align with magnifying glass lens
              left: 85, // Moved left to align
              child: SizedBox(
                width: 230, // Increased size to fully cover white character placeholder
                height: 230,
                child: Center(
                  child: ClipOval(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(avatar.skinTone.withOpacity(0.12), BlendMode.multiply),
                      child: Image.asset(avatar.imagePath, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            
            // Name
            Positioned(
              bottom: 40,
              child: Text(
                avatar.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(offset: const Offset(2, 2), blurRadius: 4, color: Colors.black.withOpacity(0.5)),
                    Shadow(offset: const Offset(-1, -1), blurRadius: 0, color: Colors.grey[400]!),
                  ],
                ),
              ),
            ),
          ],
        ),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                  child: Center(
                    child: _currentPage == 0
                        ? Transform.scale(scale: 0.8, child: BookCoverPreview(avatar: widget.avatar, book: widget.book))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            ClipOval(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(widget.avatar.skinTone.withOpacity(0.12), BlendMode.multiply),
                                child: Image.asset(widget.avatar.imagePath, height: 300, width: 300, fit: BoxFit.cover),
                              ),
                            ),
                              const SizedBox(height: 20),
                              Text('Inside the Story...', style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic)),
                            ],
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chapter ${_currentPage + 1}', style: TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                      const SizedBox(height: 20),
                      Text(
                        widget.book.pages[_currentPage].replaceAll('[NAME]', widget.avatar.name),
                        style: const TextStyle(fontSize: 24, height: 1.6, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentPage > 0)
                            TextButton.icon(onPressed: () => setState(() => _currentPage--), icon: const Icon(Icons.arrow_back), label: const Text('Back'))
                          else
                            const SizedBox(),
                          if (_currentPage < 4)
                            ElevatedButton.icon(onPressed: () => setState(() => _currentPage++), icon: const Icon(Icons.arrow_forward), label: const Text('Next Page'))
                          else
                            ElevatedButton(
                              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed! (Demo only)'))),
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

// --- Original Components Refactored ---

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
          const Text('MagicBooks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
          const Spacer(),
          _navLink('Home'),
          _navLink('Our Books'),
          _navLink('How it works'),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C63FF), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
            child: const Text('Login / Signup'),
          ),
        ],
      ),
    );
  }
  Widget _navLink(String title) => Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: TextButton(onPressed: () {}, child: Text(title, style: const TextStyle(color: Color(0xFF636E72), fontWeight: FontWeight.w600))));
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
                const Text('Make Your Child the Hero of Their Own Adventure', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, height: 1.2)),
                const SizedBox(height: 20),
                const Text('Create personalized books that spark imagination. Add your child\'s name, choose their appearance, and embark on magical journeys together.', style: TextStyle(fontSize: 18, color: Color(0xFF636E72), height: 1.5)),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C63FF), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20)),
                  child: const Text('Start Creating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(child: Image.asset('assets/images/cover_updated.jpg', width: 400)),
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
          _stepItem(Icons.edit, 'Customize', 'Enter name & pick character'),
          _stepItem(Icons.visibility, 'Preview', 'Read the story online'),
          _stepItem(Icons.local_shipping, 'Print', 'Delivered to your door'),
        ],
      ),
    );
  }
  Widget _stepItem(IconData icon, String title, String desc) => Column(children: [Icon(icon, color: const Color(0xFF6C63FF), size: 40), const SizedBox(height: 20), Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 10), Text(desc, style: TextStyle(color: Colors.white.withOpacity(0.7)))]);
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40), child: const Center(child: Text('© 2026 MagicBooks Inc.')));
  }
}
