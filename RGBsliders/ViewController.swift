//
//  ViewController.swift
//  RGBsliders
//
//  Created by o11ev on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {
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
        coloredView.layer.cornerRadius = 20
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
    }

    @IBAction func redSliderAction() {
        redColorLabel.text = String(format: "%.02f", redSlider.value)
        setViewColor()
    }
    
    @IBAction func greenSliderAction() {
        greenColorLabel.text = String(format: "%.02f", greenSlider.value)
        setViewColor()
    }
    
    @IBAction func blueSliderAction() {
        blueColorLabel.text = String(format: "%.02f", blueSlider.value)
        setViewColor()
    }
    
    private func setViewColor () {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
}

