import 'package:flutter/material.dart';

class GridItemLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Color baseColor;
  final Color highlightColor;

  const GridItemLoadingWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: baseColor),
    );
  }
}

class GridLoadingWidget extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final bool useSliver;
  final EdgeInsets padding;
  final Color baseColor;
  final Color highlightColor;
  final BorderRadius borderRadius;

  const GridLoadingWidget({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.8,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.useSliver = false,
    this.padding = const EdgeInsets.all(16),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  // Constructor for sliver usage
  const GridLoadingWidget.sliver({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.8,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.useSliver = true,
    this.padding = const EdgeInsets.all(16),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  // Constructor for product grid loading
  const GridLoadingWidget.products({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.7,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.useSliver = false,
    this.padding = const EdgeInsets.all(16),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  // Constructor for image grid loading
  const GridLoadingWidget.images({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.0,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.useSliver = false,
    this.padding = const EdgeInsets.all(16),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    final gridContent = GridView.builder(
      padding: padding,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return _buildGridItem(context);
      },
    );

    if (useSliver) {
      return SliverPadding(
        padding: padding,
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildGridItem(context),
            childCount: itemCount,
          ),
        ),
      );
    } else {
      return gridContent;
    }
  }

  Widget _buildGridItem(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder - Fixed height
            Container(
              height: _getImageHeight(context),
              width: double.infinity,
              decoration: BoxDecoration(
                color: highlightColor,
                borderRadius: BorderRadius.only(
                  topLeft: borderRadius.topLeft,
                  topRight: borderRadius.topRight,
                ),
              ),
            ),

            // Content area - Flexible to avoid overflow
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title placeholder
                    Container(
                      width: double.infinity,
                      height: 14,
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    // Subtitle placeholder
                    Container(
                      width: 80,
                      height: 12,
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    // Price/button area - Fixed height row
                    SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 14,
                            decoration: BoxDecoration(
                              color: baseColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: baseColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getImageHeight(BuildContext context) {
    final totalHeight =
        MediaQuery.of(context).size.width / crossAxisCount / childAspectRatio;
    return totalHeight * 0.5; // Reduced to 50% for more content space
  }
}

// Simplified version for pets loading
class PetsGridLoadingWidget extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final bool useSliver;

  const PetsGridLoadingWidget({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.useSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridLoadingWidget(
      itemCount: itemCount,
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1.0, // Square items for pets
      useSliver: useSliver,
      padding: const EdgeInsets.all(8.0),
    );
  }
}
