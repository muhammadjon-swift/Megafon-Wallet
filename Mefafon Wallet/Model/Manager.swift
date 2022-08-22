//
//  Manager.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/23/22.
//

import Foundation

struct Manager {
    enum Section: String, CaseIterable {
        case PREVIEW = "people"
    }
    static var people = [
          Section.PREVIEW:  [
            People(title: "Boby", thumbnail: #imageLiteral(resourceName: "profile-1")),
            People(title: "Rick", thumbnail: #imageLiteral(resourceName: "profile-5")),
            People(title: "Morty", thumbnail: #imageLiteral(resourceName: "profile-2")),
            People(title: "Jerry", thumbnail: #imageLiteral(resourceName: "profile-5")),
            People(title: "Elon", thumbnail: #imageLiteral(resourceName: "profile-8")),
            People(title: "OJeez", thumbnail: #imageLiteral(resourceName: "profile-2")),
            People(title: "Summer", thumbnail: #imageLiteral(resourceName: "profile-3")),
            People(title: "Beth", thumbnail: #imageLiteral(resourceName: "profile-4"))
        ],
    ]
}
