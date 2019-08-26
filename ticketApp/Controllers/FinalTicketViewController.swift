//
//  FinalTicketViewController.swift
//  ticketApp
//
//  Created by Egor on 25.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class FinalTicketViewController: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var photoImg: UIImageView!
    
    var bgImage: UIImage?
    var phototWasChoosen: Bool = false

    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let bgImage = self.bgImage{
            self.backgroundImg.image = bgImage
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        showChooseSourceTypeAlertController()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if phototWasChoosen {
            takeAScreenShoot()
            AlertProviders.successAlert()
        }else{
            AlertProviders.needPhotoAlert()
        }
    }
    
    //скриншот экрана
    func takeAScreenShoot() {
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        view.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return}
        UIGraphicsEndImageContext()
        
        //сохранение в галерею
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

extension FinalTicketViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //выбор источника картинки
    func showChooseSourceTypeAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        AlertProviders.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //присвоение картинки из imagepicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImg.image = editedImage.withRenderingMode(.alwaysOriginal)
            phototWasChoosen = true
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.photoImg.image = originalImage.withRenderingMode(.alwaysOriginal)
            phototWasChoosen = true
        }
        dismiss(animated: true, completion: nil)
    }
}
