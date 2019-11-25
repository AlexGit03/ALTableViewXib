//
//  TableViewDataSource.swift
//  StructTableView
//
//  Created by Antonio Alessandro Chillura on 11/01/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

public class TableViewDataSource {
    public var header:String?
    public var hearderView:UIView?
    public var list:[Any]!
    
    public init() {
        list = [Any]()
    }
    
    deinit {
        list = nil
    }
}
