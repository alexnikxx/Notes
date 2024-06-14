//
//  ViewController2.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 09/03/24.
//

import UIKit

final class ScreenEditViewController: UIViewController {
    var note: Note?
    private var date: Date? = nil
    private var checkbox = CheckboxView()
    private var colorChoice: UIColor? {
        didSet {
            if colorChoice == firstColor.backgroundColor {
                firstColor.addSubview(checkbox)
            } else if colorChoice == secondColor.backgroundColor {
                secondColor.addSubview(checkbox)
            } else if colorChoice == thirdColor.backgroundColor {
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
        colorChoice = firstColor.backgroundColor
    }

    @IBAction func secondColorTapped(_ sender: UITapGestureRecognizer) {
        colorChoice = secondColor.backgroundColor
    }

    @IBAction func thirdColorTapped(_ sender: UITapGestureRecognizer) {
        colorChoice = thirdColor.backgroundColor
    }

    @IBAction func forthColorTapped(_ sender: UITapGestureRecognizer) {
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

        if let note = note {
            editingNote(note: note)
        } else {
            noteTitleField.placeholder = "Enter title for you note"
            firstColor.addSubview(checkbox)
        }

        checkbox.backgroundColor = .clear
        checkbox.frame = CGRect(x: 36, y: 4, width: 28, height: 28)
    }

    @objc private func buttonSaveTapped() {
        guard let text = noteTitleField.text else { return }

        if note?.uid == nil {
            note = Note(
                uid: nil,
                title: text == "" ? "Untitled" : text,
                content: noteText.text,
                color: colorChoice,
                importance: .normal,
                selfDestructionDate: dataPicker.isHidden ? nil : dataPicker.date
            )
            if let savedNote = note {
                delegate?.saveNote(note: savedNote)
            }
        } else {
            note = Note(
                uid: self.note?.uid,
                title: text == "" ? "Untitled" : text,
                content: noteText.text,
                color: colorChoice,
                importance: .normal,
                selfDestructionDate: dataPicker.isHidden ? nil : dataPicker.date
            )
            if let updatedNote = note {
                delegate?.updateNote(note: updatedNote)
            }
        }

        self.navigationController?.popViewController(animated: true)
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
        colorChoice = note.color
    }
}
