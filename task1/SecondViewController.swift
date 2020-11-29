//
//  SecondViewController.swift
//  task1
//
//  Created by Viktor on 27.11.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inputValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getKeyboardValue() {
        let value = inputValue.text!
        
        if(validation(value: value)){
            print("Okey")
            let component = CircleProgressBar(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
            component.progressLvl = CGFloat(Int(value)!)/100.0
//            component.animation=true
            component.animate(toValue: component.progressLvl)
            self.view.addSubview(component)
            
        }else {
            print("not okey")

        }
        
    }
    
    func validation(value: String) -> Bool {
        
        if(value.isNumber){
            let number = Int(value)!
            if(number >= 0 && number <= 100){
                return true
            }
        }
        return false
    }
    
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
