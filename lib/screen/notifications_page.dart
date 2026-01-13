import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/NotificationGetAll.dart';
import 'package:projectq/screen/home.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<NotificationData>? allNotifications;
  List<NotificationData>? unreadNotifications;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<UserCubit>().getAllnotification();
    context.read<UserCubit>().getAllnotificationNotread();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return S.of(context).now;
    } else if (difference.inMinutes < 60) {
      return ' ${difference.inMinutes} ${S.of(context).minute}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${S.of(context).hour}';
    } else if (difference.inDays < 7) {
      return ' ${difference.inDays} ${S.of(context).day}';
    } else {
      return DateFormat('d MMMM yyyy', S.of(context).ar).format(dateTime);
    }
  }

  Widget _buildNotificationList(List<NotificationData>? notifications) {
    if (notifications == null || notifications.isEmpty) {
      return Center(
        child: Text(
          S.of(context).noNotification,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return GestureDetector(
          onTap: () {
            context.read<UserCubit>().ReadNotificationNotread(xx: item.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NotificationDetailsPage(notification: item),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 14),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 28,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.data["message"] ?? 'إشعار جديد',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.data["new_status"] ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _formatDateTime(item.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    Home(role: CacheHelper().getData(key: "role")),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(S.of(context).notification),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                S.of(context).Alll,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).notread,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is GetAllnotificationSuccess) {
            allNotifications = state.notificationResponse.data;
          } else if (state is NGetAllnotificationNotreadSuccess) {
            unreadNotifications = state.notRead.data;
          } else if (state is GetAllnotificationFailure) {
            errorMessage = state.errorMessage;
          }
        },
        builder: (context, state) {
          if (state is GetAllnotificationloading ||
              state is NGetAllnotificationNotredloading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          if (errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 60),
                  SizedBox(height: 16),
                  Text(
                    S.of(context).err,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserCubit>().getAllnotification();
                      context.read<UserCubit>().getAllnotificationNotread();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(S.of(context).again),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildNotificationList(allNotifications),
              _buildNotificationList(unreadNotifications),
            ],
          );
        },
      ),
    );
  }
}

class NotificationDetailsPage extends StatelessWidget {
  final NotificationData notification;

  const NotificationDetailsPage({super.key, required this.notification});

  String _formatFullDate(DateTime dateTime, context) {
    return DateFormat('d MMMM yyyy, h:mm a', S.of(context).ar).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).details)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).message,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Text(
                    notification.data["message"] ?? S.of(context).notification,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (notification.data["new_status"] != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).newstate,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.data["new_status"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  _formatFullDate(notification.createdAt, context),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
