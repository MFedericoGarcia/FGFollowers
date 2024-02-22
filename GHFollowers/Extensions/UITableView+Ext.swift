//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Fede Garcia on 25/04/2024.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
