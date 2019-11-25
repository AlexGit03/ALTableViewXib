//
//  DettaglioDefaultTVC.swift
//  INPSWelfare
//
//  Created by Antonio Alessandro Chillura on 19/01/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

public class DettaglioDefaultTVC: UITableViewCell {
    
    static public let identifieldCell = "DettaglioDefaultTVC"
    
    @IBOutlet weak var dettaglioLBL: UILabel!
    
    public var dettaglio:DettaglioDefaultMC? {
        didSet {
            dettaglioLBL.text = dettaglio?.dettaglio
        }
    }

}
