// Shimmer effect grid loading (fixed version)
import 'package:flutter/material.dart';

class ShimmerGridLoadingWidget extends StatefulWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final bool useSliver;

  const ShimmerGridLoadingWidget({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
    this.useSliver = false,
  });

  @override
  State<ShimmerGridLoadingWidget> createState() =>
      _ShimmerGridLoadingWidgetState();
}

class _ShimmerGridLoadingWidgetState extends State<ShimmerGridLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gridContent = GridView.builder(
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return _buildShimmerGridItem(context);
      },
    );

    if (widget.useSliver) {
      return SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            childAspectRatio: widget.childAspectRatio,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildShimmerGridItem(context),
            childCount: widget.itemCount,
          ),
        ),
      );
    } else {
      return gridContent;
    }
  }

  Widget _buildShimmerGridItem(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: _getShimmerColor(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Container(
                  height:
                      MediaQuery.of(context).size.width /
                      widget.crossAxisCount /
                      widget.childAspectRatio *
                      0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _getShimmerColor(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),

                // Content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Container(
                          width: double.infinity,
                          height: 14,
                          decoration: BoxDecoration(
                            color: _getShimmerColor(),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        // Subtitle
                        Container(
                          width: 80,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _getShimmerColor(),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        // Bottom row
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: _getShimmerColor(),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _getShimmerColor(),
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
      },
    );
  }

  Color _getShimmerColor() {
    final value = _controller.value;
    return value < 0.5 ? const Color(0xFFE0E0E0) : const Color(0xFFF5F5F5);
  }
}
