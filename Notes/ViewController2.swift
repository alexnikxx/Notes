//
//  ViewController2.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 09/03/24.
//

import UIKit

final class ViewController2: UIViewController {
    private var checkbox = CheckboxView()
    
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
        let colorViews: [UIView] = [firstColor, secondColor, thirdColor, forthColor]
        colorViews.forEach { color in
             color.layer.borderWidth = 1.5
             color.layer.borderColor = UIColor.black.cgColor
        }
        
        noteTitleField.placeholder = "Enter title for you note"
        
        firstColor.addSubview(checkbox)
      
        checkbox.backgroundColor = .clear
        checkbox.frame = CGRect(x: 36, y: 4, width: 28, height: 28)
    }
}
