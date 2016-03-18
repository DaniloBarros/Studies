import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    let vc = ViewController()
    window!.rootViewController = vc
    window!.makeKeyAndVisible()
    return true
  }

  func applicationDidEnterBackground(application: UIApplication) {
    var pontos: NSMutableArray = []
    for poligono in ((window!.rootViewController as! ViewController).view as! DrawView).finishedLines {
      var arr = [NSNumber]()
      arr.append(poligono.begin.x)
      arr.append(poligono.begin.y)

      for ponto in poligono.pontos {
        arr.append(ponto.x)
        arr.append(ponto.y)
      }
      pontos.addObject(arr)
    }
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(pontos, forKey: "pontos")
  }
}
