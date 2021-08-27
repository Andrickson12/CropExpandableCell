//
//  cropTableView.swift
//  Crop
//
//  Created by Andrickson Coste on 8/26/21.
//

import UIKit

class cropTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //@IBOutlet weak var siendo: UISegmentedControl!
    
    @IBOutlet weak var segmentedControlBtn: UISegmentedControl!
    
    
    //TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    //Hard-Coded tableView data
    let tableContent = ["Areas of observation - please note concern(s) if any, as well as corrective action(s)","Surranding Areas/Adjacent Activities","Building Grounds","Building Structre","Water System", "Others"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        ///
        title = "Cooler Facility Risk Assessment"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.orange
        
    }
    
    @IBAction func segmentBtn(_ sender: UISegmentedControl){
        
    }
    
//    @IBAction func dfgh(_ sender: UISegmentedControl) {
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableContent[indexPath.row]
        
        
        
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
}
