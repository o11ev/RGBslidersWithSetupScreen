//
//  ViewController.swift
//  RGBsliders
//
//  Created by o11ev on 31.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 10
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setViewColor()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setLabelValue(for: sender)
        setViewColor()
    }

    
    private func setViewColor () {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
    

    private func setLabelValue(for slider: UISlider) {
        let sliderValue = sliderConvertToString(from: slider)
            switch slider.tag {
            case 0:
                redColorLabel.text = sliderValue
                redTextField.text = sliderValue
            case 1:
                greenColorLabel.text = sliderValue
                greenTextField.text = sliderValue
            case 2:
                blueColorLabel.text = sliderValue
                blueTextField.text = sliderValue
            default: break
        }
    }
    
    private func sliderConvertToString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    private func setTextFieldValue(for textField: UITextField) {
        guard let textFieldValue = Float(textField.text ?? "") else { return }
            switch textField.tag {
            case 0:
                redColorLabel.text = textField.text
                redSlider.value = textFieldValue
            case 1:
                greenColorLabel.text = textField.text
                greenSlider.value = textFieldValue
            case 2:
                blueColorLabel.text = textField.text
                blueSlider.value = textFieldValue
            default: break
        }
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       setTextFieldValue(for: textField)
       setViewColor()
    }
}
