//
//  TableViewXib.swift
//  StructTableView
//
//  Created by Antonio Alessandro Chillura on 11/01/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

public protocol HeaderProtocol {
    var headerLBL: UILabel! { get set }
}

public protocol HeaderExpandedViewProtocol:HeaderProtocol {
    var buttonHV: UIButton! { get set }
}

open class TableViewXib: UIView {
    
    @IBOutlet open weak var tableView: UITableView!
    
    static public let defaultHeightHeaderTable:CGFloat = 50
    
    open var dataSource = [TableViewDataSource]()
    
    var clousuresDidSelectRow:((_ section:Int, _ row:Int) -> Void)?
    var clousuresDidSelectElementRowOne:((_ section:Int, _ row:Int) -> Void)?
    var clousuresDidSelectElementRowTwo:((_ section:Int, _ row:Int) -> Void)?
    var funcCellForRow:((_ tableView: UITableView, _ indexPath: IndexPath)->UITableViewCell?)?
    
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
        
        tableViewSetup()
    }
    
    func sizeHeaderToFit(section:Int) -> CGFloat {
        
        if let headerView = dataSource[section].hearderView {
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            
            return height
        }
        
        return 40
    }
    
    open func reloadData() {
        self.tableView.reloadData()
    }
    
    // MARK: Closures TableViewDelegate
    
    open func didSelect(cell: @escaping (_ section:Int, _ row:Int) -> Void) {
        self.clousuresDidSelectRow = cell
    }
    
    open func didSelectElementCellOne(elementCell: @escaping (_ section:Int, _ row:Int) -> Void) {
        self.clousuresDidSelectElementRowOne = elementCell
    }
    
    open func didSelectElementCellTwo(elementCell: @escaping (_ section:Int, _ row:Int) -> Void) {
        self.clousuresDidSelectElementRowTwo = elementCell
    }
    
    open func configureCellInXib(cell: @escaping (_ tableView: UITableView, _ indexPath: IndexPath)->UITableViewCell?) {
        self.funcCellForRow = cell
    }
    
}

// MARK: - xibSetup

private extension TableViewXib {
    
    func xibSetup() {
        view = loadNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func tableViewSetup() {
        registerXib()
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    private func registerXib() {
        
        // DettaglioDefaultTVC Cell
        let bundle = Bundle.module
        tableView.register(UINib(nibName: DettaglioDefaultTVC.identifieldCell, bundle: bundle), forCellReuseIdentifier: DettaglioDefaultTVC.identifieldCell)
    }
}

// MARK: - UITableViewDelegate

extension TableViewXib: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clousuresDidSelectRow?(indexPath.section, indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (dataSource[section].header == nil && dataSource[section].hearderView == nil) ? 0 : dataSource[section].hearderView != nil ? self.sizeHeaderToFit(section: section) : TableViewXib.defaultHeightHeaderTable
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionObj = self.dataSource[section]
        
        guard sectionObj.header != nil || sectionObj.hearderView != nil else {
            return nil
        }
        
        guard let headerView = sectionObj.hearderView else {
            let viewContainer = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: TableViewXib.defaultHeightHeaderTable))
            
            viewContainer.backgroundColor = UIColor.white
            
            let x:CGFloat = 28
            let label = UILabel.init(frame: CGRect.init(x: x, y: 0, width: UIScreen.main.bounds.width-x, height: TableViewXib.defaultHeightHeaderTable))
            
            label.text = sectionObj.header
            
            viewContainer.addSubview(label)
            
            return viewContainer
        }
        
        return headerView
    }
}

// MARK: - UITableViewDataSource

extension TableViewXib: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countTV = dataSource[section].list.count
        
        if let headerView = dataSource[section].hearderView as? HeaderExpandedViewProtocol {
            if headerView.buttonHV.isSelected {
                countTV = dataSource[section].list.count
            } else {
                countTV = 0
            }
        }
        
        return countTV
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = dataSource[indexPath.section].list[indexPath.row]
        
        if let dettaglioDefaultMC = obj as? DettaglioDefaultMC {
            let cell = tableView.dequeueReusableCell(withIdentifier: DettaglioDefaultTVC.identifieldCell, for: indexPath) as! DettaglioDefaultTVC
            
            cell.dettaglio = dettaglioDefaultMC
            
            return cell
        } else if let cellEsc = funcCellForRow?(tableView, indexPath) {
            return cellEsc
        }
        
        return UITableViewCell()
    }
}

