//
//  main.swift
//  RevertLine
//
//  Created by Ivan Konishchev on 04.09.2022.
//

import Foundation

final class ReversString {
    
    let sourceString: String
    private var revertArray: [String] = []
    private var indexUpperCase: [Int] = []
    private var indexPunctuation: [Int: Character] = [:]
  //MARK: - init
    init(sourceString: String) {
        self.sourceString = sourceString
    }
    

     func reversString() -> String {
         buildString()
    }
    
    
    private func buildString() -> String {
        self.setReversArray()
        //Возвращаем знаки препинания на свои места
        for (index, value) in indexPunctuation {
            if (revertArray.count - index) < 0 {
                revertArray.append(String(value))
            } else {
                revertArray.insert(String(value), at: index)

            }
        }
        // выставляем заглавные буквы как они были изначально!
         for i in indexUpperCase {
             revertArray[i] = revertArray[i].uppercased()
         }
        // Собираем строку из массива
        var string = ""
        for character in revertArray {
           string = string + character
        }
        return string
    }
//MARK: - set revertArray property
    private func setReversArray() {
        for (key,character) in self.sourceString.enumerated() {
            if character.isUppercase {
                indexUpperCase.append(key)
            }
            if character.isPunctuation {
                indexPunctuation[key] = character
            } else {
                revertArray.insert(String(character).lowercased(), at: 0)

            }
        }
    }
    
}


let service = ReversString(sourceString: "Привет как дела?")
print(service.sourceString)
print(service.reversString())
