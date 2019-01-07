//
//  TableSection.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 1/7/19.
//  Copyright © 2019 Abraham Hunt. All rights reserved.
//

import Foundation
import UIKit

class TableSection {
    
    enum TableCellType {
        case onSwitch(_ configuration: SwitchCellConfiguration)
        case slider(_ configuration: SliderCellConfiguration)
        case text(_ configuration: TextCellConfiguration)
        
        func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
            switch self {
            case .onSwitch(let configuration):
                return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
            case .slider(let configuration):
                return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
            case .text(let configuration):
                return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
            }
        }
    }
    
    private var cellTypes = [TableCellType]()
    
    var count: Int {
        return cellTypes.count
    }
    
    var title: String?
    
    init (title: String?, types: [TableCellType]) {
        self.title = title
        cellTypes = types
    }
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let configuration = cellTypes[indexPath.row]
        return configuration.cell(tableView: tableView, indexPath: indexPath)
    }
        
}

class SwitchTableSection: TableSection {
    override init(title: String?, types: [TableCellType]) {
        super.init(title: title, types: types)
        assert(false, "init(title:types:) not supported on subclasses use type defined initializer")
    }
    init(title: String, cellConfigurations: [SwitchCellConfiguration]) {
        super.init(title: title, types: cellConfigurations.map({TableCellType.onSwitch($0)}))
    }
}

class SliderTableSection: TableSection {
    override init(title: String?, types: [TableCellType]) {
        super.init(title: title, types: types)
        assert(false, "init(title:types:) not supported on subclasses use type defined initializer")
    }
    init(title: String, cellConfigurations: [SliderCellConfiguration]) {
        super.init(title: title, types: cellConfigurations.map({TableCellType.slider($0)}))
    }
}

class TextTableSection: TableSection {
    override init(title: String?, types: [TableCellType]) {
        super.init(title: title, types: types)
        assert(false, "init(title:types:) not supported on subclasses use type defined initializer")
    }
    init(title: String, cellConfigurations: [TextCellConfiguration]) {
        super.init(title: title, types: cellConfigurations.map({TableCellType.text($0)}))
    }
}
