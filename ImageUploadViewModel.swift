//
//  ImageUploadViewModel.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation

class ImageUploadViewModel {
    private let networkManager = NetworkManager()
    private let realmManager = RealmManager()
    
    func uploadImage(_ image: ImageModel, progressHandler: @escaping (Double) -> Void, completion: @escaping (Bool) -> Void) {
        networkManager.uploadImage(imageUri: image.imageUri) { progress in
            progressHandler(progress)
        } completion: { success in
            if success {
                self.realmManager.updateUploadStatus(for: image, status: "Completed")
            }
            completion(success)
        }
    }
}
