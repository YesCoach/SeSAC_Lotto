//
//  LoginViewModel.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import Foundation

final class LoginViewModel {
    
    // MARK: - Output
    
    let name: CustomObservable<String> = .init("")
    let email: CustomObservable<String> = .init("")
    let password: CustomObservable<String> = .init("")
    let isValid: CustomObservable<Bool> = .init(false)
    
    // MARK: - Input
    
    func checkValidation() {
        guard (
            email.value.count >= 6 &&
            password.value.count >= 4 &&
            name.value.count >= 1
        ) else {
            isValid.value = false
            return
        }
        
        isValid.value = true
    }

    func testCode() {
        name.value = "예스코치"
        email.value = "abc@def"
        password.value = "123456789"

        checkValidation()
    }
}
