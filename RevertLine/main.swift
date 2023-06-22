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


let str = "Через командную строку: создайте локальный проект с git-репозиторием."
print(str.reverеtStringWithPreservingdUppercasedPosition())


