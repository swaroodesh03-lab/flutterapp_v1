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
            const _FeaturedBooks(),
            const _HowItWorks(),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

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
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
            ),
          ),
          const Spacer(),
          _navLink('Home'),
          _navLink('Our Books'),
          _navLink('How it works'),
          _navLink('Pricing'),
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
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: Color(0xFF636E72), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Make Your Child the Hero of Their Own Adventure',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                    color: Color(0xFF2D3436),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create personalized books that spark imagination. Add your child\'s name, choose their appearance, and embark on magical journeys together.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF636E72),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Start Creating'),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        side: const BorderSide(color: Color(0xFF6C63FF)),
                      ),
                      child: const Text('View All Books'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 50,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/space.png',
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedBooks extends StatelessWidget {
  const _FeaturedBooks();

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
            children: const [
              _BookCard(
                title: 'Space Adventure',
                image: 'assets/images/space.png',
                description: 'A journey across the galaxy for little astronauts.',
                price: '\$24.99',
              ),
              _BookCard(
                title: 'Jungle Explorer',
                image: 'assets/images/jungle.png',
                description: 'Meet wild friends in the heart of the jungle.',
                price: '\$24.99',
              ),
              _BookCard(
                title: 'Underwater Mystery',
                image: 'assets/images/underwater.png',
                description: 'Dive deep into a world of magic and mermaids.',
                price: '\$24.99',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String price;

  const _BookCard({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });

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
              image,
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
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(color: Color(0xFF636E72), height: 1.4),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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

class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      color: const Color(0xFF2D3436),
      child: Column(
        children: [
          const Text(
            'How It Works',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _stepItem(Icons.edit, 'Customize', 'Enter name & pick appearance'),
              _stepItem(Icons.visibility, 'Preview', 'Read the whole story online'),
              _stepItem(Icons.local_shipping, 'Print & Ship', 'High quality book to your door'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stepItem(IconData icon, String title, String desc) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFF6C63FF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        ),
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
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2026 MagicBooks Inc. All rights reserved.',
                style: TextStyle(color: Color(0xFF636E72)),
              ),
              Row(
                children: [
                  _footerLink('Privacy Policy'),
                  _footerLink('Terms of Service'),
                  _footerLink('Contact Us'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _footerLink(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        title,
        style: const TextStyle(color: Color(0xFF636E72), fontWeight: FontWeight.w600),
      ),
    );
  }
}
