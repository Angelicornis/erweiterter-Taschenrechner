//
//  kleinereFunktionen.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 03.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func theStringStartWithZero(welcherString string: String) -> Bool{
var lenge = countElements(string)
    if lenge == 1 {
        for c in string {
            if c == "0" {
                return true
            }
        }
    }
    return false
}


