//
//  EnumsTableViewController.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 12/18/18.
//  Copyright © 2018 Abraham Hunt. All rights reserved.
//

import UIKit

class EnumsTableViewController: UITableViewController {
    
    enum TableSection {
        case moods
        case switches
        case sliders
        
        var title: String {
            switch self {
            case .moods: return NSLocalizedString("Moods", comment: "Title for moods section")
            case .switches: return NSLocalizedString("Sliders", comment: "Title for sliders section")
            case .sliders: return NSLocalizedString("Switches", comment: "Title for switches section")
            }
        }
    }
    
    enum TableCellType {
        case text(configuration: TextCellConfiguration)
        case onSwitch(configuration: SwitchCellConfiguration)
        case slider(configuration: SliderCellConfiguration)
    }
    
    var moods: [TextCellConfiguration] = [TextCellConfiguration]()
    var switchRows: [SwitchCellConfiguration] = [SwitchCellConfiguration]()
    var sliderRows: [SliderCellConfiguration] = [SliderCellConfiguration]()

    var sections: [TableSection] = [.moods, .switches, .sliders]
    
    var intermingled: [TableCellType] = [TableCellType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwitchTableViewCell.register(with: tableView)
        SliderTableViewCell.register(with: tableView)
        TextTableViewCell.register(with: tableView)
        
        let sadMood = TextCellConfiguration.init(title: NSLocalizedString("Sad", comment: "Title for the sad mood cell"), subtitle: NSLocalizedString("It's Tuesday huh?", comment: "Subtitle for the sad mood cell"), mood: .sad)
        let happyMood = TextCellConfiguration.init(title: NSLocalizedString("Happy", comment: "Title for the happy mood cell"), subtitle: NSLocalizedString("Hump day complete", comment: "Subtitle for the happy mood cell"), mood: .happy)
        moods = [sadMood, happyMood]
        
        let breakfast = SwitchCellConfiguration.init(isSwitchOn: true, title: NSLocalizedString("Breakfast", comment: "Title for the breakfast switch cell"))
        let lunch = SwitchCellConfiguration.init(isSwitchOn: false, title: NSLocalizedString("Lunch", comment: "Title for the lunch switch cell"))
        switchRows = [breakfast, lunch]
        
        let calories = SliderCellConfiguration.init(title: NSLocalizedString("Calories", comment: "Title for the calories cell"), thumbColor: .red)
        let steps = SliderCellConfiguration.init(title: NSLocalizedString("Steps", comment: "Title for the steps cell"), thumbColor: .blue)
        sliderRows = [calories, steps]
        
        intermingled = moods.map({ TableCellType.text(configuration: $0)}) + switchRows.map({ TableCellType.onSwitch(configuration: $0)}) + sliderRows.map({ TableCellType.slider(configuration: $0)})
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let section = sections[section]
//        switch section {
//        case .moods: return moods.count
//        case .switches: return switchRows.count
//        case .sliders: return sliderRows.count
//        }
        return intermingled.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = sections[section]
//        return section.title
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let section = sections[indexPath.section]
//        switch section {
//        case .moods: return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: moods[indexPath.row])
//        case .switches: return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: switchRows[indexPath.row])
//        case .sliders: return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: sliderRows[indexPath.row])
//        }
        let type = intermingled[indexPath.row]
        switch type {
        case .text(let configuration): return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        case .onSwitch(let configuration): return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        case .slider(let configuration): return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

