//
//  BookShop.swift
//  7l_Ryskul_Asset
//
//  Created by Asset Ryskul on 26.11.2021.
//

// MARK: - класс группы студентов
class Groupmates {
    
    // список студентов
    private var students = [
        "Иванов Иван Иванович": 50,
        "Сидоров Сидор Сидорович": 90,
        "Петров Петр Петрович": 87
    ]
    
    // метод возвращает оценку студента по ФИО
    func evaluation(atFio fio: String) -> Int? {
        return students[fio]
    }
    
    // метод возвращает среднюю оценку группы
    func averageEvaluation() -> Int {
        guard students.count > 1 else { // иначе возвращаем 0
            return 0
        }
        var totalEvaluation = 0
        for student in students {
            totalEvaluation += student.value
        }
        return totalEvaluation / students.count
    }
}
