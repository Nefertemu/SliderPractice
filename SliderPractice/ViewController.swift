//
//  ViewController.swift
//  SliderPractice
//
//  Created by Богдан Анищенков on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        colorView.layer.cornerRadius = 15
    }
    
    @IBAction func chooseRed() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        setRGBColor()
    }
    
    @IBAction func chooseGreen() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        setRGBColor()
    }
    
    @IBAction func chooseBlue() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        setRGBColor()
    }
    
    private func setupLabels() {
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
    }
    
    private func setRGBColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}

