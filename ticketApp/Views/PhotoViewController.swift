//
//  PhotoViewController.swift
//  ticketApp
//
//  Created by Egor on 25.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    
    var captureDevice: AVCaptureDevice!

    @IBAction func goBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCamera()
    
    }
    
    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
            captureDevice = availableDevices.first
            beginSession()
    }
    func beginSession() {
        do{
            let capturDeviceInput = try! AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(capturDeviceInput)
        }catch{
            print(error.localizedDescription)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
