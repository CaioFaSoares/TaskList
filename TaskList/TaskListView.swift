//
//  TaskListView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

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
    
    @State var apresentarSheet: Bool = false
    
    @State var novaTarefa: Tarefa = Tarefa()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tarefas, id: \.self) { tarefa in
                    NavigationLink {
                        TaskDetailView()
                    } label: {
                        Text(tarefa.nome)
                    }
                }.onDelete { index in
                    tarefas.remove(atOffsets: index)
                    print(tarefas)
                }
            }
            .navigationTitle("Tarefas")
            .toolbar {
                Button("Add") {
                    novaTarefa = Tarefa()
                    apresentarSheet = true
                }
            }
            .sheet(isPresented: $apresentarSheet) {
                if novaTarefa.nome.isEmpty == false {
                    tarefas.append(novaTarefa)
                }
            } content: {
                TaskAddView(novaTarefa: $novaTarefa, estaCriando: $apresentarSheet)
            }
        }
    }
}

#Preview {
    TaskListView()
}
