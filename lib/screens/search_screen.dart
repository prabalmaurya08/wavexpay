import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wavexpay/data/category_dummy_data.dart';
import 'package:wavexpay/widgets/category_section.dart';
import 'package:wavexpay/screens/recharge_home.dart';
import 'package:wavexpay/screens/bank_transfer_screen.dart';
import 'package:wavexpay/screens/offersandCashbackScreen.dart';
import 'package:wavexpay/screens/send_money_screen.dart';
import 'package:wavexpay/screens/balance_history_screen.dart';

/// SearchScreen - Search interface for finding services and offers
/// 
/// Features:
/// - Search bar with auto-focus
/// - Real-time search filtering
/// - Recent searches with history
/// - Popular searches
/// - All categories displayed using existing CategorySection
/// - Navigates to respective screens on tap
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  
  final List<String> _recentSearches = [
    'Mobile Recharge',
    'Electricity',
    'DTH',
    'Water',
  ];
  
  final List<String> _popularSearches = [
    'Mobile Recharge',
    'DTH Recharge',
    'Electricity Bill',
    'Water Bill',
    'FASTag Recharge',
    'Credit Card',
  ];

  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Auto-focus on search field when screen opens
    Future.delayed(const Duration(milliseconds: 300), () {
      _searchFocusNode.requestFocus();
    });
    
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        _isSearching = _searchQuery.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      // Custom AppBar with search bar
      appBar: _buildSearchAppBar(),
      
      body: _isSearching ? _buildSearchResults() : _buildDefaultView(),
    );
  }

  /// AppBar with search field
  PreferredSizeWidget _buildSearchAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      
      title: _buildSearchField(),
      
      actions: [
        if (_searchQuery.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear, color: Colors.black87),
            onPressed: () {
              _searchController.clear();
              _searchFocusNode.requestFocus();
            },
          ),
      ],
    );
  }

  /// Search text field
  Widget _buildSearchField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: 'Search For offer',
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey[400],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
            size: 24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  /// Default view - shows recent searches and all categories
  Widget _buildDefaultView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          
          // Recent Searches
          if (_recentSearches.isNotEmpty) ...[
            _buildRecentSearches(),
            const SizedBox(height: 24),
          ],
          
          // Popular Searches
          _buildPopularSearches(),
          
          const SizedBox(height: 24),
          
          // All Categories using your existing CategorySection widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategorySection(
                  title: "Popular",
                  categories: popularCategories,
                  bgColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 14),
                CategorySection(
                  title: "Utilities",
                  categories: utilitiesCategories,
                  bgColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 14),
                CategorySection(
                  title: "Donations & Devotion",
                  categories: donationsDevotionCategories,
                  bgColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 14),
                CategorySection(
                  title: "Financial Services & Taxes",
                  categories: financialServicesCategories,
                  bgColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 14),
                CategorySection(
                  title: "More Services",
                  categories: moreServicesCategories,
                  bgColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Recent searches section
  Widget _buildRecentSearches() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Searches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _recentSearches.clear();
                  });
                },
                child: const Text(
                  'Clear All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6A11CB),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _recentSearches.map((search) {
              return _buildSearchChip(
                search,
                icon: Icons.history,
                onTap: () {
                  _searchController.text = search;
                },
                onDelete: () {
                  setState(() {
                    _recentSearches.remove(search);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Popular searches section
  Widget _buildPopularSearches() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Searches',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularSearches.map((search) {
              return _buildSearchChip(
                search,
                icon: Icons.trending_up,
                onTap: () {
                  _searchController.text = search;
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Search chip widget
  Widget _buildSearchChip(
    String label, {
    required IconData icon,
    required VoidCallback onTap,
    VoidCallback? onDelete,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 6),
              InkWell(
                onTap: onDelete,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Search results view
  Widget _buildSearchResults() {
    // Get all categories for searching
    final allCategories = [
      ...moneyTransferCategories,
      ...popularCategories,
      ...utilitiesCategories,
      ...donationsDevotionCategories,
      ...financialServicesCategories,
      ...moreServicesCategories,
    ];

    // Filter categories based on search query
    final filteredCategories = allCategories.where((category) {
      return category['label']!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredCategories.isEmpty) {
      return _buildNoResults();
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        return _buildSearchResultItem(category);
      },
    );
  }

  /// Individual search result item
  Widget _buildSearchResultItem(Map<String, String> category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            final label = category['label']!;
            
            // Add to recent searches
            setState(() {
              _recentSearches.remove(label);
              _recentSearches.insert(0, label);
              if (_recentSearches.length > 5) {
                _recentSearches.removeLast();
              }
            });
            
            // Navigate to respective screen based on label
            _navigateToScreen(context, label);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    category['icon']!,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Label
                Expanded(
                  child: Text(
                    category['label']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                
                const SizedBox(width: 8),
                
                // Arrow
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigate to appropriate screen based on category label
  void _navigateToScreen(BuildContext context, String label) {
    Widget? screen;
    
    switch (label) {
      case 'Mobile Recharge':
        screen = const MobileRechargeHomeScreen();
        break;
      case 'To Bank/UPI':
        screen = const BankTransferScreen();
        break;
      case 'Self Account':
        screen = const Offersandcashbackscreen();
        break;
      case 'Pay To Contact':
        screen = const SendMoneyScreen();
        break;
      case 'Check Balance':
        screen = const BalanceHistoryScreen();
        break;
      // Add more cases as needed for other categories
      default:
        // Show coming soon message for unimplemented screens
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label - Coming Soon!'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
        return;
    }
    
    // Navigate to the screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen!),
    );
  }

  /// No results view
  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Results Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}