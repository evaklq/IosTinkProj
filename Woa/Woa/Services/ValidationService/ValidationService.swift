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

    func validateUser(nick: String?, email: String?, password: String?, age: Int?) -> [ValidationErrorType: [String]]? {
        let isValidData = isValidData(nick: nick, email: email, password: password, age: age)

        if isValidData {
            return nil
        } else {
            let errors: [ValidationErrorType: [String]] = [
                .nick: nickValidationErrors,
                .email: emailValidationErrors,
                .password: passValidationErrors,
                .age: ageValidationErrors
            ]

            return errors
        }
    }
}

private extension ValidationService {
    func isValidData(nick: String?, email: String?, password: String?, age: Int?) -> Bool {
        let isValidNick = isValidNick(with: nick)
        let isValidEmail = isValidEmail(with: email)
        let isValidPass = isValidPass(with: password)
        let isValidAge = isValidAge(with: age)

        if isValidNick && isValidEmail && isValidPass && isValidAge {
            return true
        } else { return false }
    }

    func isValidNick(with nick: String?) -> Bool {
        guard let nick = nick else {
            let emtyNickError = Strings.Title.nick + Strings.Error.emptyData
            nickValidationErrors.append(emtyNickError)
            return false
        }

        if nick.isEmpty {
            let emtyNickError = Strings.Title.nick + Strings.Error.emptyData
            nickValidationErrors.append(emtyNickError)
            return false
        }

        if nick.count < 3 || nick.count > 14 {
            let lenthNickError = Strings.Title.nick + Strings.Error.length + "3-14"
            nickValidationErrors.append(lenthNickError)
            return false
        }

        let specialCharacterSet = CharacterSet(charactersIn: Strings.Set.special)
        if nick.rangeOfCharacter(from: specialCharacterSet) != nil {
            let characNickError = Strings.Title.nick + Strings.Error.cantHasSpecial
            nickValidationErrors.append(characNickError)
            return false
        }

        nickValidationErrors = []
        return true
    }

    func isValidEmail(with email: String?) -> Bool {
        guard let email = email else {
            let emtyEmailError = Strings.Title.email + Strings.Error.emptyData
            emailValidationErrors.append(emtyEmailError)
            return false
        }

        if email.isEmpty {
            let emtyEmailError = Strings.Title.email + Strings.Error.emptyData
            emailValidationErrors.append(emtyEmailError)
            return false
        }

        let emailRegEx = Strings.Set.email
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        if !emailPred.evaluate(with: email) {
            let emailError = Strings.Error.incorrect + Strings.Title.email
            emailValidationErrors.append(emailError)
            return false
        }

        emailValidationErrors = []
        return true
    }

    func isValidPass(with pass: String?) -> Bool {
        guard let pass = pass else {
            let emtyPassError = Strings.Title.pass + Strings.Error.emptyData
            passValidationErrors.append(emtyPassError)
            return false
        }

        if pass.isEmpty {
            let emtyPassError = Strings.Title.pass + Strings.Error.emptyData
            passValidationErrors.append(emtyPassError)
            return false
        }

        if pass.count < 5 {
            let lenthPassError = Strings.Title.pass + Strings.Error.length + ">=5"
            passValidationErrors.append(lenthPassError)
            return false
        }

        let specialCharacterSet = CharacterSet(charactersIn: Strings.Set.special)
        if pass.rangeOfCharacter(from: specialCharacterSet) == nil {
            let characPassError = Strings.Title.pass + Strings.Error.needSpecial
            passValidationErrors.append(characPassError)
            return false
        }

        let capitalSet = CharacterSet(charactersIn: Strings.Set.capital)
        if pass.rangeOfCharacter(from: capitalSet) == nil {
            let capitalPassError = Strings.Title.pass + Strings.Error.needCapital
            passValidationErrors.append(capitalPassError)
            return false
        }

        let numbersSet = CharacterSet(charactersIn: Strings.Set.numbers)
        if pass.rangeOfCharacter(from: numbersSet) == nil {
            let numbersPassError = Strings.Title.pass + Strings.Error.needNumbers
            passValidationErrors.append(numbersPassError)
            return false
        }

        passValidationErrors = []
        return true
    }

    func isValidAge(with age: Int?) -> Bool {
        guard let age = age else {
            let emtyAgeError = Strings.Title.age + Strings.Error.emptyData
            ageValidationErrors.append(emtyAgeError)
            return false
        }

        if age < 0 {
            let emtyAgeError = Strings.Title.age + Strings.Error.needNumbers
            ageValidationErrors.append(emtyAgeError)
            return false
        }

        if age == 0 || age > 200 {
            let incorrectAgeError = Strings.Error.incorrect + Strings.Title.age
            ageValidationErrors.append(incorrectAgeError)
            return false
        }

        passValidationErrors = []
        return true
    }
}
