//
//  PasswordPolicy.swift
//
//
//  Created by Claudio Cambra on 7/4/24.
//

import Foundation

public struct PasswordPolicy: Equatable {
    let minLength: Int
    let enforceNonCommonPassword: Bool
    let enforceNumericCharacters: Bool
    let enforceSpecialCharacters: Bool
    let enforceUpperLowerCase: Bool
    let apiGenerateUrl: URL?
    let apiValidateUrl: URL?

    init?(capabilities: [String: Any]) {
        guard let capabilities = capabilities["password_policy"] as? [String : Any] else {
            debugPrint("No password policy data in received capabilities.")
            return nil
        }

        minLength = capabilities["minLength"] as? Int ?? 0
        enforceNonCommonPassword = capabilities["enforceNonCommonPassword"] as? Bool ?? false
        enforceNumericCharacters = capabilities["enforceNumericCharacters"] as? Bool ?? false
        enforceSpecialCharacters = capabilities["enforceSpecialCharacters"] as? Bool ?? false
        enforceUpperLowerCase = capabilities["enforceUpperLowerCase"] as? Bool ?? false

        if let apiCaps = capabilities["api"] as? [String: Any] {
            apiGenerateUrl = URL(string: apiCaps["generate"] as? String ?? "")
            apiValidateUrl = URL(string: apiCaps["validate"] as? String ?? "")
        } else {
            apiGenerateUrl = nil
            apiValidateUrl = nil
        }
    }
}
