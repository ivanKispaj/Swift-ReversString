//
//  main.swift
//  RevertLine
//
//  Created by Ivan Konishchev on 04.09.2022.
//

import Foundation


extension String
{
    func reverеtStringWithPreservingdUppercasedPosition() -> String
    {
        let arr = self.components(separatedBy: " ")
        var newArr: [String] = []
        for word in arr
        {
            let revWord = revertWord(word: word)
            newArr.insert(revWord, at: 0)
        }
        return newArr.joined(separator: " ")
    }
    
    private func revertWord(word: String) -> String
    {
        var stringArr = Array(word)
        var offsetStart = 0
        var offsetEnd = word.count - 1
        
        while (offsetStart < offsetEnd)
        {
            let firstChar = stringArr[offsetStart]
            let lastChar = stringArr[offsetEnd]
            
            if firstChar.isUppercase && lastChar.isLowercase
            {
                stringArr[offsetEnd] = String.Element(firstChar.lowercased())
                stringArr[offsetStart] = String.Element(lastChar.uppercased())
            } else if lastChar.isUppercase && firstChar.isLowercase
            {
                stringArr[offsetEnd] = String.Element(firstChar.uppercased())
                stringArr[offsetStart] = String.Element(lastChar.lowercased())
                
            } else
            {
                stringArr[offsetEnd] = firstChar
                stringArr[offsetStart] = lastChar
            }
            offsetEnd -= 1
            offsetStart += 1
            
        }
        return String(stringArr)
    }
}


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


let str = "Через командную строку: создайте локальный проект с git-репозиторием."
print(str.reverеtStringWithPreservingPunctuationAndUppercasedPosition())


