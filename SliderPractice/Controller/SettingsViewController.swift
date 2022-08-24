//
//  ViewController.swift
//  SliderPractice
//
//  Created by Богдан Анищенков on 05.08.2022.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var redValue: CGFloat = 1
    var greenValue: CGFloat = 1
    var blueValue: CGFloat = 1
    
    var delegate: SettingsViewControllerDelegate!

    //MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
        
    //MARK: - LifeCycle View
    
    override func viewWillAppear(_ animated: Bool) {
        setupSliders()
        setRGBColor()
        setupLabels()
        print(redValue, greenValue, blueValue)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
    }
    
    //MARK: - IBActions
    
    @IBAction func sliderRGB(_ sender: UISlider) {
        setRGBColor()
        setupLabels()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setRGBValues(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }
    
    
    //MARK: - Private methods
    
    private func setupLabels() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupSliders() {
        redSlider.value = Float(redValue)
        greenSlider.value = Float(greenValue)
        blueSlider.value = Float(greenValue)
    }
    
    private func setRGBColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
}

