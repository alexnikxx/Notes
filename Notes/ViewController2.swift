//
//  ViewController2.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 09/03/24.
//

import UIKit

class ViewController2: UIViewController {
    var checkbox = CheckboxView()
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (sender.isOn == true) {
            dataPicker.isHidden = false
        } else {
            dataPicker.isHidden = true
        }
    }
        
    @IBOutlet weak var dateSwitch: UISwitch!
    @IBOutlet weak var noteTitleField: UITextField!
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var noteText: UITextView!
    
    @IBOutlet weak var firstColor: UIView!
    @IBOutlet weak var secondColor: UIView!
    @IBOutlet weak var thirdColor: UIView!
    @IBOutlet weak var forthColor: UIView!
    
    @IBAction func firstColorTapped(_ sender: UITapGestureRecognizer) {
        firstColor.addSubview(checkbox)
    }
    
    @IBAction func secondColorTapped(_ sender: UITapGestureRecognizer) {
        secondColor.addSubview(checkbox)
    }
    
    @IBAction func thirdColorTapped(_ sender: UITapGestureRecognizer) {
        thirdColor.addSubview(checkbox)
    }
    
    @IBAction func forthColorTapped(_ sender: UITapGestureRecognizer) {
        forthColor.addSubview(checkbox)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstColor.layer.borderWidth = 1.5
        firstColor.layer.borderColor = UIColor.black.cgColor
        
        secondColor.layer.borderWidth = 1.5
        secondColor.layer.borderColor = UIColor.black.cgColor
        
        thirdColor.layer.borderWidth = 1.5
        thirdColor.layer.borderColor = UIColor.black.cgColor
        
        forthColor.layer.borderWidth = 1.5
        forthColor.layer.borderColor = UIColor.black.cgColor
        
        noteTitleField.placeholder = "Enter title for you note"
        
        
        firstColor.addSubview(checkbox)
        
        let newXPosition = checkbox.frame.origin.x + 36
        let newYPosition = checkbox.frame.origin.y + 4
        
        checkbox.frame.size.height = 28
        checkbox.frame.size.width = 28
        checkbox.backgroundColor = .clear
        checkbox.frame = CGRect(x: newXPosition, y: newYPosition, width: checkbox.frame.size.width, height: checkbox.frame.size.height)
    }
}
