import 'package:flutter/material.dart';
import '../../data/occasion_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/hover_pop.dart';

/// Shows the rituals available for a chosen occasion and lets the devotee
/// select one or more to proceed with booking.
class OccasionDetailScreen extends StatefulWidget {
  final OccasionItem occasion;

  const OccasionDetailScreen({super.key, required this.occasion});

  @override
  State<OccasionDetailScreen> createState() => _OccasionDetailScreenState();
}

class _OccasionDetailScreenState extends State<OccasionDetailScreen> {
  int _selectedNav = 0;
  String? _expandedId;
  final Set<String> _selectedIds = {};

  void _toggleSelected(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final occ = widget.occasion;
    final rituals = ritualsFor(occ.id);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(context, occ),
                _buildInfoBanner(occ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      16,
                      16,
                      _selectedIds.isEmpty ? 16 : 96,
                    ),
                    itemCount: rituals.length,
                    itemBuilder: (_, i) => _RitualCard(
                      ritual: rituals[i],
                      occasion: occ,
                      isExpanded: _expandedId == rituals[i].id,
                      isSelected: _selectedIds.contains(rituals[i].id),
                      onToggleExpand: () => setState(() {
                        _expandedId = _expandedId == rituals[i].id
                            ? null
                            : rituals[i].id;
                      }),
                      onToggleSelect: () => _toggleSelected(rituals[i].id),
                    ),
                  ),
                ),
              ],
            ),
            if (_selectedIds.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildProceedBar(occ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _selectedNav,
        onTap: (i) {
          setState(() => _selectedNav = i);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, OccasionItem occ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
      decoration: BoxDecoration(
        color: occ.color,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(occ.emoji, style: const TextStyle(fontSize: 44)),
          const SizedBox(height: 8),
          Text(
            occ.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'serif',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            occ.tamil,
            style: const TextStyle(fontSize: 13, color: Color(0xCCFFFFFF)),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBanner(OccasionItem occ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9E6),
          border: Border.all(color: const Color(0xFFE5D3B3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline, size: 16, color: Color(0xFFA16207)),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF854D0E),
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: 'Curated rituals for '),
                    TextSpan(
                      text: occ.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text:
                          ' — performed by certified Agamic priests at verified temples.',
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

  Widget _buildProceedBar(OccasionItem occ) {
    final count = _selectedIds.length;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: const Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: occ.color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: () {},
          child: Text(
            'Proceed with $count ritual${count > 1 ? 's' : ''} →',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _RitualCard extends StatelessWidget {
  final Ritual ritual;
  final OccasionItem occasion;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onToggleExpand;
  final VoidCallback onToggleSelect;

  const _RitualCard({
    required this.ritual,
    required this.occasion,
    required this.isExpanded,
    required this.isSelected,
    required this.onToggleExpand,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return HoverPop(
      borderRadius: BorderRadius.circular(16),
      enableTapFeedback: false,
      hoverScale: 1.015,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: isSelected ? occasion.color : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: occasion.bg,
                      border: Border.all(
                        color: occasion.color.withValues(alpha: 0.15),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      ritual.emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ritual.popular)
                          Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFA0400B),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '✦ MOST POPULAR',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        Text(
                          ritual.name,
                          style: const TextStyle(
                            fontFamily: 'serif',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.text,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          ritual.tamil,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textMed,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          ritual.description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textMed,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.textMed,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ritual.duration,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textMed,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.textMed,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ritual.location,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textMed,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: occasion.bg,
                      border: Border.all(
                        color: occasion.color.withValues(alpha: 0.3),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '₹${ritual.price}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: occasion.color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(color: AppColors.border, height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onToggleExpand,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isExpanded ? 'Hide Details' : 'View Details',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA16207),
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 16,
                          color: const Color(0xFFA16207),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: onToggleSelect,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSelected
                          ? occasion.color
                          : Colors.transparent,
                      foregroundColor: isSelected
                          ? Colors.white
                          : occasion.color,
                      side: BorderSide(color: occasion.color, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      isSelected ? '✓ Selected' : 'Select →',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              if (isExpanded)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAF8),
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    ritual.detail,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.text,
                      height: 1.6,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
