// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

protocol OptionTableViewCellDelegate {
    func didEnterOption(option: String, for indexPath: IndexPath)
}

class OptionTableViewCell: UITableViewCell {
    
    var delegate: OptionTableViewCellDelegate?
    private var currentIndex : IndexPath = IndexPath()
    
    @IBOutlet weak var optionTextField: UITextField!

    
    func configureCell(option: String,indexPath: IndexPath){
        optionTextField.text = option
        optionTextField.delegate = self
        currentIndex = indexPath
    }

}

extension OptionTableViewCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        optionTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = Constants.textFiledPlaceHolder
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let option = optionTextField.text {
            delegate?.didEnterOption(option: option, for: currentIndex)
        }
        
    }
}
