import UIKit

class Line: NSObject {
  var begin: CGPoint!
  var pontos = [CGPoint]()
  var tipo: String!

  func asLine(touches: Set<NSObject>, view: UIView, begin: Bool) {
    tipo = "l"
    pontos = []
    for obj in touches {
      pontos.append((obj as! UITouch).locationInView(view))
    }

    if begin {
      self.begin = pontos[0]
      pontos.removeAtIndex(0)
    }
  }

  func asCircle(touches: Set<NSObject>, view: UIView, begin: Bool) {
    tipo = "c"
    pontos = []
    for obj in touches {
      pontos.append((obj as! UITouch).locationInView(view))
    }

    if begin {
      self.begin = pontos[0]
    }
  }

  func stroke() {
    let bp = UIBezierPath()
    bp.lineWidth = 8
    bp.lineCapStyle = CGLineCap.Round
    if tipo == "l" {
      if pontos.count == 0 {
        bp.moveToPoint(begin!)
        bp.addLineToPoint(begin!)
      } else if pontos.count == 1 {
        bp.moveToPoint(begin!)
        bp.addLineToPoint(pontos[0])
      } else {
        bp.moveToPoint(pontos[0])
        for ponto in pontos {
          bp.addLineToPoint(ponto)
        }
        bp.addLineToPoint(pontos[0])
      }
    } else {
      let beg = pontos[0]
      let end = pontos[1]
      let center = CGPointMake((end.x + beg.x)/2,
        (end.y + beg.y)/2)
      let radius = CGFloat(sqrt(pow((end.x - center.x), 2.0) +
        pow((end.y - center.y), 2.0)))
      bp.addArcWithCenter(center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI*M_PI), clockwise: true)
    }
    bp.stroke()
  }
    
    
    func havePoint(point: CGPoint) ->Bool{
        let erro: Float = 20.0
        
        for(var t:Float = 0.0; t < 1; t+=0.05){
            let x:Float = Float(self.begin.x) + t * (Float(self.pontos[pontos.count-1].x) - Float(self.begin.x))
            let y:Float = Float(self.begin.y) + t * (Float(self.pontos[pontos.count-1].y) - Float(self.begin.y))
            
            if(hypotf(x-Float(point.x), y - Float(point.y)) < erro){
                return true
            }
        }
        return false
    }
    
}
