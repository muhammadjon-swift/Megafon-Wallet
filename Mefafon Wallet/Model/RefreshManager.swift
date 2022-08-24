//
//  RefreshManager.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/24/22.
//

import UIKit

class RefreshManager: NSObject {

    static let shared = RefreshManager()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "lastRefresh"
    private let calender = Calendar.current

    func loadDataIfNeeded(completion: (Bool) -> Void) {

        if isRefreshRequired() {
            print("Data deleted")
            DataPersistenceManager.shared.deleteEveryThingInAtributes()
            defaults.set(Date(), forKey: defaultsKey)
            completion(true)
        } else {
            completion(false)
        }
    }

    private func isRefreshRequired() -> Bool {

        guard let lastRefreshDate = defaults.object(forKey: defaultsKey) as? Date else {
              return true
          }
        
        print("TING \(lastRefreshDate)")

        if let diff = calender.dateComponents([.hour], from: lastRefreshDate, to: Date()).hour, diff > 24 {
            return true
        } else {
            return false
        }
    }
}
