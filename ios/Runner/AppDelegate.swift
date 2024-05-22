import UIKit
import Flutter
import GoogleMaps
//import FireBaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDx5KecpIiY5dZrP6XARXePIxF0YaI9_pg")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)


  }
}

 
