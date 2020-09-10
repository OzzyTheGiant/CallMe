import 'package:call_me/blocs/ContactsListBloc.dart';
import 'package:flutter/material.dart';
import 'package:call_me/blocs/BlocProvider.dart';
import 'package:call_me/widgets/ContactListPage.dart';

void main() {
    runApp(CallMeApp());
}

class CallMeApp extends StatelessWidget {
    @override Widget build(BuildContext context) {
        return BlocProvider(
            bloc: ContactsListBloc(),
            child: MaterialApp(
                title: 'Call Me',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: ContactListPage(),
            )
        );
    }
}


