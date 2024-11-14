//
//  ImageCaptureViewController.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import UIKit
import AVFoundation
import RealmSwift

class ImageCaptureViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    @IBOutlet weak var cameraPreviewView: UIView!
    
    private var captureSession: AVCaptureSession!
    private var photoOutput: AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCaptureSession()
    }
    
    func configureCaptureSession() {
        captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
        } catch {
            print("Error setting up camera input: \(error)")
            return
        }
        
        photoOutput = AVCapturePhotoOutput()
        captureSession.addOutput(photoOutput)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraPreviewView.bounds
        previewLayer.videoGravity = .resizeAspectFill
        cameraPreviewView.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    @IBAction func capturePhotoTapped(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        saveImage(data: imageData)
    }
    
    func saveImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        let imagePath = saveImageToDocuments(image: image)
        
        let newImage = ImageModel()
        newImage.imageUri = imagePath
        newImage.name = "Captured Image"
        newImage.uploadStatus = "Pending"
        
        try! Realm().write {
            try! Realm().add(newImage)
        }
    }
    
    func saveImageToDocuments(image: UIImage) -> String {
        let fileName = UUID().uuidString + ".jpg"
        let path = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        try! image.jpegData(compressionQuality: 0.8)?.write(to: path)
        return path.path
    }
}
