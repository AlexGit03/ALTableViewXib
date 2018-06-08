

import UIKit

extension UIView {
    
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self) as AnyClass)
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

}
