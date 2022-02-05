

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var sizeBrush: UITextField!
    @IBOutlet weak var color: UITextField!
    
    @IBAction func clearAll(_ sender: Any) {
        canvasView.clearCanvas()
       
    }

    
    @IBAction func save(_ sender: Any) {
        let givenSizeBrush:String=sizeBrush.text ?? "2"
        
        let col:String = color.text ?? "black"
        canvasView.change(siz: givenSizeBrush, color: col)
    }
    
}


