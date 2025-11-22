// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/core/theme/app_theme.dart';
import 'package:bite_and_seat/modules/login_module/view/login_page.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final Widget initialWidget;
  final bool isLoggedIn = await AuthStorageFunctions.getLoginStatus();
  if (isLoggedIn) {
    initialWidget = const MenuPage();
  } else {
    initialWidget = const LoginPage();
  }
  runApp(MyApp(initialWidget: initialWidget));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;
  const MyApp({super.key, required this.initialWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => DailyMenuCubit()),
        BlocProvider(create: (context) => OrderCubit()),
        BlocProvider(create: (context) => TimeSlotCubit()),
        BlocProvider(create: (context) => TableSeatsListCubit()),
        BlocProvider(create: (context) => MenuBookingBloc()),
        BlocProvider(create: (context) => TimeSlotBookingBloc()),
        BlocProvider(create: (context) => TableSeatsBookingBloc()),
        BlocProvider(create: (context) => PaymentBloc()),
        BlocProvider(create: (context) => UserProfileCubit()),
        BlocProvider(create: (context) => UserOrdersCubit()),
        BlocProvider(create: (context) => SubmitFeedbackBloc()),
        BlocProvider(create: (context) => SubmitComplaintBloc()),
      ],
      child: MaterialApp(
        title: 'Bite&Seat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        home: initialWidget,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
