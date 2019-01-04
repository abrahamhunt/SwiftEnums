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
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return moods.count
        case 1: return switchRows.count
        case 2: return sliderRows.count
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return NSLocalizedString("Moods", comment: "Title for moods section")
        case 1: return NSLocalizedString("Sliders", comment: "Title for sliders section")
        case 2: return NSLocalizedString("Switches", comment: "Title for switches section")
        default: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return SwitchTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: switchRows[indexPath.row])
        case 1: return SliderTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: sliderRows[indexPath.row])
        case 2: return TextTableViewCell.dequeue(from: tableView, indexPath: indexPath, with: moods[indexPath.row])
        default: assert(false, "Shouldn't have cells in another section")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

