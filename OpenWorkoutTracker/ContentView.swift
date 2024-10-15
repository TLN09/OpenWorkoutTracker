//
//  ContentView.swift
//  OpenWorkoutTracker
//
//  Created by Thomas Lind Nielsen on 15/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(exercises) { exercise in
                    Text("\(exercise.name): \(exercise.reps)x\(exercise.sets), \(exercise.weight)")
                }
                .onDelete(perform: deleteExercise)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addExercise) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addExercise() {
        withAnimation {
            let newExercise = Exercise(reps: 0, sets: 0, weight: 0, name: "Exercise")
            modelContext.insert(newExercise)
        }
    }

    private func deleteExercise(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(exercises[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Exercise.self, inMemory: true)
}
