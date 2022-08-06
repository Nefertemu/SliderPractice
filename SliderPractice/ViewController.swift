//
//  ViewController.swift
//  SliderPractice
//
//  Created by Богдан Анищенков on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    //MARK: - LifeCycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        colorView.layer.cornerRadius = 15
    }
    
    //MARK: - IBAction
    @IBAction func chooseRed() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        setRGBColor()
    }
    
    @IBAction func chooseGreen() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        setRGBColor()
    }
    
    @IBAction func chooseBlue() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        setRGBColor()
    }
    
    //MARK: - Private methods
    private func setupLabels() {
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
    private func setRGBColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}

