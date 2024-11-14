//
//  ViewControllerTwo.swift
//  bmi-calculator
//
//  Created by Nijat Hamid on 11/13/24.
//

import UIKit

class ViewControllerTwo: UIViewController {
   
    var bmiResultValue = "N/A"
    var bmiCategoryValue = "N/A"
    
    @IBOutlet weak var bmiResult: UILabel!{
        didSet{
            bmiResult.text = bmiResultValue
        }
    }
    
    @IBOutlet weak var categoryResult: UILabel!{
        didSet{
            categoryResult.text = bmiCategoryValue
        }
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
