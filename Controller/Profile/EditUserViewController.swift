//
//  EditUserViewController.swift
//  UsersApp
//
//  Created by Игорь on 23.03.2021.
//

import UIKit
import CoreData

class EditUserViewController: UIViewController{
    
    var user: UserData!

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBAction func newUserName(_ sender: UITextField) {
        user.name.first = firstNameTextField.text!
    }
    
    @IBAction func newUserLastName(_ sender: UITextField) {
        user.name.last = lastNameTextField.text!
    }
    
    @IBAction func newUserEmail(_ sender: UITextField) {
        user.email = emailTextField.text!
    }
    
    @IBAction func newUserPhone(_ sender: UITextField) {
        user.phone = phoneTextField.text!
    }
    //    @IBAction func newUserName(_ sender: UITextField) {
//        user.name.first = firstNameTextField.text!
//    }
//    @IBAction func newUserLastName(_ sender: UITextField) {
//        user.name.last = lastNameTextField.text!
//    }
//    @IBAction func newUserPhone(_ sender: UITextField) {
//        user.phone = phoneTextField.text!
//    }
//    @IBAction func newUserEmail(_ sender: UITextField) {
//        user.email = emailTextField.text!
//    }

    
    @IBAction func saveUser(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context ) else {return}
        
        let taskObject = User(entity: entity, insertInto: context)
        taskObject.firstName = user.name.first
        taskObject.lastName = user.name.last
        taskObject.phone = user.phone
        taskObject.email = user.email
        taskObject.image = user.picture?.large
        
        do{
            try context.save()
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        performSegue(withIdentifier: "goToSavePage", sender: self)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        userImage.load(urlString: user.picture!.large)
        setValues()
        
    }


    
    private func setValues(){
        firstNameTextField.text = user.name.first
        lastNameTextField.text = user.name.last
        emailTextField.text = user.email
        phoneTextField.text = user.phone
    }
}

extension EditUserViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 25 && newLength > 0
    }
}
