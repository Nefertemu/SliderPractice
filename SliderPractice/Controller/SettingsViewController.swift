//
//  ViewController.swift
//  SliderPractice
//
//  Created by Богдан Анищенков on 05.08.2022.
//

import UIKit

final class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Public properties
    
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
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    
    //MARK: - LifeCycle View
    
    override func viewWillAppear(_ animated: Bool) {
        setupSliders()
        setRGBColor()
        setupLabels()
        setupTextFields()
        addDoneButtonsToKeyboard()
                
        colorView.layer.cornerRadius = 15
    
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        redValueTF.delegate = self
        greenValueTF.delegate = self
        blueValueTF.delegate = self
    }
    
    //MARK: - IBActions
    
    @IBAction func sliderRGB(_ sender: UISlider) {
        setRGBColor()
        setupLabels()
        setupTextFields()
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
        blueSlider.value = Float(blueValue)
    }
    
    private func setRGBColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setupTextFields() {
        redValueTF.text = String(format: "%.2f", redSlider.value)
        greenValueTF.text = String(format: "%.2f", greenSlider.value)
        blueValueTF.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateSlidersFromTF() {
        redSlider.value = Float(redValueTF.text ?? "") ?? 0
        greenSlider.value = Float(greenValueTF.text ?? "") ?? 0
        blueSlider.value = Float(blueValueTF.text ?? "") ?? 0
    }
    
    private func addDoneButtonsToKeyboard() {
        redValueTF.addDoneButtonOnKeyboard()
        greenValueTF.addDoneButtonOnKeyboard()
        blueValueTF.addDoneButtonOnKeyboard()
    }
    
    private func showRangeAlert() {
        let alert = UIAlertController(title: "Wrong format!", message: "Please make sure you have entered numbers", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    //MARK: - Internal methods
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        let textToFloat = Float(textField.text ?? "") ?? 0
        
        guard String(textField.text!).isNumeric else {
            showRangeAlert()
            textField.text = ""
            return
        }
        
        if textToFloat > 1 {
            textField.text = String(1.00)
        } else if textToFloat < 0 {
            textField.text = String(0.00)
        }
        
        updateSlidersFromTF()
        setRGBColor()
    }
    
    //MARK: - Overridden methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}


//MARK: - Extensions

extension String {
    var isNumeric: Bool {
            guard self.count > 0 else { return false }
            let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
            return Set(self).isSubset(of: nums)
        }
}

extension UITextField {
    
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        keyboardToolbar.backgroundColor = .white
        self.inputAccessoryView = keyboardToolbar
    }
}
