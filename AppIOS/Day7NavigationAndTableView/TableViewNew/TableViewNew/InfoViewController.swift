//
//  InfoViewController.swift
//  TableViewNew
//
//  Created by Ba Thoc on 8/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import Photos

class InfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.lightGray
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    let addressTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.lightGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "burger-breslin")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        button.setTitle("Lưu Thông Tin", for: .normal)
        return button
    }()
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configControl()
        
        view.backgroundColor = .white
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // mở setting
    func setting(){
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.openURL(settingsUrl)
            } else {
                UIApplication.shared.openURL(settingsUrl)
            }
        }
    }
    
    // mở thư viện
    private func fromGallery(){
        func choosePhoto(){
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.modalPresentationStyle = .popover
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            print("photo denied")
            setting()
            
        }else if (status == PHAuthorizationStatus.notDetermined) {
            
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    self.setting()
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            print("Restricted access")
            setting()
        }
    }
    
    // hàm này xử lý sau khi đã chọn được ảnh thì làm gì
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        
        self.photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    func setupLayout(){
        view.addSubview(nameTextField)
        view.addSubview(addressTextView)
        view.addSubview(photoImageView)
        view.addSubview(saveButton)
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        
        addressTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        addressTextView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        addressTextView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        addressTextView.heightAnchor.constraint(equalTo: nameTextField.heightAnchor, multiplier: 3).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: addressTextView.bottomAnchor, constant: 16).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        
    }
    
    func configControl() {
        // gesture cho ảnh
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        photoImageView.addGestureRecognizer(tapGesture)
        
        // action cho nuts
        saveButton.addTarget(self, action: #selector(saveItem), for: .touchUpInside)
    }
    
    @objc func selectImage(){
        print("selected")
        fromGallery()
    }
    
    @objc func saveItem(){
        print("saved")
    }

}
