//
//  FirstViewController.swift
//  task1
//
//  Created by Viktor on 27.11.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let times = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FirstViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello " + String(indexPath.item + 1))
    }
}

extension FirstViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = "\(indexPath.item + 1)."
        
        
        
        let component = CircleProgressBar(frame: CGRect(x: 150, y: 0, width: 100, height: 100))
        component.progressLvl = CGFloat(Int.random(in: 0...100))/100.0
        cell.addSubview(component)

        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(times)
    }
    
    
}
