//
//  ImageListViewController.swift
//  ImageCapturingApp
//
//  Created by Anshul chaudhary on 13/11/24.
//

import Foundation
import UIKit
import RealmSwift

class ImageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = ImageListViewModel()
    private var images: Results<ImageModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = viewModel.fetchImages()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        let image = images[indexPath.row]
        cell.textLabel?.text = image.name
        cell.detailTextLabel?.text = image.uploadStatus
        return cell
    }
}
