//
//  TaskDetailView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    var tarefa = Tarefa(nome: "Tarefa Teste")
    
    var body: some View {
        VStack {
            Button("Marcar como pronta") {
                
            }
        }
        .navigationTitle(tarefa.nome)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    
                } label: {
                    Text("Volta")
                }

            }
        }
    }
    
    mutating func concluir() {
        self.tarefa.concluir()
    }
}

#Preview {
    TaskDetailView()
}
