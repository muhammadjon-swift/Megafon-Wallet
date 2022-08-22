//
//  PaymentsCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/21/22.
//

import UIKit
import CoreData

class ItemsCollectionViewCellViewModel {
    let description: String
    let imageURL : String
    
    init (description: String, imageURL: String) {
        self.description = description
        self.imageURL = imageURL
    }
}

class TransferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
        
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func configure(with viewModel: ItemsCollectionViewCellViewModel) {
        var loadededItems = loadItems()
        var localItems = LocalItems(context: self.context)

        itemDescriptionLabel.text = viewModel.description
        
        //MARK: - Store Items in Core Data
        
        // Prosses Image
        if let url = URL(string: (viewModel.imageURL)) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.itemImage.image = UIImage(data: data)
//                    self.itemImage.image = UIImage(data: loadededItems![6].image!)
                    let theImage = UIImage(data: data)
                    
                    let jpegImageData = theImage?.jpegData(compressionQuality: 1.0)
                    localItems.image = jpegImageData
                    self.saveItems()
                }
            }
            task.resume()
        }
    }
    
    func failCase(with loadedData: LocalItems) {
        self.itemImage.image = UIImage(data: loadedData.image!)
    }
    
    func saveItems() {
        do {
            try context.save()
            print("WAS SUCCESFULL INIT/saving/changing")
        } catch {
            print("Error saving data/changing \(error)")
            print("ERRRRORRRRRRROROROROROROORORORROORR")
        }
    }
    
    func loadItems() -> [LocalItems]? {
        let req = (LocalItems.fetchRequest())
        do {
            let loadedItems = try context.fetch(req)
            return loadedItems
        } catch {
            print("There was an error \(error)")
            return nil
        }
    }


}
