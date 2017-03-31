//
//  AddViewController.swift
//  EmployeeList
//
//  Created by Shripal Jain on 30/03/17.
//  Copyright © 2017 Shripal Jain. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate  {

    @IBOutlet weak var desgtxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var profilebtn: UIButton!
    var imgtask:UIImage!
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        desgtxt.delegate = self
        nametxt.delegate = self
    }

    @IBAction func addphoto(_ sender: Any) {
        let imgpicker = UIImagePickerController()
        imgpicker.delegate = self
        imgpicker.sourceType = .photoLibrary
        imgpicker.allowsEditing = true
        self.present(imgpicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgtask = info[UIImagePickerControllerEditedImage] as! UIImage
        profilebtn.setImage(imgtask, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let emp = Employee(context: context)
        emp.name = desgtxt.text
        emp.designation = nametxt.text
        emp.photo = UIImagePNGRepresentation(imgtask) as NSData?
        delegate.saveContext()
        print("saved")
        self.dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

   
}
