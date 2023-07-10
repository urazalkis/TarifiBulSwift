//
//  LanguageManager.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 21.06.2023.
//

import Foundation

enum AppLanguage: String {
    case english = "en"
    case turkish = "tr"
}
class LanguageManager {
    static let shared = LanguageManager()
    private init() {}
    
    func setLanguage(lang: AppLanguage) {

        UserDefaults.standard.set(lang.rawValue, forKey: "AppleLanguage")
            //UserDefaults.standard.synchronize()
        }

        func currentLanguage() -> String {

            return UserDefaults.standard.string(forKey: "AppleLanguage") ?? ""
        }
    }
    

extension String {
    var locale:String {
        let lang = LanguageManager.shared.currentLanguage()
                let path = Bundle.main.path(forResource: lang, ofType: "lproj")
                let bundle = Bundle(path: path!)
        //return NSLocalizedString(self, comment: "")
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
