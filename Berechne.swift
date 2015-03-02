//
//  Berechne.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 02.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func berechnung(StringZumBerechnen anzeigeWährendBerechnung: String) -> Int {
    var arrayOfWords = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "+")
    println("Ergebniss1: \n \(arrayOfWords)\n")
    
    
    
    
    
    
    var arrayOfWords2 = [String]()
    var parameter: [Int] = []
    for (var index1, wort1) in enumerate(arrayOfWords) {
        var temp = false
        for  c in wort1 {
            if c == "-" {
                temp = true
            }
        }
        
        if temp {
            var index2 = index1
            arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "-"))
            arrayOfWords.removeAtIndex(index1)
            for (key, value) in enumerate(arrayOfWords2) {
                arrayOfWords.insert(value, atIndex: index2)
                index2 += 1
                if key != 0 {
                    parameter.append(key)
                }
            }
            parameter.addierValue(mitStartwert: 1)
        }
    }
    println("Die Parameter Lauten:\(parameter)")
    
    
    
    
    
    
    
    
    
    
    
    
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
        //        println(key)
        
        
        for (key2, value2) in enumerate(parameter) {
            if key == value2 {
                ergebnis = ergebnis - value.toInt()!
                parameter.removeAtIndex(key2)
                //                println(" 1 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
                
                status = false
            }
        }
        if status {
            ergebnis = ergebnis + value.toInt()!
            //            println(" 2 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
            
        }
        
    }
    //anzeigeEinheit.text = String(ergebnis)
    println("Das Ergebnis Lautet: \n \(ergebnis)\n")
    return ergebnis
}