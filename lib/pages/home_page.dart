import 'package:flutter/material.dart';
import 'package:ostello_assignment/custom_widgets/home_page_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool online = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 248, 248, 248),
          title: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
              SizedBox(width: 10),
              Text(
                'Hi,',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Krishna',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 30,
                  ),
                  Positioned(
                    right: 3,
                    top: -1,
                    child: Container(
                      padding: const EdgeInsets.all(3.5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              backgroundColor: const Color.fromARGB(255, 248, 248, 248),
              floating: true,
              title: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          online = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            online ? const Color.fromARGB(255, 46, 49, 57) : const Color.fromARGB(255, 248, 248, 248),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Online',
                        style: TextStyle(
                          color: !online
                              ? const Color.fromARGB(255, 46, 49, 57)
                              : const Color.fromARGB(255, 248, 248, 248),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          online = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !online ? const Color.fromARGB(255, 46, 49, 57) : const Color.fromARGB(255, 248, 248, 248),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Offline',
                        style: TextStyle(
                          color:
                              online ? const Color.fromARGB(255, 46, 49, 57) : const Color.fromARGB(255, 248, 248, 248),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SectionCard(
                      title: 'Live Sections on JEE Exams',
                      buttonText: 'Join',
                      color: Colors.yellow[100]!,
                    ),
                    SectionCard(
                      title: 'Free Courses',
                      buttonText: 'Join',
                      color: Colors.orange[100]!,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconRowCard(title: 'Free Courses'),
                    IconRowCard(title: 'Attendance'),
                    IconRowCard(title: 'Store'),
                    IconRowCard(title: 'Assessment'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(child: ToppersSection()),
            const SliverToBoxAdapter(child: PopularCoursesSection()),
            const SliverToBoxAdapter(child: AllCoursesSection()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            const SliverToBoxAdapter(child: ReferAndEarnSection()),
          ],
        ),
      ),
    );
  }
}
