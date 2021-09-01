//
//  cropTableView.swift
//  Crop
//
//  Created by Andrickson Coste on 8/26/21.
//

import UIKit

class Section {
    let title: String
    let options:[String]
    var isOpened: Bool = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class cropTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //TableView
    private let tableViewData: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(title: "Areas of observation - please note concern(s) if any, as well as corrective action(s)", options: [0].compactMap({return "Cell \($0)"})),
            Section(title: "Surranding Areas/Adjacent Activities", options: [0].compactMap({return "Cell \($0)"})),
            Section(title: "Building Grounds", options: [0].compactMap({return "Cell \($0)"})),
            Section(title: "Building Structre", options: [0].compactMap({return "Cell \($0)"})),
            Section(title: "Water System", options: [0].compactMap({return "Cell \($0)"})),
            Section(title: "Others", options: [0].compactMap({return "Cell \($0)"}))
        ]
        
        view.addSubview(tableViewData)
        tableViewData.delegate = self
        tableViewData.dataSource = self
        tableViewData.frame = view.bounds
        
        title = "Cooler Facility Risk Assessment"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Globally
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .lightGray
        }
        else {
            cell.backgroundColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else {
            print("Press the UITableViewCell")
        }
    }
}
