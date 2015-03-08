//
//  löscheLetzteEingabe.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 03.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation


func löscheLetzteEingabe (var vonWelchemString stringZumBearbeiten: String) ->String {
    var stringZumBearbeitenArray = [String]()
    for c in stringZumBearbeiten{
        stringZumBearbeitenArray.append("\(c)")
    }
    
    if stringZumBearbeitenArray.count == 0 {
        stringZumBearbeiten = "0"
        
    } else if stringZumBearbeitenArray[0] != "0" {
        stringZumBearbeitenArray.removeLast()
        
        if stringZumBearbeitenArray.count == 0 {
            stringZumBearbeiten = "0"
        } else {
            stringZumBearbeiten = ""
            for nummer in 0..<(stringZumBearbeitenArray.count) {
                stringZumBearbeiten += stringZumBearbeitenArray[nummer]
            }
        }
    }
    return stringZumBearbeiten
}