//
//  Extension : func.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 24.02.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation


extension String {
    mutating func gibStringZurück (range: Range<Int>) ->String {
        var string = ""
        var temp: [Int] = []
        var key = 0
        for nummer in range {
            temp.append(nummer)
        }
        return self.stringByPaddingToLength(temp.count, withString: "", startingAtIndex: temp[0])
    }
    mutating func insertString(string: String, atIndex: Int) {
        var key = 0
        var stringNeu: [String] = []
        var string1 = ""
        var endstring = ""
        
        
        for c in self {
            if key == atIndex {
                stringNeu.append(string1)
                stringNeu.append(string)
                stringNeu.append(String(c))
                string1 = ""
                ++key
                //                var string1 = string.
            }else{
                string1 += String(c)
                ++key
            }
        }
        stringNeu.append(string1)
        if count(self) == atIndex {
            stringNeu.append(string)
        }
        for (key, value) in enumerate(stringNeu) {
            endstring = endstring + stringNeu[key]
        }
        self = endstring
    }
    func lenght () -> Int {
        return count(self)
    }
    
    func isInString(thisChar char: Character) ->Bool {
        for c in self {
            if c == char {
                return true
            }
        }
        return false
    }
    
    mutating func removeRange(#range: Int) ->String {
        var temp = self
        var rangeIndex = advance(self.startIndex, 0)
        for nummer in 0..<range {
            temp.removeAtIndex(rangeIndex)
        }
        return temp
    }
    
    public func convertRange(range: Range<Int>) -> Range<String.Index> {
        let startIndex = advance(self.startIndex, range.startIndex)
        let endIndex = advance(startIndex, range.endIndex - range.startIndex)
        return Range<String.Index>(start: startIndex, end: endIndex)
    }

}
func componentsSeparatetByStrings(var inString stringToParse: String, separators separatoren: [Character])
    ->(numbers: [String], parameter: [String]) {
        var StringAsArray: [String] = []
        var parameter: [String] = []
        var key = 0
        
        for (var keyy, value) in enumerate(stringToParse) {
            switch value {
            case separatoren[0]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                stringToParse = stringToParse.removeRange(range: key + 1)
                parameter.append("+")
                key = 0
            case separatoren[1]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                stringToParse = stringToParse.removeRange(range: key + 1)
                parameter.append("-")
                key = 0
            default:
                key += 1
            }
        }
        StringAsArray.append(stringToParse)
        stringToParse = ""
        return (StringAsArray, parameter)
}
func componentsSeparatetByStringsWitchCalc(var inString stringToParse: String, separators separatoren: [Character])
    ->String {
        var StringAsArray: [String] = []
        var parameter: [String] = []
        var index: [String] = []
        var indexCounter = 0
        var key = 0
        
        for value in stringToParse {
            switch value {
            case separatoren[0]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                parameter.append("x")
                stringToParse.removeRange(stringToParse.convertRange(0...key))
            case separatoren[1]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                parameter.append(":")
                stringToParse.removeRange(stringToParse.convertRange(0...key))
            default:
                key += 1
            }
        }
        StringAsArray.append(stringToParse)
        stringToParse = ""
        var ergebnis = 0
        for number in 1..<StringAsArray.count {
            if parameter[0] == "x" {
                ergebnis = StringAsArray[0].toInt()! * StringAsArray[1].toInt()!
                StringAsArray.removeAtIndex(0)
                StringAsArray[0] = "\(ergebnis)"
                parameter.removeAtIndex(0)
            }else {
                ergebnis = StringAsArray[0].toInt()! / StringAsArray[1].toInt()!
                StringAsArray.removeAtIndex(0)
                StringAsArray[0] = "\(ergebnis)"
                parameter.removeAtIndex(0)
            }
        }
        return StringAsArray[0]
}