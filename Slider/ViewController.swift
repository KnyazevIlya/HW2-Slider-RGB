//
//  ViewController.swift
//  Slider
//
//  Created by admin2 on 24.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    var redCh: Float = 0
    var greenCh: Float = 0
    var blueCh: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(slider: redSlider, color: .red, sateliteLabel: redValue)
        setupSlider(slider: greenSlider, color: .green, sateliteLabel: greenValue)
        setupSlider(slider: blueSlider, color: .blue, sateliteLabel: blueValue)
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
        redValue.text = String(redCh)
        changeColor()
    }
    
    @IBAction func updateGreenCh() {
        greenCh = greenSlider.value
        greenValue.text = String(greenCh)
        changeColor()
    }
    
    @IBAction func updateBlueCh() {
        blueCh = blueSlider.value
        blueValue.text = String(blueCh)
        changeColor()
    }
}

