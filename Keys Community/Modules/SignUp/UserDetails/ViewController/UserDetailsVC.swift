//
//  UserDetailsViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 02/06/2023.
//

import UIKit
import AVFoundation

class UserDetailsVC: BaseVC,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //MARK: - IbOutlets
    
    @IBOutlet private weak var uploadPhotoBtn: UIButton!
    @IBOutlet private weak var firstNameSuperVu: UIView!
    @IBOutlet private weak var lastNameSuperVu: UIView!
    @IBOutlet private weak var regNoSuperVu: UIView!
    @IBOutlet private weak var userProfileImageVu: UIImageView!
    
    
    @IBOutlet weak var firsrNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var vehicleRegNoTF: UITextField!
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "Your Details"
        self.regNoSuperVu.layer.cornerRadius = 10
        self.lastNameSuperVu.layer.cornerRadius = 10
        self.firstNameSuperVu.layer.cornerRadius = 10
        self.uploadPhotoBtn.layer.cornerRadius = 10
        
        userProfileImageVu.layer.cornerRadius = 50
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboardOnOutsideClick))
        self.view.addGestureRecognizer(tapGesture)

    }
    
    @objc private func removeKeyboardOnOutsideClick() {
        // Dismiss the keyboard when a tap is detected outside of the keyboard area
        view.endEditing(true)
    }
    
    func checkCameraAuthorization()  {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
            case .authorized:
                showImagePicker()
            case .notDetermined:
                // Camera access permission is not determined, request permission
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                    if granted {
                        // Permission granted, proceed with image picker
                        DispatchQueue.main.async {
                            self.showImagePicker()
                        }
                    } else {
                        // Permission denied, handle the scenario when user denies camera access
                        print("Camera access denied.")
                    }
                }
            case .denied, .restricted:
                // Camera access is denied or restricted, show an alert or take appropriate action
                print("Camera access denied or restricted.")
            @unknown default:
                break
        }
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
        self.checkCameraAuthorization()
    }
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary // You can change this to .photoLibrary for accessing the photo library instead of the camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            userProfileImageVu.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Public Functions
    
    @IBAction func continuePressed(_ sender: UIButton) {
        
        UserDetailsVM().createUser(firstName: "Ammar", lastName: "Masood", mobileNumber: Constants.userMobNo ?? "", password: "1111111", type: "mobile",email: nil)
        
        // self.navigationController?.pushViewController(AddCardVC(), animated: true)
    }
}
