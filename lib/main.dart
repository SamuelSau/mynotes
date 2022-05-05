import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/register_view.dart';
import 'firebase_options.dart';
import 'views/login_view.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
   runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginView(),
        '/register':(context) => const RegisterView(),
      },
    )
  );
} 

//Username: samdrinkswater@gmail.com
//pass: Happyhorse1

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){  
            // ignore: todo
            case ConnectionState.done:  
              // final user = FirebaseAuth.instance.currentUser;
              // print(user); 
              // if(user?.emailVerified ?? false){
              //   return const Text('Done');
              // }
              // else{
              //   return const VerifyEmailView();
              // }
              return const LoginView();
            default:
              return const CircularProgressIndicator();
          }
        },
    );
  }
}
