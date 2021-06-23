import UIKit
import GoogleMaps
import Flutter
import flutter_config

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let _mapsApiKey: String = FlutterConfigPlugin.env(for: "IOS_MAPS_API_KEY")
    GMSServices.provideAPIKey(_mapsApiKey)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
