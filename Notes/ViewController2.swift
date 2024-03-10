//
//  ViewController2.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 09/03/24.
//

import UIKit

class ViewController2: UIViewController {

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
    }
}
