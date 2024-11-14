//
//  ImageListViewModel.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation
import RealmSwift

class ImageListViewModel {
    private let realm = try! Realm()
    
    func fetchImages() -> Results<ImageModel> {
        return realm.objects(ImageModel.self)
    }
    
    func updateUploadStatus(for image: ImageModel, status: String) {
        try? realm.write {
            image.uploadStatus = status
        }
    }
}
