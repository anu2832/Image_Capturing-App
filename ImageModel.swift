//
//  ImageModel.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation
import RealmSwift

class ImageModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var imageUri: String = ""
    @Persisted var name: String = ""
    @Persisted var captureDate: Date = Date()
    @Persisted var uploadStatus: String = "Pending"
}
