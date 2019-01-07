//
//  EnumsTableViewController.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 12/18/18.
//  Copyright © 2018 Abraham Hunt. All rights reserved.
//

import UIKit

class EnumsTableViewController: UITableViewController {
    
    var moods: [TextCellConfiguration] = [TextCellConfiguration]()
    var switchRows: [SwitchCellConfiguration] = [SwitchCellConfiguration]()
    var sliderRows: [SliderCellConfiguration] = [SliderCellConfiguration]()

    enum TableSection {
        case onSwitches
        case sliders
        case moods
        
        var title: String {
            switch self {
            case .onSwitches: return NSLocalizedString("Switches", comment: "Title for switches section")
            case .sliders: return NSLocalizedString("Sliders", comment: "Title for sliders section")
            case .moods: return NSLocalizedString("Moods", comment: "Title for moods section")
            }
        }
    }
    
    enum TableRowType {
        case onSwitch(SwitchCellConfiguration)
        case slider(SliderCellConfiguration)
        case text(TextCellConfiguration)
    }
    
    var sections: [TableSection] = [.onSwitches, .sliders, .moods]
    var rows = [TableRowType]()
    
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
        let dinner = SwitchCellConfiguration.init(isSwitchOn: false, title: NSLocalizedString("Dinner", comment: "Title for the dinner switch cell"))
        switchRows = [breakfast, lunch, dinner]
        
        let calories = SliderCellConfiguration.init(title: NSLocalizedString("Calories", comment: "Title for the calories cell"), thumbColor: .colorWithRGB(red: 15, green: 74, blue: 138))
        let steps = SliderCellConfiguration.init(title: NSLocalizedString("Steps", comment: "Title for the steps cell"), thumbColor: .blue)
        sliderRows = [calories, steps]
        
        rows = moods.map({TableRowType.text($0)})
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let tableSection = sections[section]
//        switch tableSection {
//        case .onSwitches: return switchRows.count
//        case .sliders: return sliderRows.count
//        case .moods: return moods.count
//        }
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
//        let tableSection = sections[section]
//        return tableSection.title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let tableSection = sections[indexPath.section]
//        switch tableSection {
//        case .onSwitches: return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: switchRows[indexPath.row])
//        case .sliders: return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: sliderRows[indexPath.row])
//        case .moods: return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: moods[indexPath.row])
//        }
        
        let tableRow = rows[indexPath.row]
        switch tableRow {
        case .onSwitch(let configuration):
            return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        case .slider(let configuration):
            return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        case .text(let configuration):
            return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: configuration)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

