//
//  SliderTableViewCell.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 1/4/19.
//  Copyright © 2019 Abraham Hunt. All rights reserved.
//

import UIKit

struct SliderCellConfiguration {
    
    enum SliderCellColor {
        case red
        case blue
        case purple
        
        var color: UIColor {
            switch self {
            case .red: return .red
            case .blue: return .blue
            case .purple: return .purple
            }
        }
    }
    let title: String
    let thumbColor: SliderCellColor
}

class SliderTableViewCell: UITableViewCell, NibDefinedTableCell {
    
    static func dequeue(from tableView: UITableView, indexPath: IndexPath, with configuration: SliderCellConfiguration) -> SliderTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SliderTableViewCell
        cell.configuration = configuration
        return cell
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var configuration: SliderCellConfiguration? {
        didSet {
            titleLabel.text = configuration?.title
            slider.thumbTintColor = configuration?.thumbColor.color ?? slider.thumbTintColor
        }
    }
}
