//
//  UITableView+Extension.swift
//  DemoFramework
//
//  Created by Antonio Alessandro Chillura on 07/06/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func registrerNib(withIdentifield identidifield:String, bundle bundleOrNil: Bundle?) {
        let cellNib = UINib(nibName: identidifield, bundle: bundleOrNil)
        self.register(cellNib, forCellReuseIdentifier: identidifield)
    }
    
}
