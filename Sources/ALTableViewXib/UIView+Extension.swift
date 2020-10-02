

import UIKit

extension UIView {
    
    public func loadNib() -> UIView {
        let bundle = Bundle.module
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

}
