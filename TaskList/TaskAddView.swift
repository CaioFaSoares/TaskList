//
//  TaskAddView.swift
//  TaskList
//
//  Created by Caio Soares on 26/08/24.
//

import SwiftUI

struct TaskAddView: View {
    
    @Binding var novaTarefa: Tarefa
    @Binding var estaCriando: Bool
    
    var body: some View {
        VStack {
            TextField("Nome da Tarefa", text: $novaTarefa.nome)
                .textFieldStyle(.roundedBorder)
                .padding(.all)
            Button("Adicionar") {
                estaCriando = false
            }.buttonStyle(.borderedProminent)
        }.padding(.all)
    }
}

//#Preview {
//    TaskAddView()
//}
