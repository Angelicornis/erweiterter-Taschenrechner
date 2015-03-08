//
//  Klammern.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 04.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func berechnungKlammer (var inString stringToParse: String, separators separatoren: [Character])
    ->String {
        //FIXME: Klammern nach einer Klammer führt zu einem Fehler
        println("Startstring: \(stringToParse)")
        println("### Klammer start")
        var ursprungsString = stringToParse
        var StringAsArray: [String] = []
        var place: [Int] = []
        var key = 0
        var closure = 0
        var startstring = stringToParse
        var anzahlDerKlammerAuf = 0
        var positionKlammerAuf = 0
        var startWertDerKlammern = 0
        /*
        Auflösung der Klammer
        Von Klammer auf bis Ende des Strings
        Speichern von jeder Klammer auf bis Ende in einem Array
        */
        for (var keyy, value) in enumerate(stringToParse) {
            if value == "(" && anzahlDerKlammerAuf == positionKlammerAuf {
                stringToParse.removeRange(stringToParse.convertRange(0...key))
                StringAsArray.append(stringToParse)
                place.append(key)
                key = 0
                //                println("Case Sep 0 \n String: \(StringAsArray) \n key: \(place) \n ortDerKlammer: \(ortDerKlammer)")
                
            }else {
                key += 1
            }
        }
        startWertDerKlammern = place[0]
        //        println("\nNach dem 1. Switchen \n String: \(StringAsArray)\n")
        /* -->
        Nach dem 1. Switchen
        String: [4x(6+4)x2), 6+4)x2)]
        key: [4, 2]
        */
        //        println("\n")
        var positionDerKlammerZu = 0
        var anzahlDerKlammerZu = 0
        var positionDerKlammer = 0
        var StringAsArrayReverse = StringAsArray.reverse()
        for (key, stringArray) in enumerate(StringAsArrayReverse) {
            for (key2, value) in enumerate(stringArray) {
                if value == ")" && anzahlDerKlammerZu == positionDerKlammerZu {
                    //                    println(StringAsArrayReverse)
                    key
                    StringAsArrayReverse[positionDerKlammer] = stringArray.stringByPaddingToLength(key2, withString: "", startingAtIndex: 0)
                    //                    println(StringAsArrayReverse)
                    //                    println(positionDerKlammer)
                    anzahlDerKlammerZu += 1
                    break
                } else if value == ")" {
                    positionDerKlammer += 1
                }
            }
        }
        StringAsArray = StringAsArrayReverse
        println("String nach dem Parsen: \n \(StringAsArray) \n")
        /*
        [4x2, 6x(4x2), 4x(6x(4x2)]
        ortDerKlammer:
        [4, 7, 10]
        */
        
        var zähler = 0
        var tempZwischenergebnis = ""
        var länge = 0
        for (key, value) in enumerate(StringAsArrayReverse) {
            if zähler == 0 {
                tempZwischenergebnis = "\(berechne(stringZumBerechnen: value))"
                länge = value.lenght()
                zähler += 1
            } else {
                println("Start: \(StringAsArray[zähler])")
                var ortDerKlammer = 0
                for c in value {
                    ++ortDerKlammer
                    if c == "(" {
                        break
                    }
                }
                --ortDerKlammer
                var endIndex = StringAsArray[zähler].lenght() - 1
                //FIXME: Alles Nach der Klammer wird abgeschnitten
                
                println(StringAsArray[zähler])
                StringAsArray[zähler].removeRange(StringAsArray[zähler].convertRange(ortDerKlammer...endIndex))
                println(StringAsArray[zähler])
                
                StringAsArray[zähler] = StringAsArray[zähler] + tempZwischenergebnis
                tempZwischenergebnis = String(berechne(stringZumBerechnen: StringAsArray[zähler]))
                println(StringAsArray[zähler])
                println(StringAsArray)
                zähler += 1
            }
        }
        
        
        
        
        
        /* Das berechnete Ergebnis in den Ursprungsstring einfügen*/
        ursprungsString.removeRange(ursprungsString.convertRange(startWertDerKlammern..<ursprungsString.lenght()))
        ursprungsString = ursprungsString + tempZwischenergebnis
        
        return ursprungsString
}

