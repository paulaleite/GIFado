//
//  Util.swift
//  GIFiado
//
//  Created by Paula Leite on 21/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

var spinnerView: UIView?
var spinnerViewTable: UITableView?

extension UIViewController {
    func showLoadingAlert() {
        spinnerView = UIView(frame: self.view.bounds)
        spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.0)
        
        let spinner = UIActivityIndicatorView(style: .medium)
        guard let safeCenter = spinnerView?.center else { return }
        spinner.center = safeCenter
        spinner.startAnimating()
        
        spinnerView?.addSubview(spinner)
        guard let safeSpinnerView = spinnerView else { return }
        self.view.addSubview(safeSpinnerView)
        
    }
    
    func removeLoadingAlert() {
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
}

extension UITableViewController {
    func showLoadingAlertTable() {
        spinnerViewTable = UITableView(frame: self.view.bounds)
        spinnerViewTable?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.0)
        
        let spinner = UIActivityIndicatorView(style: .medium)
        guard let safeCenter = spinnerViewTable?.center else { return }
        spinner.center = safeCenter
        spinner.startAnimating()
        
        spinnerViewTable?.addSubview(spinner)
        guard let safeSpinnerView = spinnerViewTable else { return }
        self.view.addSubview(safeSpinnerView)
        
    }
    
    func removeLoadingAlertTable() {
        spinnerViewTable?.removeFromSuperview()
        spinnerViewTable = nil
    }
}
