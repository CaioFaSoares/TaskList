//
//  TaskListView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct TaskListView: View {
    
    @State var tarefas: [Tarefa] = [
        Tarefa(nome: "Comprar pão"),
        Tarefa(nome: "Jogar Elden Ring"),
        Tarefa(nome: "Resolver exercício de matemática"),
        Tarefa(nome: "Estudar Swift"),
        Tarefa(nome: "Fazer exercício físico"),
        Tarefa(nome: "Ler um livro"),
        Tarefa(nome: "Enviar e-mails"),
        Tarefa(nome: "Limpar a casa"),
        Tarefa(nome: "Organizar documentos"),
        Tarefa(nome: "Preparar almoço")
    ]
    
    @State var adicionandoTarefa = false
    
    @State var nomeNovaTarefa = ""
    
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
                }
            }
            .navigationTitle("Tarefas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    adicionandoTarefa = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $adicionandoTarefa) {
                TextField("Nome da tarefa", text: $nomeNovaTarefa)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                Button {
                    if nomeNovaTarefa.isEmpty == false {
                        tarefas.append(Tarefa(nome: nomeNovaTarefa))
                        nomeNovaTarefa = ""
                        print(tarefas.count)
                        adicionandoTarefa = false
                    }
                } label: {
                    Text("Adicionar")
                }

            }
        }
    }
}

#Preview {
    TaskListView()
}
