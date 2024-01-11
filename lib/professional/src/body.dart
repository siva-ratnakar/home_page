part of '../professional.dart';

class ProfessionalBody extends StatelessWidget {
  const ProfessionalBody({super.key});

  final proffItems = Constants.professionalItems;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final backImageSize = min(screenHeight, screenWidth) * 0.2;
    return RawScrollbar(
      controller: ProfessionalScreenHelper().scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      radius: const Radius.circular(20),
      thickness: 10,
      thumbColor: Colors.black,
      child: ListWheelScrollView.useDelegate(
        physics: const FixedExtentScrollPhysics(),
        controller: ProfessionalScreenHelper().scrollController,
        // TODO(immadisairaj): Fix when magnifier is true or find another soln.
        // useMagnifier: true,
        magnification: 1,
        squeeze: 0.9,
        itemExtent: screenHeight * 0.9,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: proffItems.length,
          builder: (context, index) {
            return SizedBox(
              key: ValueKey(index),
              width: screenWidth * 0.9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.12,
                        vertical: screenHeight * 0.12,
                      ),
                      child: proffItems[index].itemsList == null ||
                              proffItems[index].itemsList!.isEmpty
                          ? const UnderConstruction(
                              color: Colors.black12,
                              textColor: Colors.black,
                            )
                          : CarouselBody(items: proffItems[index].itemsList!),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                        left: 8,
                      ),
                      child: SizedBox(
                        width: backImageSize,
                        height: backImageSize,
                        child: Image.asset(
                          proffItems[index].iconImagePath,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CarouselBody extends StatelessWidget {
  const CarouselBody({super.key, required this.items});

  final List<CarouselItem> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        // TODO(immadisairaj): finish this widget
        child: Center(
          child: Text(items[index].title),
        ),
      ),
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        enableInfiniteScroll: false,
        pauseAutoPlayOnTouch: true,
        disableCenter: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
