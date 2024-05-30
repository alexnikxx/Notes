//
//  ScreenEditViewControllerDelegate.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 30/05/24.
//

import UIKit

protocol ScreenEditViewControllerDelegate: AnyObject {
    func saveNote(note: Note)
}
