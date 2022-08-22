//
//  People.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/23/22.
//

import UIKit
struct People: Hashable {
    let title: String
    let thumbnail: UIImage?
    
    let identifier = UUID().uuidString
    
    
    init(title: String, thumbnail: UIImage? = nil) {
        self.title = title
        self.thumbnail = thumbnail
    }
    
    func hash(int hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: People, rhs: People) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
