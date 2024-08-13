import 'dart:async';
import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/loading_spinner.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/pages/root.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<List<StreamChannel>> _getStreamChannels() async {
    return await ServiceChannel.getStreamChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getStreamChannels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Timer(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Root()),
                  );
                });
              });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Stack(
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 170,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: LoadingSpinner(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
