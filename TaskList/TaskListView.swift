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
    
    @State var tarefas: [Tarefa] = [Tarefa(), Tarefa()]
    
    var body: some View {
        NavigationStack {
            List(tarefas) { tarefa in
                NavigationLink {
                    TaskDetailView()
                } label: {
                    Text("Navegar")
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
