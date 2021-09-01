//
//  ViewController.swift
//  Crop
//
//  Created by Andrickson Coste on 8/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 330, y: 380, width: 200, height: 200))
        button.setTitle("Areas of observation", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        performSegue(withIdentifier: "areaOfObservation", sender: ViewController.self)
    }
}

