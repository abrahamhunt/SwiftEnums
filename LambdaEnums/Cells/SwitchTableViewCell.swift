//
//  SwitchTableViewCell.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 1/4/19.
//  Copyright © 2019 Abraham Hunt. All rights reserved.
//

import UIKit

struct SwitchCellConfiguration {
    let isSwitchOn: Bool
    let title: String
}

class SwitchTableViewCell: UITableViewCell, NibDefinedTableCell {
    
    static func dequeue(from tableView: UITableView, indexPath: IndexPath, with configuration: SwitchCellConfiguration) -> SwitchTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SwitchTableViewCell
        cell.configuration = configuration
        return cell
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var configuration: SwitchCellConfiguration? {
        didSet {
            titleLabel.text = configuration?.title
            onSwitch.isOn = configuration?.isSwitchOn ?? false
        }
    }
    
}
