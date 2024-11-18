//
//  ViewController.swift
//  bmi-calculator
//
//  Created by Nijat Hamid on 11/13/24.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var previousFeelingText: UILabel!
    
    @IBAction func calculateBotton(_ sender: UIButton) {
        guard let (value, message) = bmiCalculator() else { return }
        let sb = UIStoryboard(name: "Result", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? ResultController else { return }
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        
        vc.bmiResultValue = value
        vc.bmiCategoryValue = message
        
        present(vc, animated: true) { [unowned self] in
           reset()
         }
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func bmiCalculator() -> (String, String)?{
        guard
            let heightText = heightField.text,
            let weightText = weightField.text,
            let height = Double(heightText),
            let weight = Double(weightText),
            height > 0,
            weight > 0
        else {
            return nil
        }
        
        let heightM = height / 100
        let bmi = weight / (heightM * heightM)
        
        let status = BMIStatus.category(for: bmi).rawValue
        let roundedBMI = String(format: "%.2f", bmi)
        return (roundedBMI, status)
    }
    
    private func reset (){
        heightField.text = ""
        weightField.text = ""
    }
}

enum BMIStatus: String {
    case underweight = "Underweight"
    case normal = "Normal"
    case overweight = "Overweight"
    case obesity = "Obesity"
    
    static func category(for bmi: Double) -> BMIStatus {
        switch bmi {
        case ..<18.5:
            return .underweight
        case 18.5..<24.9:
            return .normal
        case 25.0..<29.9:
            return .overweight
        default:
            return .obesity
        }
    }
}

extension MainController:ResultControllerTextFieldDelegeate{
    func didChangeText(text: String?) {
        previousFeelingText.text = text
    }
    
}
