//
//  BirthdayTextField.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 11.02.24.
//

import SwiftUI

struct BirthdayTextField: View {
    @Binding var selectedDate: Date
    @State private var isEditing = false

    var text: Binding<String> {
        Binding(
            get: {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                return dateFormatter.string(from: selectedDate)
            },
            set: { _ in }
        )
    }

    var body: some View {
        TextField("Select a date", text: text)
            .disabled(true)
            .padding()
            .background(Color(.secondarySystemBackground))
            .onTapGesture {
                self.isEditing = true
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay(
                Group {
                    if isEditing {
                        Color.black.opacity(0.001)
                            .onTapGesture {
                                self.isEditing = false
                            }
                            .edgesIgnoringSafeArea(.all)
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding()
                    }
                }
            )
    }
}

#Preview {
    BirthdayTextField(selectedDate: .constant(Date()))
}
