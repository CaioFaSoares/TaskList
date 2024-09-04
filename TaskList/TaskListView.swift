//
//  TaskListView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct TaskListView: View {
    
    @State var tarefas: [Tarefa] = []
    
    @State var adicionandoTarefa = false
    @State var nomeNovaTarefa = ""
    
    let json = JSONService()
    
    var body: some View {
        NavigationStack {
            
            //MARK: - Listagem principal
            
            List {
                Section {
                    ForEach($tarefas, id: \.self) { $tarefa in
                        NavigationLink {
                            TaskDetailView(tarefa: $tarefa,
                                           deleteTask: .constant {
                                print("Função foi injetada!")
                            })
                        } label: {
                            Text(tarefa.nome)
                        }
                    }.onDelete { index in
                        tarefas.remove(atOffsets: index)
                        saveJson()
                    }
                }
            }
            
            //MARK: - Botões de Debug
            
            HStack {
                
                Button {
                    initTests()
                } label: {
                    Text("Testar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                
                Button {
                    loadJson()
                } label: {
                    Text("Carregar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                Button {
                    saveJson()
                } label: {
                    Text("Salvar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                
                Button {
                    tarefas = []
                    saveJson()
                } label: {
                    Text("Delete")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

            }
            
            //MARK: - Toolbar
            
            .navigationTitle("Tarefas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    adicionandoTarefa = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            //MARK: - Sheet de adicionar tarefa
            
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
    
    
    //MARK: - Comportamentos
    
    func initTests() {
        tarefas = [
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
    }
    
    func loadJson() {
        do {
            try tarefas = json.load() ?? []
        } catch {}
    }
    
    func saveJson() {
        do {
            try json.save(tarefas)
        } catch {}
    }
    
    func deleteJson() {
        do {
            try json.delete()
        } catch {}
    }
    
}

#Preview {
    TaskListView()
}
