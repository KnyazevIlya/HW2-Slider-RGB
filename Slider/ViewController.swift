//
//  ViewController.swift
//  Slider
//
//  Created by admin2 on 24.03.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redInput: UITextField!
    @IBOutlet var greenInput: UITextField!
    @IBOutlet var blueInput: UITextField!
    
    var redCh: Float = 0
    var greenCh: Float = 0
    var blueCh: Float = 0
    
    enum currentChanel{
    case red, green, blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redInput.delegate = self
        self.greenInput.delegate = self
        self.blueInput.delegate = self
        
        view.backgroundColor = .lightGray
        coloredView.layer.cornerRadius = 20
        
        setupSlider(slider: redSlider, color: .red, sateliteLabel: redLabel)
        setupSlider(slider: greenSlider, color: .green, sateliteLabel: greenLabel)
        setupSlider(slider: blueSlider, color: .blue, sateliteLabel: blueLabel)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
     

    func setupSlider(slider: UISlider, color: UIColor, sateliteLabel: UILabel) {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.thumbTintColor = color
        slider.minimumTrackTintColor = color
        sateliteLabel.text = String(Int(slider.value))
    }
    
    
    func changeColor() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redCh), green: CGFloat(greenCh), blue: CGFloat(blueCh), alpha: 1.0)
    }

    @IBAction func updateRedCh() {
        redCh = redSlider.value
        redLabel.text = "R:" + String(round(100*redCh)/100)
        changeColor()
    }
    
    @IBAction func updateGreenCh() {
        greenCh = greenSlider.value
        greenLabel.text = "G:" + String(round(100*greenCh)/100)
        changeColor()
    }
    
    @IBAction func updateBlueCh() {
        blueCh = blueSlider.value
        blueLabel.text = "B:" + String(round(100*blueCh)/100)
        changeColor()
    }
    
    
    func inputColor(input: UITextField, label: UILabel, slider: UISlider, chanel: currentChanel) {
        let ch: Float
        guard let txt = input.text, !txt.isEmpty else {return}
        if let number = Float(txt) {
            if number >= 0 && number <= 1 {
                switch chanel {
                case .red:
                    redCh = number
                    ch = redCh
                case .green:
                    greenCh = number
                    ch = greenCh
                case .blue:
                    blueCh = number
                    ch = blueCh
                }
                label.text = "R:" + String(round(100*ch)/100)
                slider.setValue(ch, animated: false)
                changeColor()
            }
        }
    }
    
    @IBAction func inputRed() {
        inputColor(input: redInput, label: redLabel, slider: redSlider, chanel: .red)
    }
    @IBAction func inputGreen() {
        inputColor(input: greenInput, label: greenLabel, slider: greenSlider, chanel: .green)
    }
    @IBAction func inputBlue() {
        inputColor(input: blueInput, label: blueLabel, slider: blueSlider, chanel: .blue)
    }
    
}

