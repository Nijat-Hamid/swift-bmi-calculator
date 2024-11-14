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
    
    weak var delegate : ViewControllerTextFieldDelegeate?
    
    @IBOutlet weak var feelingField: UITextField! {
        didSet{
            feelingField.delegate = self
        }
    }
    
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

extension ViewControllerTwo:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.didChangeText(text: textField.text)
    }
}

protocol ViewControllerTextFieldDelegeate:UIViewController{
    func didChangeText(text:String?)
}
