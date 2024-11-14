//
//  RealmManager.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation
import RealmSwift

class RealmManager {
    private let realm = try! Realm()
    
    func updateUploadStatus(for image: ImageModel, status: String) {
        try? realm.write {
            image.uploadStatus = status
        }
    }
}
