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
        case colorWithRGB(red: Int, green: Int, blue: Int)
        
        var color: UIColor {
            switch self {
            case .red: return .red
            case .blue: return .blue
            case .purple: return .purple
            case .colorWithRGB(let red, let green, let blue): return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
            }
        }
    }
    let title: String
    let thumbColor: SliderCellColor
}

class SliderTableViewCell: UITableViewCell {

    static func register(with tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    static func dequeue(from tableView: UITableView, indexPath: IndexPath, with configuration: SliderCellConfiguration) -> SliderTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SliderTableViewCell
        cell.configuration = configuration
        return cell
    }
    
    private static let cellIdentifier = "SliderTableViewCell"
    private static let nib = UINib(nibName: cellIdentifier, bundle: Bundle(for: SliderTableViewCell.self))

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
