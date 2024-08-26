//
//  TaskListView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct Tarefa: Identifiable {
    let id = UUID()
    var nome = ""
    var date = Date.now
    var pronta = false
}

struct TaskListView: View {
    
    @State var tarefas: [Tarefa] = [
        Tarefa(nome: "Comprar pão", date: Date.now),
        Tarefa(nome: "Jogar Elden Ring", date: Date.now),
        Tarefa(nome: "Resolver exercício de matemática", date: Date.now),
        Tarefa(nome: "Estudar Swift", date: Date.now),
        Tarefa(nome: "Fazer exercício físico", date: Date.now),
        Tarefa(nome: "Ler um livro", date: Date.now),
        Tarefa(nome: "Enviar e-mails", date: Date.now),
        Tarefa(nome: "Limpar a casa", date: Date.now),
        Tarefa(nome: "Organizar documentos", date: Date.now),
        Tarefa(nome: "Preparar almoço", date: Date.now)
    ]
    
    var body: some View {
        List(tarefas) { tarefa in
            Text(tarefa.nome)
        }
    }
}

#Preview {
    TaskListView()
}
