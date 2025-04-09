import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class NotificationsPreferenceScreen extends StatefulWidget {
  const NotificationsPreferenceScreen({super.key});

  @override
  State<NotificationsPreferenceScreen> createState() => _NotificationsPreferenceScreenState();
}

class _NotificationsPreferenceScreenState extends State<NotificationsPreferenceScreen> {
  bool messageNotifications = true;
  bool tripUpdates = true;
  bool localRecommendations = false;
  bool promotionalOffers = false;
  bool soundEnabled = true;
  bool vibrationEnabled = true;
  bool priorityNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Color(0xffF1F1F1),
        surfaceTintColor: Theme.of(context).cardColor,
        backgroundColor: Theme.of(context).cardColor,
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notification Preferences',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customize how and when you receive notifications from TripMates.',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).indicatorColor
                ),
              ),
              SizedBox(height: 24),

              // Notification Categories Section
              Text(
                'Notification Categories',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              _buildNotificationSwitch(
                title: "Messages",
                subtitle: "Get notified when you receive new messages",
                value: messageNotifications,
                onToggle: (val) => setState(() => messageNotifications = val),
              ),

              _buildNotificationSwitch(
                title: "Trip Updates",
                subtitle: "Receive updates about your upcoming trips",
                value: tripUpdates,
                onToggle: (val) => setState(() => tripUpdates = val),
              ),

              _buildNotificationSwitch(
                title: "Local Recommendations",
                subtitle: "Get suggestions for local experiences",
                value: localRecommendations,
                onToggle: (val) => setState(() => localRecommendations = val),
              ),

              _buildNotificationSwitch(
                title: "Promotional Offers",
                subtitle: "Receive special offers and discounts",
                value: promotionalOffers,
                onToggle: (val) => setState(() => promotionalOffers = val),
              ),

              Divider(height: 40, thickness: 1),

              // Notification Settings Section
              Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              _buildNotificationSwitch(
                title: "Sound",
                subtitle: "Play sound for incoming notifications",
                value: soundEnabled,
                onToggle: (val) => setState(() => soundEnabled = val),
              ),

              _buildNotificationSwitch(
                title: "Vibration",
                subtitle: "Vibrate for incoming notifications",
                value: vibrationEnabled,
                onToggle: (val) => setState(() => vibrationEnabled = val),
              ),

              _buildNotificationSwitch(
                title: "Priority Notifications",
                subtitle: "Show notifications as priority on your device",
                value: priorityNotifications,
                onToggle: (val) => setState(() => priorityNotifications = val),
              ),

              SizedBox(height: 24),

              // Notification Schedule Section
              Text(
                'Quiet Hours',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Set Quiet Hours",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Mute notifications during specific times",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Navigate to quiet hours settings
                },
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onToggle,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            FlutterSwitch(
              width: 56.0,
              height: 30.0,
              toggleSize: 30.0,
              value: value,
              padding: 1,
              borderRadius: 30.0,
              showOnOff: false,
              activeToggleColor: Color(0xff0F172A),
              onToggle: onToggle,
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}