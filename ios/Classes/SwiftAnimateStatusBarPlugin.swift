import Flutter
import UIKit

public class SwiftAnimateStatusBarPlugin: NSObject, FlutterPlugin {
    private var statusBar: UIView;

    public init(statusBar: UIView) {
        self.statusBar = statusBar
        super.init()
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "animate_status_bar", binaryMessenger: registrar.messenger())
        let instance = SwiftAnimateStatusBarPlugin(statusBar: getStatusBar()!)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    private static func getStatusBar() -> UIView? {
        if let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
           let statusBar = statusBarWindow.value(forKey: "statusBar") as? UIView {
            return statusBar
        }
        return nil
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "getFrame") {
            let frame = self.statusBar.frame
            result(["x": frame.origin.x, "y": frame.origin.y, "width": frame.size.width, "height": frame.size.height])
        } else if (call.method == "setFrame") {
            let arg = call.arguments as! [String: Any]
            let duration  = arg["duration"] as! CGFloat
            var x = arg["x"] as! CGFloat
            var y = arg["y"] as! CGFloat
            var width = arg["width"] as! CGFloat
            var height = arg["height"] as! CGFloat

            if (x == 0) {
                x = self.statusBar.frame.origin.x
            }
            if (y == 0) {
                y = self.statusBar.frame.origin.y
            }
            if (width == 0) {
                width = self.statusBar.frame.width
            }
            if (height == 0) {
                height = self.statusBar.frame.height
            }

            self.statusBar = SwiftAnimateStatusBarPlugin.getStatusBar()!
            UIView.animate(withDuration: TimeInterval(duration), animations: {
                let frame = CGRect(x: x, y: y, width: width, height: height)
                self.statusBar.frame = frame
            })
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
