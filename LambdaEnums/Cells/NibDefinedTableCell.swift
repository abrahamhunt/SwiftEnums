//
//  NibDefinedTableCell.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 1/7/19.
//  Copyright © 2019 Abraham Hunt. All rights reserved.
//

import Foundation
import UIKit

protocol NibDefinedTableCell: class {
    static func register(with tableView: UITableView)
    static var cellIdentifier: String {get}
    static var nib: UINib {get}
}

extension NibDefinedTableCell {
    static func register(with tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    static var cellIdentifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: cellIdentifier, bundle: Bundle(for: self))
    }
}
