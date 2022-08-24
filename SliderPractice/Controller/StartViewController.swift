//
//  StartViewController.swift
//  SliderPractice
//
//  Created by Богдан Анищенков on 23.08.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setRGBValues(red: CGFloat, green: CGFloat, blue: CGFloat)
}

final class StartViewController: UIViewController {
    
    var redValue: CGFloat = 1
    var greenValue: CGFloat = 1
    var blueValue: CGFloat = 1

    override func viewWillAppear(_ animated: Bool) {
        setBackgroundColor()
        print(redValue, greenValue, blueValue)
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC =  segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.redValue = redValue
        settingsVC.greenValue = greenValue
        settingsVC.blueValue = blueValue
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: 1)
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setRGBValues(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redValue = red
        greenValue = green
        blueValue = blue
    }
}
