import 'package:app_attendance_record/app/data/models/home/carrouselcourses_model.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class CarrouselHorizontal extends StatefulWidget {
  final List<CarrouselCourse> dataCourses;
  const CarrouselHorizontal({super.key, required this.dataCourses});

  @override
  // ignore: no_logic_in_create_state
  State<CarrouselHorizontal> createState() => _HorizontalState(dataCourses);
}

class _HorizontalState extends State<CarrouselHorizontal> {
  final List<CarrouselCourse>
      dataCourses; // Nuevo campo para almacenar el valor dataCourses

  _HorizontalState(this.dataCourses);
  // Wheater to loop through elements
  final bool _loop = true;

  // Scroll controller for carousel
  late InfiniteScrollController _controller;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  // Width of each item
  double? _itemExtent;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemExtent = screenWidth - 200;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 190,
          child: InfiniteCarousel.builder(
            itemCount: dataCourses.length,
            itemExtent: _itemExtent ?? 40,
            scrollBehavior: kIsWeb
                ? ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      // Allows to swipe in web browsers
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse
                    },
                  )
                : null,
            loop: _loop,
            controller: _controller,
            onIndexChanged: (index) {
              if (_selectedIndex != index) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            itemBuilder: (context, itemIndex, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    _controller.animateToItem(realIndex);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(dataCourses[itemIndex].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dataCourses[itemIndex].name),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(216, 230, 255, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.auto_stories_outlined,
                                size: 17,
                                color: PRIMARY_HARD,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15),
                            decoration: BoxDecoration(
                              color: SECONDARY,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Center(
                              child: Text(
                                "Ver más",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: SECONDARY_LIGHT,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
