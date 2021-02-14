//
//  StartViewController.swift
//  RGBsliders
//
//  Created by o11ev on 14.02.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor (for color: UIColor)
}

class StartViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.newColor = view.backgroundColor
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
