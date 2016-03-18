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
    let pontos: NSMutableArray = []
    for poligono in ((window!.rootViewController as! ViewController).view as! DrawView).finishedLines {
      var arr = [NSNumber]()
      if poligono.tipo == "l" {
        arr.append(0)
      } else {
        arr.append(1)
      }
      arr.append(poligono.begin.x)
      arr.append(poligono.begin.y)
      for ponto in poligono.pontos {
        arr.append(ponto.x)
        arr.append(ponto.y ) 
      }
      pontos.addObject(arr)
    }
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(pontos, forKey: "pontos")
  }
}

//        var angulo: CGFl oat = calculaAngulo(s.begin, ponto2: (s as! Line).end)
//        let cor: UIColor = UIColor(hue: angulo, saturation: 1, brightness: 1, alpha: 1)
//        cor.set()

//
//func calculaAngulo(ponto1: CGPoint, ponto2: CGPoint) -> CGFloat {
//  let origem = CGPointMake(ponto2.x - ponto1.x, ponto2.y - ponto1.y)
//  var angulo = fabs(atan2(origem.y, origem.x))
//  angulo = angulo - floor(angulo)
//  return angulo
//}