import 'package:flutter/material.dart';
import 'package:call_me/blocs/ContactsListBloc.dart';
import 'package:call_me/blocs/BlocProvider.dart';
import 'package:call_me/widgets/ContactListPage.dart';

void main() {
    runApp(CallMeApp());
}

class CallMeApp extends StatelessWidget 
{
    final Map<String, Widget Function(BuildContext)> _routes = {
        "/": (context) => ContactListPage()
    };

    @override Widget build(BuildContext context) {
        var bloc = ContactsListBloc();
    
        bloc.init();

        return BlocProvider(
            bloc: bloc,
            child: MaterialApp(
                title: 'Call Me',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    cardTheme: CardTheme(elevation: 2)
                ),
                initialRoute: "/",
                routes: _routes
            )
        );
    }
}


