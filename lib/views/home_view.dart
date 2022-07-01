import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_strings.dart';
import '../helpers/app_utils.dart';
import '../models/items_model.dart';
import '../view_models/auth_view_model/auth_view_model.dart';
import '../view_models/home_view_model/home_view_model.dart';
import '../widgets/no_data.dart';
import '../widgets/tile_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    context.read<HomeViewModel>().loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: Utils.getHeight(20.0),
                ),
                Text(
                  "${user?.displayName}",
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: Utils.getHeight(10.0),
                ),
                Text(
                  "${user?.email}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: Utils.getHeight(15.0),
                ),
                SizedBox(
                  width: Utils.getWidth(200.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: PRIMARY_COLOR.withOpacity(0.8),
                    ),
                    onPressed: () {
                      context.read<AuthViewModel>().logout();
                    },
                    child: const Text("Logout"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Utils.getHeight(15.0),
            ),
            Selector<HomeViewModel, List<Data>?>(
              selector: (_, vm) => vm.items,
              builder: (_, items, __) {
                if (items == null) {
                  return const NoData();
                }

                if (items.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          backgroundColor: PRIMARY_COLOR,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TileCard(
                          cat: items[index],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, DETAILS_ROUTE, arguments: items[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getWidth(20.0),
                        ),
                        child: const Divider(
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
