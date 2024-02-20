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
          const offset = 0.1;
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
      return CarouselBody(
        key: Key('CAROUSEL_BODY_$index'),
        items: proffItems[index].itemsList!,
        currentIndex: index,
      );
    }
    final carouselController = CarouselController();
    return CarouselBodyWrapper(
      body: CarouselBody(
        key: Key('CAROUSEL_BODY_$index'),
        items: proffItems[index].itemsList!,
        currentIndex: index,
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

class CarouselBody extends StatefulWidget {
  const CarouselBody({
    super.key,
    required this.items,
    required this.currentIndex,
    this.carouselController,
  });

  final List<CarouselItem> items;
  final int currentIndex;
  final CarouselController? carouselController;

  @override
  State<CarouselBody> createState() => _CarouselBodyState();
}

class _CarouselBodyState extends State<CarouselBody> {
  final _scrollController = ProfessionalScreenHelper().scrollController;
  final sections = Constants.professionalItems.length;

  late bool _isVisible;

  @override
  void initState() {
    super.initState();

    // the first carousel is visible when initialized
    _isVisible = widget.currentIndex == 0;
    _scrollController.addListener(listener);
  }

  @override
  dispose() {
    _scrollController.removeListener(listener);
    super.dispose();
  }

  listener() {
    if (_scrollController.hasClients) {
      final currentOffset = _scrollController.offset;
      final maxOffset = _scrollController.position.maxScrollExtent;

      var currentSection = (currentOffset / maxOffset * sections).ceil();
      currentSection = currentSection < 1 ? 1 : currentSection;
      currentSection = currentSection > sections ? sections : currentSection;

      final isVisible = currentSection == widget.currentIndex + 1;

      if (isVisible != _isVisible) {
        setState(() {
          _isVisible = isVisible;
        });
      }
    }
  }

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
        carouselController: widget.carouselController,
        itemCount: widget.items.length,
        itemBuilder: (context, index, realIndex) {
          return CarouselChild(
            key: Key('CAROUSEL_CHILD_$index'),
            items: widget.items,
            index: index,
          );
        },
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          pageViewKey: PageStorageKey('PAGE_VIEW_${widget.currentIndex}'),
          disableCenter: true,
          enableInfiniteScroll: false,
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          autoPlay: _isVisible,
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

class CarouselChild extends StatelessWidget {
  const CarouselChild({
    super.key,
    required this.items,
    required this.index,
  });

  final List<CarouselItem> items;
  final int index;

  @override
  Widget build(BuildContext context) {
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
        cursor: isClickable ? SystemMouseCursors.click : MouseCursor.defer,
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
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
    return LayoutBuilder(builder: (context, constraints) {
      final cardHeight = constraints.maxHeight * 0.7;
      final cardWidth = constraints.maxWidth * 0.9;
      return Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).colorScheme.background,
          ),
          height: cardHeight,
          width: cardWidth,
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      );
    });
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
          maxLines: 3,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
        ).center,
        if (item.description != null)
          Text(
            item.description!,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  // TODO(immadisairaj): check the overflow
                  // situation with more text
                  overflow: TextOverflow.visible,
                ),
          ).center,
        Text(
          item.time,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        ).center,
      ],
    );
  }
}
