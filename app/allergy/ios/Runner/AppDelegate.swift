import UIKit
import Flutter
import AVFAudio

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    GeneratedPluginRegistrant.register(with: self)
      AVAudioSession.sharedInstance().requestRecordPermission { granted in
          if granted {
              // The user granted access. Present recording interface.
          } else {
              // Present message to user indicating that recording
              // can't be performed until they change their preference
              // under Settings -> Privacy -> Microphone
          }
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
