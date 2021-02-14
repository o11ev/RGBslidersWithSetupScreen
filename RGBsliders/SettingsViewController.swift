//
//  ViewController.swift
//  RGBsliders
//
//  Created by o11ev on 31.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    //view
    @IBOutlet var coloredView: UIView!
    
    //labels
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    //sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 10
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        setViewColor()
    }

    @IBAction func redSliderAction() {
        setValue(for: redColorLabel)
        setViewColor()
    }
    
    @IBAction func greenSliderAction() {
        setValue(for: greenColorLabel)
        setViewColor()
    }
    
    @IBAction func blueSliderAction() {
        setValue(for: blueColorLabel)
        setViewColor()
    }
    
    private func setViewColor () {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redColorLabel.text = convertToString(from: redSlider)
            case 1: greenColorLabel.text = convertToString(from: greenSlider)
            case 2: blueColorLabel.text = convertToString(from: blueSlider)
            default: break
            }
        }
    }
    
    private func convertToString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

