

import UIKit

extension UIView {
    
    public func loadNib() -> UIView {
        guard let xibPath = Bundle.module.path(forResource: self.className, ofType: "xib") else  {
            print("errore nel prendere il path della classe \(self.className)")
            return UIView()
        }
        let bundle = Bundle.init(path: xibPath)
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

}
