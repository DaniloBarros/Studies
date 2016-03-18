import UIKit

class DrawView: UIView{
  var lineInProgress: Line?
  var finishedLines = [Line]()
  var selectedLine: Line?
  var ultimo: CGPoint?
    var ultimoToque: NSTimeInterval?
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.lightGrayColor()
    multipleTouchEnabled = true
    
    let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"))
    doubleTap.numberOfTapsRequired = 2
    doubleTap.delaysTouchesBegan = true
    addGestureRecognizer(doubleTap)
    
    let tap = UITapGestureRecognizer(target: self, action: Selector("tap:"))
    tap.requireGestureRecognizerToFail(doubleTap)
    addGestureRecognizer(tap)
    
    let longPress = UILongPressGestureRecognizer(target: self, action: Selector("longPress:"))
    longPress.minimumPressDuration = 1
    self.addGestureRecognizer(longPress)
    
    let defaults = NSUserDefaults.standardUserDefaults()
    if let pontos = defaults.objectForKey("pontos") as? [[NSNumber]] {
      for ponto in pontos {
        let line = Line()
        line.begin = CGPointMake(ponto[0] as CGFloat, ponto[1] as CGFloat)
        
        for var i = 2; i < ponto.count; i += 2 {
          line.pontos.append(CGPointMake(ponto[i] as CGFloat, ponto[i+1] as CGFloat))
        }
        finishedLines.append(line)
      }
    }
  }
  
  func longPress(sender: UIGestureRecognizer?) {
    if(sender!.state == .Began) {
      ultimo = sender!.locationInView(self)
      selectedLine = lineAtPoint(sender!.locationInView(self))
        UIMenuController.sharedMenuController().setMenuVisible(false, animated: true)
    } else if (sender!.state == .Ended) {
      ultimo = nil
    } else {
      var point = sender!.locationInView(self)
      if selectedLine != nil
      {
        // identificar se e line, circulo pogligo...
        var pontosAntigos = selectedLine!.pontos
        selectedLine!.pontos = []
        let deltaX = -ultimo!.x + point.x
        let deltaY = -ultimo!.y + point.y
        for ponto in pontosAntigos {
          selectedLine!.pontos.append(CGPointMake(ponto.x + deltaX, ponto.y + deltaY))
        }
        selectedLine!.begin = CGPointMake(selectedLine!.begin.x + deltaX, selectedLine!.begin.y + deltaY)
        ultimo = point
      }
      self.setNeedsDisplay()
    }
  }
  
  func deleteLine(sender: UITapGestureRecognizer?) {
    if let index = find(finishedLines, selectedLine!) {
      finishedLines.removeAtIndex(index)
    }
    selectedLine = nil
    setNeedsDisplay()
  }
  
  func tap(sender: UITapGestureRecognizer?) {
    let point = sender!.locationInView(self)
    let menu = UIMenuController.sharedMenuController()
    selectedLine = lineAtPoint(point)
    
    if selectedLine != nil {
      becomeFirstResponder()
      let deleteItem = UIMenuItem(title: "Delete", action: Selector("deleteLine:"))
      let menuLocation = CGRect(x: point.x, y: point.y, width: CGFloat(2), height: CGFloat(2))
      menu.setTargetRect(menuLocation, inView: self)
      menu.menuItems = [deleteItem]
      menu.setMenuVisible(true, animated: true)
    } else {
      menu.setMenuVisible(false, animated: true)
    }
    
    setNeedsDisplay()
  }
  
  func doubleTap(sender: UITapGestureRecognizer?) {
    finishedLines = [Line]()
    lineInProgress = nil
    selectedLine = nil
    UIMenuController.sharedMenuController().setMenuVisible(false, animated: true)
    setNeedsDisplay()
  }
  
  override func canBecomeFirstResponder() -> Bool {
    return true
  }
  
  func lineAtPoint(point: CGPoint) -> Line? {
    for l in finishedLines {
      if l.havePoint(point) {
        return l
      }
    }
    return nil
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func drawRect(rect: CGRect) {
    for l in finishedLines {
      l.getCor().set()
      l.stroke()
    }
    if selectedLine != nil {
      UIColor.whiteColor().set()
      selectedLine!.stroke()
    }
    if lineInProgress != nil {
      lineInProgress!.getCor().set()
      lineInProgress!.stroke()
    }
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    if ultimoToque == nil{
        ultimoToque = event.timestamp
    }
    
    let line = Line()
    line.updatePontos(event.allTouches()!, view: self, begin: event.allTouches()!.count == touches.count)
    if event.allTouches()!.count == touches.count {
      lineInProgress = line
    }
    setNeedsDisplay()
  }
  
  override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    var intervalo = event.timestamp - self.ultimoToque!
    
    if intervalo <= 0.0085{
        println("AeeMoved \(intervalo)")
    }else{
        
        if lineInProgress == nil {
            lineInProgress = Line()
            lineInProgress!.updatePontos(event.allTouches()!, view: self, begin: true)
        } else {
            lineInProgress!.updatePontos(event.allTouches()!, view: self, begin: false)
        }
    }
    
    self.ultimoToque = event.timestamp
    
    setNeedsDisplay()
  }
  
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    var intervalo = event.timestamp - self.ultimoToque!
    
    if intervalo <= 0.3{
        println("Aee \(intervalo)")
    }else{
    println("Uuu \(intervalo)")
    if lineInProgress == nil {
      lineInProgress = Line()
      lineInProgress!.updatePontos(event.allTouches()!, view: self, begin: true)
    } else {
      lineInProgress!.updatePontos(event.allTouches()!, view: self, begin: false)
    }
    
    }
    
    if lineInProgress == nil {
        lineInProgress = Line()
        lineInProgress!.updatePontos(event.allTouches()!, view: self, begin: true)
    }
    
    if event.allTouches()!.count == touches.count {
        println("\(event.allTouches()!.count)")
        finishedLines.append(lineInProgress!)
        lineInProgress = nil
    }
    
    setNeedsDisplay()
    ultimoToque = event.timestamp
    
  }
  
  override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
    lineInProgress = nil
    setNeedsDisplay()
  }
}