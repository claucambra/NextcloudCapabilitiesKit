//
//  BruteForce.swift
//
//
//  Created by Claudio Cambra on 6/4/24.
//

import Foundation

public struct BruteForce: Equatable {
    public let delay: Int
    public let allowListed: Bool

    init?(capabilities: [String: Any]) {
        guard let capabilities = capabilities["bruteforce"] as? [String : Any] else {
            debugPrint("No bruteforce data in received capabilities.")
            return nil
        }

        delay = capabilities["delay"] as? Int ?? 0
        allowListed = capabilities["allow-listed"] as? Bool ?? false
    }
}
