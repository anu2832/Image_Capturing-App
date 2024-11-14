//
//  NetworkManager.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation

class NetworkManager {
    func uploadImage(imageUri: String, progressHandler: @escaping (Double) -> Void, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://www.clippr.ai/api/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.uploadTask(with: request, fromFile: URL(fileURLWithPath: imageUri)) { data, response, error in
            if let error = error {
                print("Upload failed: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
        
        task.resume()
    }
}
