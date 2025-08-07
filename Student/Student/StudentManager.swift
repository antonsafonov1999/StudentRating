//
//  StudentManager.swift
//  Student
//
//  Created by Anton Safonov on 06/08/2025.
//

struct StudentManager
{
    static var students: [Student] = []
    static func addStudentWithNameAndSurname()
    {
        while true
        {
            print(#"Введите имя студента:"#)
            guard let name = readLine() else { continue}
            print(#"Введите фамилию студента:"#)
            guard let surname = readLine() else { continue}
            if let student = Student(firstName: name, lastname: surname)
            {
                students.append(student)
                print("Студент \(name) \(surname) добавлен!\n")
            }else{
                print("Ошибка: Не удалось создать студента.\n")
            }
           
            print("Продолжить добавление студентов? (y/n)\n")
            if readLine() == "n"
            {
                
                break
            }else { continue }
        }
        print("\\\\\\\\\\Массив студентов\\\\\\\\\\\n")
        for i in students
        {
            print("Name: \(i.firstName) Surname: \(i.lastName)\nObject: \(i.object), Rating: \(i.rating)\n")
        }
        
    }
    static func addStudentWithNameAndSurnameAndSubject()
    {
        
    }
    static func addStudentWithNameAndSurnameAndSubjectAndMark()
    {
        
    }
    static func addStudent() {
            print("Добавляем студента...\nВАРИАНТЫ:\n1) Студент с Именем и фамилией\n2) Студент с Именем, фамилией, предметом\n3) Студент с Именем, фамилией, предметом и оценкой\nВыдите номер пункта меню:\n")
        while true
            {
                if let choice = readLine(), let choiceInt = Int(choice)
            {
                switch choiceInt
                {
                case 1:
                    addStudentWithNameAndSurname()
                case 2:
                    addStudentWithNameAndSurnameAndSubject()
                case 3:
                    addStudentWithNameAndSurnameAndSubjectAndMark()
                default:
                    print("Такого пункта нет. Попробуйте снова"); continue
                }
                    break
                }else{print("Неверный ввод, введи цифру"); }
            }
        }
        static func addSubject() {
            print("Добавляем предмет...")
            // твой код добавления предмета
        }
        static func addMark() {
            print("Добавляем оценку студенту...")
            // твой код добавления оценки
        }
        static func showStudentInfo() {
            print("Показываем информацию по студенту...")
            // твой код показа информации
        }
        static func showStudentAverage() {
            print("Средний балл студента...")
            // твой код подсчёта среднего балла
        }
        static func showAllStudentsAverage() {
            print("Средний балл всех студентов...")
            // твой код подсчёта среднего по всем
        }
    static func showBestStudents() {
           print("Лучшие студенты...")
           // твой код показа лучших
       }
       static func showWorstStudents() {
           print("Худшие студенты...")
           // твой код показа худших
       }
       static func saveToJSON() {
           print("Сохраняем в JSON...")
           // твой код сохранения в JSON
       }
}
