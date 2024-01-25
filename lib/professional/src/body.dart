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
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: ProfessionalScreenHelper().scrollController,
        itemCount: proffItems.length,
        itemBuilder: (context, index) {
          final offset = PlatformHelper.isWebMobile ? 0.08 : 0.12;
          final horizontalSize = screenWidth * offset;
          final verticalSize = screenHeight * offset;
          return Padding(
            key: ValueKey(index),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalSize,
                      vertical: verticalSize,
                    ),
                    child: proffItems[index].itemsList == null ||
                            proffItems[index].itemsList!.isEmpty
                        ? const UnderConstruction(
                            color: Colors.black12,
                            textColor: Colors.black,
                          )
                        : _getCarousel(index),
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
    );
  }

  Widget _getCarousel(int index) {
    if (PlatformHelper.isWebMobile) {
      return CarouselBody(items: proffItems[index].itemsList!);
    }
    final carouselController = CarouselController();
    return CarouselBodyWrapper(
      body: CarouselBody(
        items: proffItems[index].itemsList!,
        carouselController: carouselController,
      ),
      carouselController: carouselController,
    );
  }
}

class CarouselBodyWrapper extends StatelessWidget {
  const CarouselBodyWrapper({
    super.key,
    required this.body,
    this.carouselController,
  });

  final CarouselBody body;
  final CarouselController? carouselController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // TODO(immadisairaj): adjust icon button sizes
      children: [
        Center(
          child: IconButton(
            onPressed: () {
              if (carouselController != null && carouselController!.ready) {
                carouselController!.previousPage();
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        Expanded(child: body),
        Center(
          child: IconButton(
            onPressed: () {
              if (carouselController != null && carouselController!.ready) {
                carouselController!.nextPage();
              }
            },
            icon: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ),
      ],
    );
  }
}

class CarouselBody extends StatelessWidget {
  const CarouselBody({
    super.key,
    required this.items,
    this.carouselController,
  });

  final List<CarouselItem> items;
  final CarouselController? carouselController;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: const [0.0, 0.2, 0.8, 1.0],
        colors: [
          Theme.of(context).colorScheme.background,
          Colors.transparent,
          Colors.transparent,
          Theme.of(context).colorScheme.background,
        ],
      ).createShader(rect),
      blendMode: BlendMode.dstOut,
      child: CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: items.length,
        itemBuilder: (context, index, realIndex) {
          final isFlippable = items[index].flipText != null;
          final isClickable = items[index].link != null;
          return GestureDetector(
            onTap: isClickable
                ? () {
                    // if the platform is on mobile and is flippable,
                    // don't have clicks as the click flips the card
                    if (isFlippable && PlatformHelper.isWebMobile) return;
                    LinksHelper.openInNewTab(items[index].link!);
                  }
                : null,
            child: MouseRegion(
              cursor:
                  isClickable ? SystemMouseCursors.click : MouseCursor.defer,
              // TODO(immadisairaj): finish the text style of this widget
              child: isFlippable
                  ? FlipAnimation(
                      flipOnClickOnly: PlatformHelper.isWebMobile,
                      front: CardContentWrapper(
                        child: CardFront(item: items[index]),
                      ),
                      back: CardContentWrapper(
                        child: Center(
                          child: Text(
                            items[index].flipText!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ).center,
                        ),
                      ),
                    )
                  : CardContentWrapper(
                      child: CardFront(item: items[index]),
                    ),
            ),
          );
        },
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          disableCenter: true,
          enableInfiniteScroll: false,
          pauseAutoPlayOnTouch: true,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          autoPlayInterval: Constants.carouselIntervalDuration,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          viewportFraction: 0.6,
        ),
      ),
    );
  }
}

class CardContentWrapper extends StatelessWidget {
  const CardContentWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Theme.of(context).colorScheme.background,
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      child: child,
    );
  }
}

class CardFront extends StatelessWidget {
  const CardFront({
    super.key,
    required this.item,
  });

  final CarouselItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).center,
        if (item.description != null)
          Text(
            item.description!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  // TODO(immadisairaj): check the overflow
                  // situation with more text
                  overflow: TextOverflow.visible,
                ),
          ).center,
        Text(
          item.time,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(),
        ).center,
      ],
    );
  }
}
