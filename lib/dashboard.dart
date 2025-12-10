import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  // Index untuk Bottom Navigation Bar
  int _selectedIndex = 1; // Default ke "Wallet" sesuai gambar

  // Warna-warna utama dari desain
  final Color _greenColor = const Color(0xFF00BFA5); // Warna hijau kartu
  final Color _blueColor = const Color(0xFF446BF2); // Warna biru outline/text
  final Color _scaffoldBg = const Color(0xFFF8F9FE); // Background abu muda
  final Color _textDark = const Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. TOP GREEN CARD (Total Available)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _greenColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: _greenColor.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Available",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "\$24,562.80",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBalanceInfo("Checking", "\$18,420.50"),
                        _buildBalanceInfo("Savings", "\$6,142.30"),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 2. PAYMENT METHODS HEADER
              Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _textDark,
                ),
              ),

              const SizedBox(height: 16),

              // 3. PAYMENT CARDS LIST
              // Card 1: Visa (Primary - Blue Border)
              _buildPaymentCard(
                icon: Icons.credit_card,
                title: "Visa ending in 4589",
                subtitle: "Primary Card • Expires 12/28",
                isSelected: true,
                isPrimaryBadge: true,
                iconColor: Colors.blue.shade700,
                iconBg: Colors.blue.shade50,
              ),
              
              const SizedBox(height: 12),
              
              // Card 2: Mastercard
              _buildPaymentCard(
                icon: Icons.credit_card,
                title: "Mastercard ending in 1234",
                subtitle: "Secondary Card • Expires 08/26",
                isSelected: false,
                iconColor: Colors.orange.shade700,
                iconBg: Colors.orange.shade50,
              ),

              const SizedBox(height: 12),

              // Card 3: Apple Pay
              _buildPaymentCard(
                icon: Icons.phone_iphone,
                title: "Apple Pay",
                subtitle: "Digital Wallet • Connected",
                isSelected: false,
                iconColor: Colors.black87,
                iconBg: Colors.grey.shade100,
              ),

              const SizedBox(height: 24),

              // 4. QUICK ACTIONS HEADER
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _textDark,
                ),
              ),

              const SizedBox(height: 16),

              // 5. ACTION BUTTONS ROW
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text("Add Money"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _greenColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.swap_horiz),
                      label: const Text("Transfer"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _blueColor,
                        side: BorderSide(color: _blueColor),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 6. ACCOUNT DETAILS HEADER
              Text(
                "Account Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 16),

              // Account Number Input/Display with Blue Button
              Container(
                padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Number",
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "**** **** **** 1942", // Contoh nomor
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: _blueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Extra space bottom
            ],
          ),
        ),
      ),
      
      // 7. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _blueColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // WIDGET HELPER: Info Checking/Savings di dalam kartu hijau
  Widget _buildBalanceInfo(String label, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // WIDGET HELPER: Kartu Payment Method
  Widget _buildPaymentCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required Color iconColor,
    required Color iconBg,
    bool isPrimaryBadge = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: _blueColor, width: 1.5)
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (isPrimaryBadge) ...[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _blueColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Primary",
                          style: TextStyle(
                            color: _blueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}