import 'package:flutter/material.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isGrid;
  final int discount;
  final VoidCallback onDiscountTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.isGrid,
    required this.discount,
    required this.onDiscountTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final poster = SizedBox(
      height: isGrid ? 210 : 150,
      width: isGrid ? double.infinity : 112,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(movie.image, fit: BoxFit.cover),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.star, size: 14, color: Colors.white),
                const SizedBox(width: 3),
                Text(movie.rating.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ]),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border, color: Colors.white),
              style: IconButton.styleFrom(backgroundColor: Colors.black45),
              tooltip: 'Bookmark',
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(6)),
              child: Text('${movie.year}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
            ),
          ),
        ],
      ),
    );

    final details = Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(movie.title, maxLines: 2, overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(movie.genre, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600)),
          const SizedBox(height: 10),
          InkWell(
            onTap: onDiscountTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.local_offer_outlined, size: 15, color: theme.colorScheme.onPrimaryContainer),
                const SizedBox(width: 5),
                Text('$discount% OFF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: theme.colorScheme.onPrimaryContainer)),
              ]),
            ),
          ),
        ],
      ),
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: isGrid
          ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [poster, Expanded(child: details)])
          : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [poster, Expanded(child: details)]),
    );
  }
}
