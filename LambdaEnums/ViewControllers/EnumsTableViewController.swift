//
//  EnumsTableViewController.swift
//  LambdaEnums
//
//  Created by Abraham Hunt on 12/18/18.
//  Copyright © 2018 Abraham Hunt. All rights reserved.
//

import UIKit

class EnumsTableViewController: UITableViewController {
    
    // Unify collections with an enforced order, sounds like an array
    var sections = [TableSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwitchTableViewCell.register(with: tableView)
        SliderTableViewCell.register(with: tableView)
        TextTableViewCell.register(with: tableView)
        
        let sadMood = TextCellConfiguration.init(title: NSLocalizedString("Sad", comment: "Title for the sad mood cell"), subtitle: NSLocalizedString("It's Tuesday huh?", comment: "Subtitle for the sad mood cell"), mood: .sad)
        let happyMood = TextCellConfiguration.init(title: NSLocalizedString("Happy", comment: "Title for the happy mood cell"), subtitle: NSLocalizedString("Hump day complete", comment: "Subtitle for the happy mood cell"), mood: .happy)
        
        let breakfast = SwitchCellConfiguration.init(isSwitchOn: true, title: NSLocalizedString("Breakfast", comment: "Title for the breakfast switch cell"))
        let lunch = SwitchCellConfiguration.init(isSwitchOn: false, title: NSLocalizedString("Lunch", comment: "Title for the lunch switch cell"))
        let dinner = SwitchCellConfiguration.init(isSwitchOn: false, title: NSLocalizedString("Dinner", comment: "Title for the dinner switch cell"))
        
        let calories = SliderCellConfiguration.init(title: NSLocalizedString("Calories", comment: "Title for the calories cell"), thumbColor: .red)
        let steps = SliderCellConfiguration.init(title: NSLocalizedString("Steps", comment: "Title for the steps cell"), thumbColor: .blue)
        
//        sections = [SwitchTableSection(title: NSLocalizedString("Switches", comment: "Title for switches section"), cellConfigurations: [breakfast, lunch, dinner]), SliderTableSection(title: NSLocalizedString("Sliders", comment: "Title for sliders section"), cellConfigurations: [calories, steps]), TextTableSection(title: NSLocalizedString("Moods", comment: "Title for moods section"), cellConfigurations: [sadMood, happyMood])]
        
        sections = [TableSection(title: nil, types: [.onSwitch(breakfast), .slider(calories), .text(happyMood), .slider(steps), .onSwitch(lunch), .text(sadMood), .onSwitch(dinner)])]
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableSection = sections[section]
        return tableSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let tableSection = sections[section]
        return tableSection.title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = sections[indexPath.section]
        return tableSection.cell(tableView: tableView, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

