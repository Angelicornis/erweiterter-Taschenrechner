// Playground - noun: a place where people can play

import Cocoa
import Foundation

extension Array {
    mutating func addierValue(mitStartwert value: T){
        var temp = 0
        for (key, value) in enumerate(self) {
            temp = (value as Int) + 1
            self.removeAtIndex(key)
            self.insert(temp as T, atIndex: key)
        }
    }
    func valueOf(Index: Int) -> T? {
        for (key, value) in enumerate(self) {
            if key == Index {
                return value
            }
        }
        return nil
    }
    mutating func replace (withArray: [T], var atIndex: Int) {
        self.removeAtIndex(atIndex)
        for (key, value) in enumerate(withArray) {
            self.insert(value, atIndex: atIndex)
            atIndex += 1
        }
    }
}

var anzeigeWährendBerechnung = "120+30-50-20"

func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
    var stringZuParsenGeparst = stringZuParsen.componentsSeparatedByString(separator)
    if berechne {
        var temp = 0
        var ergebnis: Int?
        var wert = stringZuParsenGeparst.valueOf(0)
        for wertInt in stringZuParsenGeparst {
            switch separator {
            case "x":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! *= wertInt.toInt()!
                }
            case ":":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! /= wertInt.toInt()!
                }
            default: ergebnis! = 0
            }
        }
        return ["\(ergebnis!)"]
    } else {
        return stringZuParsenGeparst
    }
}

func berechnung(StringZumBerechnen anzeigeWährendBerechnung: String) -> Int {
    var arrayOfWords = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "+")
    println("Ergebniss1: \n \(arrayOfWords)\n")


    var arrayOfWords2 = [String]()
    var parameter: [Int] = []
    for (var index1, wort1) in enumerate(arrayOfWords) {
    //    for c in wort1 {
            var temp = false
            for  c in wort1 {
                if c == "-" {
                    temp = true
                }
            }
        
            if temp {
                var index2 = index1
                println("Index1: \(index1)")
                //            println ("String vor dem zweiten Parsen - \n \(wort1)\n")
                arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "-"))
                arrayOfWords.removeAtIndex(index1)
                for i in arrayOfWords2 {
                    arrayOfWords.insert(i, atIndex: index2)
                    index2 += 1
                }
                parameter.append(index1)
                parameter.addierValue(mitStartwert: 1)
    //        }
        }
    }
    parameter = [2, 3]
    //println ("String nach minus - \n \((arrayOfWords))\n")
    for (index1, wort1) in enumerate(arrayOfWords) {
        for c in wort1 {
            if c == "x" {
                //            println ("String vor dem zweiten Parsen * \n \(wort1)\n")
                arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "x", berechne: true))
                for i in arrayOfWords2 {
                    arrayOfWords.removeAtIndex(index1)
                    arrayOfWords.insert(i, atIndex: index1)
                }
            } else if c == ":" {
                //            println ("String vor dem zweiten Parsen : \n \(wort1)\n")
                arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: ":", berechne: true))
                for i in arrayOfWords2 {
                    arrayOfWords.removeAtIndex(index1)
                    arrayOfWords.insert(i, atIndex: index1)
                }
            }
        }
    }
    println("Ergebniss2: \n \(arrayOfWords)\n")

    //println("Das letzte Vorergebnis Lautet: \n \(arrayOfWords)\n")
    var ergebnis = 0
    println("Parameter: \(parameter)")

    for (key, value) in enumerate(arrayOfWords) {
        var status = true
        var value2: Int = 0
        println(key)
        
        
        for (key2, value2) in enumerate(parameter) {
            if key == value2 {
                ergebnis = ergebnis - value.toInt()!
                parameter.removeAtIndex(key2)
                println(" 1 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
                
                status = false
            }
        }
        if status {
            ergebnis = ergebnis + value.toInt()!
            println(" 2 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
            
        }
        println(" \(parameter)")
        println("\n")
    }
    //anzeigeEinheit.text = String(ergebnis)
    println("Das Ergebnis Lautet: \n \(ergebnis)\n")
    return ergebnis
}
berechnung(StringZumBerechnen: anzeigeWährendBerechnung)
