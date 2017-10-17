//
//  CameraViewController.swift
//  geoMessenger
//
//  Created by Charlene Angeles on 10/16/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBAction func btnSavePhoto_Tap(_ sender: Any) {
        let imageData = UIImageJPEGRepresentation(imgPhoto.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        
        let ac = UIAlertController(title: "Photo Saved!", message: "Your photo was saved successfully", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)

    }
    
    @IBAction func btnTakePhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
         let imgPicker = UIImagePickerController()
         imgPicker.delegate = self
         imgPicker.sourceType = .camera
         imgPicker.allowsEditing = false
            
            self.present(imgPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnPickPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = true
            self.present(imgPicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgPhoto.image = selectedImage
        }
        else {
            print("Something went wrong")
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: { _ in})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
