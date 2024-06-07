//
//  ViewController2.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 09/03/24.
//

import UIKit

final class ScreenEditViewController: UIViewController {
    var note: Note?
    private var checkbox = CheckboxView()
    private var colorChoice: UIColor? {
        didSet {
            if colorChoice == .cyan {
                firstColor.addSubview(checkbox)
            } else if colorChoice == .red {
                secondColor.addSubview(checkbox)
            } else if colorChoice == .yellow {
                thirdColor.addSubview(checkbox)
            } else {
                forthColor.addSubview(checkbox)
            }
        }
    }
    weak var delegate: ScreenEditViewControllerDelegate?

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
        colorChoice = firstColor.backgroundColor
    }

    @IBAction func secondColorTapped(_ sender: UITapGestureRecognizer) {
        secondColor.addSubview(checkbox)
        colorChoice = secondColor.backgroundColor
    }

    @IBAction func thirdColorTapped(_ sender: UITapGestureRecognizer) {
        thirdColor.addSubview(checkbox)
        colorChoice = thirdColor.backgroundColor
    }

    @IBAction func forthColorTapped(_ sender: UITapGestureRecognizer) {
        forthColor.addSubview(checkbox)
        colorChoice = forthColor.backgroundColor
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        if (sender.isOn == true) {
            dataPicker.isHidden = false
        } else {
            dataPicker.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let colorViews: [UIView] = [firstColor, secondColor, thirdColor, forthColor]
        colorViews.forEach { color in
            color.layer.borderWidth = 1.5
            color.layer.borderColor = UIColor.black.cgColor
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", image: nil, target: self, action: #selector(buttonSaveTapped))

        noteTitleField.placeholder = "Enter title for you note"

        firstColor.addSubview(checkbox)

        checkbox.backgroundColor = .clear
        checkbox.frame = CGRect(x: 36, y: 4, width: 28, height: 28)

        guard let note = note else { return }
        editingNote(note: note)
    }

    @objc private func buttonSaveTapped() {
        note = Note(uid: nil, title: noteTitleField.text ?? "Untitled", content: noteText.text, color: colorChoice, importance: .normal, selfDestructionDate: dataPicker.date)
        if let note = note {
            delegate?.saveNote(note: note)
            self.navigationController?.popViewController(animated: true)
        }
    }

    private func editingNote(note: Note) {
        // texts
        noteTitleField.text = note.title
        noteText.text = note.content

        // switch
        if let date = note.selfDestructionDate {
            dateSwitch.isOn = true
            dataPicker.setDate(date, animated: true)
        } else {
            dateSwitch.isOn = false
            dataPicker.isHidden = true
        }

        // color
        if note.color == .cyan {
            firstColor.addSubview(checkbox)
        } else if note.color == .red {
            secondColor.addSubview(checkbox)
        } else if note.color == .yellow {
            thirdColor.addSubview(checkbox)
        } else {
            forthColor.addSubview(checkbox)
        }
    }
}
