
/// Notification Category Enum
enum NotificationCategory {
  transaction,
  offer,
  update,
  system,
}

/// Notification Item Model
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String time;
  final NotificationCategory category;
  bool isRead;
  final String? actionLabel;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.category,
    this.isRead = false,
    this.actionLabel,
  });
}


List<NotificationItem> generateDummyNotifications() {
  return [
    NotificationItem(
      id: '1',
      title: 'Payment Successful',
      message: 'You have successfully paid ₹500.00 to Swiggy. Your order is being processed.',
      time: '2 minutes ago',
      category: NotificationCategory.transaction,
      actionLabel: 'View Receipt',
    ),
    NotificationItem(
      id: '2',
      title: '🎉 Flat 50% Cashback',
      message: 'Get flat 50% cashback up to ₹100 on your next mobile recharge. Valid till tomorrow!',
      time: '1 hour ago',
      category: NotificationCategory.offer,
      actionLabel: 'Recharge Now',
    ),
    NotificationItem(
      id: '3',
      title: 'Money Received',
      message: 'You received ₹1,200.00 from Rahul Sharma via UPI. Balance: ₹3,450.50',
      time: '3 hours ago',
      category: NotificationCategory.transaction,
      isRead: true,
      actionLabel: 'View Details',
    ),
    NotificationItem(
      id: '4',
      title: 'DTH Recharge Successful',
      message: 'Your DTH recharge for Tata Sky has been completed successfully. Service valid till Dec 15, 2025.',
      time: 'Yesterday',
      category: NotificationCategory.transaction,
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: '💰 Cashback Credited',
      message: 'Congratulations! Cashback of ₹25.00 has been credited to your wallet.',
      time: 'Yesterday',
      category: NotificationCategory.offer,
      isRead: true,
      actionLabel: 'View Wallet',
    ),
    NotificationItem(
      id: '6',
      title: 'New Feature: Bill Reminders',
      message: 'Never miss a bill payment! Set up automatic reminders for your electricity, water, and gas bills.',
      time: '2 days ago',
      category: NotificationCategory.update,
      actionLabel: 'Set Reminder',
    ),
    NotificationItem(
      id: '7',
      title: 'Bill Payment Due',
      message: 'Your electricity bill payment of ₹845.00 is due on Nov 5, 2025. Pay now to avoid late fees.',
      time: '2 days ago',
      category: NotificationCategory.update,
      isRead: true,
      actionLabel: 'Pay Now',
    ),
    NotificationItem(
      id: '8',
      title: 'Security Alert',
      message: 'Your account was accessed from a new device on Oct 29, 2025 at 10:30 AM. If this wasn\'t you, please contact support immediately.',
      time: '3 days ago',
      category: NotificationCategory.system,
      isRead: true,
      actionLabel: 'Review Activity',
    ),
    NotificationItem(
      id: '9',
      title: '🎁 Refer & Earn',
      message: 'Refer your friends and earn ₹50 for each successful referral. Your friend gets ₹50 too!',
      time: '4 days ago',
      category: NotificationCategory.offer,
      isRead: true,
      actionLabel: 'Start Referring',
    ),
    NotificationItem(
      id: '10',
      title: 'KYC Verification Pending',
      message: 'Complete your KYC verification to unlock higher transaction limits and enjoy premium features.',
      time: '5 days ago',
      category: NotificationCategory.system,
      isRead: true,
      actionLabel: 'Complete KYC',
    ),
  ];
}