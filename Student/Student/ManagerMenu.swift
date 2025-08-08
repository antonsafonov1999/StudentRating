//
//  ManagerMenu.swift
//  Student
//
//  Created by Anton Safonov on 06/08/2025.
//
import Darwin
struct ManagerMenu
{
    static func ClearConsole(){print("\u{001B}[2J\u{001B}[H")}
    
    static public func showMenu()
    {
        print("""
            \\\\\\\\\\\\MENU\\\\\\\\\\\\
            1) ДОБАВЛЕНИЕ СТУДЕНТА🧑‍🎓
            2) ДОБАВЛЕНИЕ ПРЕДМЕТА К СТУДЕНТУ📚
            3) ДОБАВЛЕНИЕ ОЦЕНКИ СТУДЕНТУ ПО ПРЕДМЕТУ💯
            4) ПРОСМОТР ИНФОРМАЦИИ ПО СТУДЕНТУℹ️
            5) ВЫВОД СРЕДНЕГО БАЛА ПО СТУДЕНТУ ％
            6) ВЫВОД СРЕДНЕГО БАЛА ВСЕХ СТУДЕНТОВ％
            7) ВЫВОД ЛУЧШИХ СТУДЕНТОВ🥇
            8) ВЫВОД ХУДШИХ СТУДЕНТОВ🥉
            9) СОХРАНИТЬ В jsone📝
            0) ВЫХОД ❌
            """)
    }
    
    static public func OpenMenu()
    {
        print("Показать меню? (y/n)\n")
        if readLine() == "y"{choiceMenu()}else{print("Меню не показано")}
    }
    static private func choiceMenu()
    {
        showMenu( )
        print("Выдите номер пункта меню:")
        
        while true
        {
            if let num = readLine(), let choice = Int(num)
            {
                switch choice
                {
                case 0:
                    exit(0)
                case 1:
                    StudentManager.addStudent()
                case 2:
                    StudentManager.addSubject()
                case 3:
                    StudentManager.addMark()
                case 4:
                    StudentManager.showStudentInfo()
                case 5:
                    StudentManager.showStudentAverage()
                case 6:
                    StudentManager.showAllStudentsAverage()
                case 7:
                    StudentManager.showBestStudents()
                case 8:
                    StudentManager.showWorstStudents()
                case 9:
                    StudentManager.saveToJSON()
                default:
                    print("Такого пункта нет. Попробуйте снова"); continue
                }
                break
            }else{print("Неверный ввод, введи цифру"); }
        }
    }
}
