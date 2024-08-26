//
//  Tarefa.swift
//  TaskList
//
//  Created by Caio Soares on 26/08/24.
//

import Foundation

struct Tarefa: Identifiable, Hashable {
    let id = UUID()
    var nome = ""
    var date = Date.now
    var pronta = false
    
    mutating func concluir() {
        self.pronta = true
    }
}
