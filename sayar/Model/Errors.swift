//
//  Errors.swift
//  sayar
//
//  Created by Nouf Saud on 27/06/2022.
//

import Foundation
enum Errors: Error, LocalizedError,Identifiable {
    
    case saveError
    case readError
    case emptyCost
    case avilablePhoneNumber
    case lessMorephoneNumber
    case moreThanOneCar
    case notNumber
    case notText
    case imageExtension
    var id : String{
        localizedDescription
    }
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("Could not save correctly, please retry again.", comment: "")
        case .readError:
            return NSLocalizedString("Could not load correctly, please retry again.", comment: "")
        case .emptyCost:
            return NSLocalizedString("The cost is missing, please add it.", comment: "")
        case .avilablePhoneNumber:
            return NSLocalizedString("This phone number is already exist, please use another number ot sign-in using this number.", comment: "")
        case .lessMorephoneNumber:
            return NSLocalizedString("This phone number is not correct, please make sure it is ten numbers.", comment: "")
        case .moreThanOneCar:
            return NSLocalizedString("You already have one vehicle, another vehicle can not be added", comment: "")
        case .notNumber:
            return NSLocalizedString("This field should contains numbers, please enter it again.", comment: "")
        case .notText:
            return NSLocalizedString("This field should contains text, please enter it again.", comment: "")
        case .imageExtension:
            return NSLocalizedString("This in not an image, please enter a valid image.", comment: "")
        default :
            return NSLocalizedString("there is an error", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    let error: Errors
}
