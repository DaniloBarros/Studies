import UIKit

class Line: NSObject {
  var begin: CGPoint!
  var pontos = [CGPoint]()

  func updatePontos(touches: Set<NSObject>, view: UIView, begin: Bool) {
    pontos = []
    for obj in touches {
      pontos.append((obj as! UITouch).locationInView(view))
    }

    if begin {
      self.begin = pontos[0]
    }
  }

  func stroke() {
    var bp = UIBezierPath()
    if pontos.count == 1 {
      bp.moveToPoint(begin!)
      bp.addLineToPoint(pontos[0])
    } else if pontos.count == 2{
      let beg = pontos[0]
      let end = pontos[1]
      var center = CGPointMake((end.x + beg.x)/2,(end.y + beg.y)/2)
      var radius = CGFloat(sqrt(pow((end.x - center.x), 2.0) + pow((end.y - center.y), 2.0)))
      bp.addArcWithCenter(center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI*M_PI), clockwise: true)
    } else {
      bp.moveToPoint(pontos[0])
      for ponto in pontos {
        bp.addLineToPoint(ponto)
      }
      bp.closePath()
    } 
    bp.lineWidth = 8
    bp.lineCapStyle = kCGLineCapRound
    bp.stroke()
  }

  func getCor() -> UIColor {
    let beg: CGPoint!
    let end: CGPoint!
    if pontos.count == 1 {
      beg = self.begin
      end = pontos[0]
    } else {
      beg = pontos[0]
      end = pontos[1]
    }
    var angulo = calculaAngulo(beg, ponto2: end)
    return UIColor(hue: angulo, saturation: 1, brightness: 1, alpha: 1)
  }

  func calculaAngulo(ponto1: CGPoint, ponto2: CGPoint) -> CGFloat {
    let origem = CGPointMake(ponto2.x - ponto1.x, ponto2.y - ponto1.y)
    var angulo = fabs(atan2(origem.y, origem.x))
    return angulo - floor(angulo) as CGFloat
  }

  func checaDistancia(begin: CGPoint, end: CGPoint, point: CGPoint) -> Bool {
    for (var t: Float = 0.0; t < 1; t += 0.5) {
      let x = Float(begin.x) + t * (Float(end.x) - Float(begin.x))
      let y = Float(begin.y) + t * (Float(end.y) - Float(begin.y))
      if (hypotf(x - Float(point.x), y - Float(point.y)) < 20.0) {
        return true
      }
    }
    return false
  }

  func calculaDistancia(p1: CGPoint, p2: CGPoint) -> CGFloat {
    let xDist = (p2.x - p1.x)
    let yDist = (p2.y - p1.y)
    let distance = sqrt((xDist * xDist) + (yDist * yDist))
    return distance
  }

  func havePoint(point: CGPoint) -> Bool {
    if pontos.count == 1 {
      return checaDistancia(begin, end: pontos[0], point: point)
    } else if pontos.count == 2 {
      let beg = pontos[0]
      let end = pontos[1]
      var center = CGPointMake((end.x + beg.x)/2,(end.y + beg.y)/2)
      var radius = CGFloat(sqrt(pow((end.x - center.x), 2.0) + pow((end.y - center.y), 2.0)))
      let distanciaPonto = calculaDistancia(point, p2: center)
      if fabs(distanciaPonto - radius) < 20.0 {
        return true
      }
    } else {
      for (var i = 0; i < pontos.count; i++) {
        if checaDistancia(pontos[i], end: pontos[i+1], point: point) {
          return true
        }
        return checaDistancia(pontos[pontos.count - 1], end: pontos[0], point: point)
      }
    }
    return false
  }
}