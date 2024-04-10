//
//  ValidationService.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

final class ValidationService: ValidationServiceProtocol {
    static let shared = ValidationService()

    private var nickValidationErrors: [String]
    private var emailValidationErrors: [String]
    private var passValidationErrors: [String]
    private var ageValidationErrors: [String]

    private init() {
        self.nickValidationErrors = []
        self.emailValidationErrors = []
        self.passValidationErrors = []
        self.ageValidationErrors = []
    }

    func validateUser(nick: String, email: String, password: String, age: Int) -> [ValidationErrorType : [String]]? {
        let isValidNick = isValidNick(with: nick)
        let isValidEmail = isValidEmail(with: email)
        let isValidPass = isValidPass(with: password)
        let isValidAge = isValidAge(with: age)

        if isValidNick && isValidEmail && isValidPass && isValidAge {
            return nil
        } else {
            let errors: [ValidationErrorType : [String]] = [
                .nick : nickValidationErrors,
                .email: emailValidationErrors,
                .password: passValidationErrors,
                .age: ageValidationErrors
            ]

            return errors
        }
    }
}

extension ValidationService {
    private func isValidNick(with nick: String) -> Bool {
        if nick.isEmpty {
            let emtyNickError = Strings.nick + Strings.emptyData
            nickValidationErrors.append(emtyNickError)
            return false
        }

        if nick.count < 3 || nick.count > 14 {
            let lenthNickError = Strings.nick + Strings.lenth + "3-14"
            nickValidationErrors.append(lenthNickError)
            return false
        }

        let specialCharacterSet = CharacterSet(charactersIn: Strings.specialSet)
        if nick.rangeOfCharacter(from: specialCharacterSet) != nil {
            let characNickError = Strings.nick + Strings.notSpecial
            nickValidationErrors.append(characNickError)
            return false
        }

        nickValidationErrors = []
        return true
    }

    private func isValidEmail(with email: String) -> Bool {
        if email.isEmpty {
            let emtyEmailError = Strings.email + Strings.emptyData
            emailValidationErrors.append(emtyEmailError)
            return false
        }

        let emailRegEx = Strings.emailReg
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        if !emailPred.evaluate(with: email) {
            let emailError = Strings.incorrect + Strings.email
            emailValidationErrors.append(emailError)
            return false
        }

        emailValidationErrors = []
        return true
    }

    private func isValidPass(with pass: String) -> Bool {
        if pass.isEmpty {
            let emtyPassError = Strings.pass + Strings.emptyData
            passValidationErrors.append(emtyPassError)
            return false
        }

        if pass.count < 5 {
            let lenthPassError = Strings.pass + Strings.lenth + ">=5"
            passValidationErrors.append(lenthPassError)
            return false
        }

        let specialCharacterSet = CharacterSet(charactersIn: Strings.specialSet)
        if pass.rangeOfCharacter(from: specialCharacterSet) == nil {
            let characPassError = Strings.pass + Strings.special
            passValidationErrors.append(characPassError)
            return false
        }

        let capitalSet = CharacterSet(charactersIn: Strings.capitalSet)
        if pass.rangeOfCharacter(from: capitalSet) == nil {
            let capitalPassError = Strings.pass + Strings.capital
            passValidationErrors.append(capitalPassError)
            return false
        }

        let numbersSet = CharacterSet(charactersIn: Strings.numbersSet)
        if pass.rangeOfCharacter(from: numbersSet) == nil {
            let numbersPassError = Strings.pass + Strings.numbers
            passValidationErrors.append(numbersPassError)
            return false
        }

        passValidationErrors = []
        return true
    }

    private func isValidAge(with age: Int) -> Bool {
        if age <= 0 || age > 200 {
            let emtyAgeError = Strings.age + Strings.emptyData
            ageValidationErrors.append(emtyAgeError)
            return false
        }

        passValidationErrors = []
        return true
    }
}
