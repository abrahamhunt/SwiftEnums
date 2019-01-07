//
//  TextTableViewCell.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 1/4/19.
//  Copyright © 2019 Abraham Hunt. All rights reserved.
//

import UIKit

struct TextCellConfiguration {
    let title: String
    let subtitle: String
    let mood: MoodEmoji
}

class TextTableViewCell: UITableViewCell, NibDefinedTableCell {
    
    static func dequeue(from tableView: UITableView, indexPath: IndexPath, with configuration: TextCellConfiguration) -> TextTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TextTableViewCell
        cell.configuration = configuration
        return cell
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var configuration: TextCellConfiguration? {
        didSet {
            titleLabel.text = configuration?.title
            subtitleLabel.text = configuration?.subtitle
            emojiLabel.text = configuration?.mood.rawValue
        }
    }
}
