//
//  DefaultHeaderView.swift
//  INPSWelfare
//
//  Created by Antonio Alessandro Chillura on 16/01/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

open class DefaultHeaderView: UIView, HeaderProtocol {
    
    @IBOutlet weak public var headerLBL: UILabel!
    
    open override var backgroundColor: UIColor? {
        get {
            return self.backgroundColor
        }
        set {
            if let color = newValue {
                self.layer.backgroundColor = color.cgColor
            } else {
                self.layer.backgroundColor = UIColor.white.cgColor
            }
        }
    }

    //MARK: - Properties
    var view: UIView!
    
    //MARK: - View Lifecycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
}

extension DefaultHeaderView {
    func xibSetup() {
        view = loadNib()
        view.frame = bounds
        addSubview(view)
        
        self.backgroundColor = nil
    }
}
