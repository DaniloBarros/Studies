import UIKit

class DrawView: UIView {
  var lineInProgress: Line?
  var finishedLines = [Line]()
  var toques = 0
    private var selectedLine: Line?

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.lightGrayColor()
    multipleTouchEnabled = true
    
    //Reconhecimento de um double tap
    let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"))
    doubleTap.numberOfTapsRequired = 2
    doubleTap.delaysTouchesBegan = true;
    self.addGestureRecognizer(doubleTap)
    
    let tap = UITapGestureRecognizer(target: self, action: Selector("tap:"))
    tap.requireGestureRecognizerToFail(doubleTap)
    self.addGestureRecognizer(tap)

    let defaults = NSUserDefaults.standardUserDefaults()
    if let pontos = defaults.objectForKey("pontos") as? [[NSNumber]] {
      for ponto in pontos {
        let line = Line()

        if ponto[0] == 0 {
          line.tipo = "l"
        } else {
          line.tipo = "c"
        }

        line.begin = CGPointMake(ponto[1] as CGFloat, ponto[2] as CGFloat)

        for var i = 3; i < ponto.count; i += 2 {
          line.pontos.append(CGPointMake(ponto[i] as CGFloat, ponto[i+1] as CGFloat))
        }
        finishedLines.append(line)
      }
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
    
    func doubleTap(sender: UITapGestureRecognizer){
        self.lineInProgress = nil
        self.selectedLine = nil
        self.finishedLines.removeAll(keepCapacity: false)
        self.setNeedsDisplay()
    }
    
    func tap(sender: UITapGestureRecognizer?){
        let menu = UIMenuController.sharedMenuController()
        
        let point = sender!.locationInView(self)
        self.selectedLine = self.lineAtPoint(point)
        
        if let l = self.selectedLine {
            self.becomeFirstResponder()
            
            let deleteItem = UIMenuItem(title: "Delete", action: Selector("deleteLine:"))
            
            let menuLocation = CGRect(x: point.x, y: point.y, width: CGFloat(2), height: CGFloat(2))
            menu.setTargetRect(menuLocation, inView: self)
            menu.menuItems = [deleteItem]
            menu.setMenuVisible(true, animated: true)
            
        }else{
            menu.setMenuVisible(false, animated: true)
        }
        self.setNeedsDisplay()
    }
    
    func deleteLine(sender: AnyObject){
        let index = self.finishedLines.indexOf(self.selectedLine!)
        self.finishedLines.removeAtIndex(index!)
        
        self.selectedLine = nil
        
        self.setNeedsDisplay()
    }
    
    private func lineAtPoint(point: CGPoint) ->  Line?{
        for l in self.finishedLines {
            if l.havePoint(point){
                return l
            }
        }
        
        return nil
    }
    
    override func drawRect(rect: CGRect) {
        //UIColor.blackColor().set()
        for l in finishedLines {
            
            let angulo: CGFloat = calculaAngulo(l.begin, ponto2: (l as Line).pontos[0])
            let cor: UIColor = UIColor(hue: angulo, saturation: 1, brightness: 1, alpha: 1)
            cor.set()
            
            l.stroke()
        }
        if lineInProgress != nil {
            
            if lineInProgress!.pontos.count > 0{
                let angulo: CGFloat = calculaAngulo(lineInProgress!.begin, ponto2: lineInProgress!.pontos[0])
                let cor: UIColor = UIColor(hue: angulo, saturation: 1, brightness: 1, alpha: 1)
                cor.set()
            }else{
                let cor: UIColor = UIColor(hue: 0, saturation: 1, brightness: 1, alpha: 1)
                cor.set()
            }
            
            lineInProgress!.stroke()
        }
        
        if let l = self.selectedLine {
            UIColor.blackColor().set()
            l.stroke()
        }
    }
    
    func calculaAngulo(ponto1: CGPoint, ponto2: CGPoint) -> CGFloat {
        let origem = CGPointMake(ponto2.x - ponto1.x, ponto2.y - ponto1.y)
        var angulo = fabs(atan2(origem.y, origem.x))
        angulo = angulo - floor(angulo)
        return angulo
    }
    
    
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    let line = Line()
    if event!.allTouches()!.count == 2 {
      if toques == 0 {
        line.asCircle(event!.allTouches()!, view: self, begin: true)
      } else {
        line.asCircle(event!.allTouches()!, view: self, begin: false)
      }
    } else {
      if toques == 0 {
        line.asLine(event!.allTouches()!, view: self, begin: true)
      } else {
        line.asLine(event!.allTouches()!, view: self, begin: false)
      }
    }
    if toques == 0 {
      lineInProgress = line
    }
    toques += touches.count

    setNeedsDisplay()
  }

  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if event!.allTouches()!.count == 2 {
      lineInProgress!.asCircle(event!.allTouches()!, view: self, begin: false)
    } else {
      lineInProgress!.asLine(event!.allTouches()!, view: self, begin: false)
    }
    setNeedsDisplay()
  }

  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    toques -= touches.count

    if toques == 2 {
      lineInProgress!.asCircle(event!.allTouches()!, view: self, begin: false)
    } else {
      lineInProgress!.asLine(event!.allTouches()!, view: self, begin: false)
    }
    if toques == 0 {
        if lineInProgress!.pontos.count == 2{
            lineInProgress!.asCircle(event!.allTouches()!, view: self, begin: false)
            lineInProgress!.tipo = "c"
        }else{
            lineInProgress!.asLine(event!.allTouches()!, view: self, begin: false)
        }
      finishedLines.append(lineInProgress!)
      lineInProgress = nil
    }
    setNeedsDisplay()
  }

  override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
    toques = 0
    lineInProgress = nil
    setNeedsDisplay()
  }

}