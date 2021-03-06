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
    
    var delegate: SettingsViewControllerDelegate!
    var newColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 10
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setSlidersFromColor(color: newColor)
        setColorValues()
        setViewColor()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColorValues()
        setViewColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(for: newColor)
        dismiss(animated: true)
    }
    
    private func setViewColor () {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
        newColor = coloredView.backgroundColor
    }
    
    private func setSlidersFromColor(color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func sliderToShortString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColorValues() {
        redTextField.text = sliderToShortString(from: redSlider)
        greenTextField.text = sliderToShortString(from: greenSlider)
        blueTextField.text = sliderToShortString(from: blueSlider)
        
        redColorLabel.text = sliderToShortString(from: redSlider)
        greenColorLabel.text = sliderToShortString(from: greenSlider)
        blueColorLabel.text = sliderToShortString(from: blueSlider)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFieldValue = Float(textField.text ?? "") else { return }
        
        switch textField.tag {
        case 0: redSlider.value = textFieldValue
        case 1: greenSlider.value = textFieldValue
        case 2: blueSlider.value = textFieldValue
        default: break
        }
        
        setColorValues()
        setViewColor()
    }
}
