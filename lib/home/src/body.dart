part of '../home.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Builder(
          builder: (context) {
            if (MediaQuery.orientationOf(context) == Orientation.portrait) {
              return const PortraitBody();
            }
            return const LandscapeBody();
          },
        ),
      ),
    );
  }
}

class PortraitBody extends StatelessWidget {
  const PortraitBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 1500,
      child: Center(
        child: StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 8,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: NameCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: LifeCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: BioBlogCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: ContactCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: ProfessionalCircle(),
            ),
          ],
        ),
      ),
    );
  }
}

class LandscapeBody extends StatelessWidget {
  const LandscapeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1800,
      height: 800,
      child: Center(
        child: StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 18,
          children: const [
            // Top 2 circles start
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 4,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: LifeCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 3,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: BioBlogCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 4,
              child: SizedBox(),
            ),
            // Top 2 circles end
            // Middle 1 circle start
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: NameCircle(),
            ),
            // Middle 1 circle end
            // Bottom 2 circles start
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: ContactCircle(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 2,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: ProfessionalCircle(),
            ),
            // Bottom 2 circles end
          ],
        ),
      ),
    );
  }
}

class ProfessionalCircle extends StatelessWidget {
  const ProfessionalCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleWrapper(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go(NavigationRoutes.professional.path),
          child: Builder(builder: (context) {
            if (PlatformHelper.isWebMobile) {
              return const BigWidgetWrapper(
                  child: ImageWithAsset(
                      asset: Constants.professionalMobileImagePath));
            }
            return const FlipAnimation(
              front: BigWidgetWrapper(
                  child: ImageWithAsset(
                      asset: Constants.professionalFrontImagePath)),
              back: MoveWrapper(
                movable: BigWidgetWrapper(
                    isNotClippable: true,
                    child: ImageWithAsset(
                        asset: Constants.professionalMoveImagePath)),
                nonMovable: BigWidgetWrapper(
                    isTransparent: true,
                    child: ImageWithAsset(
                        asset: Constants.professionalBackImagePath)),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ContactCircle extends StatelessWidget {
  const ContactCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleWrapper(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LinksHelper.openInNewTab(Constants.contactUrl),
          child: Builder(builder: (context) {
            if (PlatformHelper.isWebMobile) {
              return const BigWidgetWrapper(
                  child:
                      ImageWithAsset(asset: Constants.contactMobileImagePath));
            }
            return const FlipAnimation(
              towardsLeft: false,
              front: BigWidgetWrapper(
                  child:
                      ImageWithAsset(asset: Constants.contactFrontImagePath)),
              back: MoveWrapper(
                isMovableOnTop: true,
                moveOnlyLeftRight: true,
                moveOffset: 25,
                movable: BigWidgetWrapper(
                    isTransparent: true,
                    isNotClippable: true,
                    child:
                        ImageWithAsset(asset: Constants.contactMoveImagePath)),
                nonMovable: BigWidgetWrapper(
                    child:
                        ImageWithAsset(asset: Constants.contactBackImagePath)),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NameCircle extends StatelessWidget {
  const NameCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleWrapper(child: NameStack());
  }
}

class BioBlogCircle extends StatelessWidget {
  const BioBlogCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleWrapper(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LinksHelper.openInNewTab(Constants.bioBlogUrl),
          child: Builder(builder: (context) {
            if (PlatformHelper.isWebMobile) {
              return const BigWidgetWrapper(
                  child:
                      ImageWithAsset(asset: Constants.bioBlogMobileImagePath));
            }
            return const FlipAnimation(
              front: BigWidgetWrapper(
                  child:
                      ImageWithAsset(asset: Constants.bioBlogFrontImagePath)),
              back: MoveWrapper(
                isMovableOnTop: true,
                moveOnlyTopBottom: true,
                moveOffset: 60,
                movable: BigWidgetWrapper(
                    isNotClippable: true,
                    isTransparent: true,
                    child:
                        ImageWithAsset(asset: Constants.bioBlogMoveImagePath)),
                nonMovable: BigWidgetWrapper(
                    // isTransparent: true,
                    child:
                        ImageWithAsset(asset: Constants.bioBlogBackImagePath)),
                movableCompleteTop: BigWidgetWrapper(
                    isNotClippable: true,
                    isTransparent: true,
                    child: ImageWithAsset(
                        asset: Constants.bioBlogMoveTopImagePath)),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class LifeCircle extends StatelessWidget {
  const LifeCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleWrapper(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LinksHelper.openInNewTab(Constants.lifeUrl),
          child: Builder(builder: (context) {
            if (PlatformHelper.isWebMobile) {
              return const BigWidgetWrapper(
                  child: ImageWithAsset(asset: Constants.lifeMobileImagePath));
            }
            return const FlipAnimation(
              towardsLeft: false,
              front: BigWidgetWrapper(
                  child: ImageWithAsset(asset: Constants.lifeFrontImagePath)),
              back: MoveWrapper(
                isMovableOnTop: true,
                moveOnlyTopBottom: true,
                moveOffset: 3,
                movable: BigWidgetWrapper(
                    isTransparent: true,
                    isNotClippable: true,
                    child: ImageWithAsset(asset: Constants.lifeMoveImagePath)),
                nonMovable: BigWidgetWrapper(
                    // isTransparent: true,
                    child: ImageWithAsset(asset: Constants.lifeBackImagePath)),
                nonMovableCompleteTop: BigWidgetWrapper(
                    isTransparent: true,
                    child:
                        ImageWithAsset(asset: Constants.lifeNonMoveImagePath)),
              ),
            );
          }),
        ),
      ),
    );
  }
}
