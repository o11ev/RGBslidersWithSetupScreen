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
        
        setViewColor()
    }

    @IBAction func redSliderAction() {
        setLabelValue(for: redColorLabel)
        setViewColor()
        setTextFieldValue(for: redTextField)
    }
    
    @IBAction func greenSliderAction() {
        setLabelValue(for: greenColorLabel)
        setViewColor()
        setTextFieldValue(for: greenTextField)
    }
    
    @IBAction func blueSliderAction() {
        setLabelValue(for: blueColorLabel)
        setViewColor()
        setTextFieldValue(for: blueTextField)
    }
    
    private func setViewColor () {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
    
    private func setLabelValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redColorLabel.text = sliderConvertToString(from: redSlider)
            case 1: greenColorLabel.text = sliderConvertToString(from: greenSlider)
            case 2: blueColorLabel.text = sliderConvertToString(from: blueSlider)
            default: break
            }
        }
    }
    
    private func sliderConvertToString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    private func setTextFieldValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redTextField.text = sliderConvertToString(from: redSlider)
            case 1: greenTextField.text = sliderConvertToString(from: greenSlider)
            case 2: blueTextField.text = sliderConvertToString(from: blueSlider)
            default: break
            }
        }
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
    }
}
