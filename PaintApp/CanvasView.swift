

import UIKit
//import Canvas

class CanvasView: UIView {

    var lineColor:UIColor=UIColor.black
    var lineWidth:CGFloat=2
    var path:UIBezierPath!
    var touchPoint:CGPoint!
    var startingPoint:CGPoint!
    var lineWidth1:CGFloat!
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    func change(siz:String, color:String){
        let sf: Int = Int(siz) ?? 2
        lineWidth = CGFloat(sf)
        if(color=="red"){
            lineColor = UIColor.red
        }
        else if(color=="yellow"){
            lineColor = UIColor.yellow
        }
        else if(color=="green"){
            lineColor = UIColor.green
        }
        else if(color=="brown"){
            lineColor = UIColor.brown
        }
        else if(color=="blue"){
            lineColor = UIColor.blue
        }
        else if(color=="cyan"){
            lineColor = UIColor.cyan
        }
        else if(color=="orange"){
            lineColor = UIColor.orange
        }
        else{
            lineColor = UIColor.black

        }
    }
    func drawShapeLayer() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth

        
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
        
    }
    
    func clearCanvas() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }

    
}

