import UIKit
import Flutter
import OneSignal

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Initialize OneSignal
    OneSignal.setAppId("1cc7933a-5d5d-470b-88fb-451a842f03bf")

    // Set OneSignal delegate
    OneSignal.setNotificationOpenedHandler { result in
    // This will be called whenever a notification is opened
    if let viewController = self.window?.rootViewController as? FlutterViewController {
        let channel = FlutterMethodChannel(name: "onesignal_flutter",
                                           binaryMessenger: viewController.binaryMessenger)
        channel.invokeMethod("notificationOpened", arguments: result.notification.body)
    }
}

    OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
