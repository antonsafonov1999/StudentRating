//
//  Student.swift
//  Student
//
//  Created by Anton Safonov on 05/08/2025.
//

class Student: Codable
{
    var firstName: String = ""
    var lastName: String = ""
    var object: String = ""
    var rating: Double = 0.0
    var noneObject = "NONE"
    
//    var StudentsMass: [Student] = []
    
    enum AddErrorStudent: Error
    {
        case emptyFirstName
        case emptyLastName
        case emptyObject
        case RangeNegativeRating

        case TooBigSmallFirstName
        case TooBigSmallLastName
        case TooBigSmallObject
        
    }
    func validateFirstLastName(_ firstName: String, _ lastname: String) throws -> Bool
    {
        if firstName.isEmpty { throw AddErrorStudent.emptyFirstName}
        if lastname.isEmpty { throw AddErrorStudent.emptyLastName}
        if lastname.count < 3 || lastname.count > 10 { throw AddErrorStudent.TooBigSmallLastName}
        if firstName.count < 3 || firstName.count > 10 { throw AddErrorStudent.TooBigSmallFirstName}
        return true
    }
    func validateRating(_ rating: Double)throws -> Bool
    {
        if rating < 0 || rating > 100 { throw AddErrorStudent.RangeNegativeRating}
        return true
    }
    func validateObject(_ object: String) throws  -> Bool
    {
        if object.isEmpty { throw AddErrorStudent.emptyObject}
        if object.count < 3 || object.count > 10 { throw AddErrorStudent.TooBigSmallObject}
        return true
    }
    
    deinit{print(print("🗑️ Студент \(self.firstName) \(self.lastName) удалён из памяти"))}
    
    init?()
    {
        print("Данный метод создании обьекта , создает пустой обьект, с базовыми значениями.\nВы хотите продолжить?(y/n) ")
        if readLine() != "y" { print("обьект не создан");return nil }else{
            firstName = "noneFirstName"
            lastName = "noneLastName"
            object = "NONE"
            rating = 0.0
            print("Обьект создан")
        }
        
    }
   
    init?(firstName: String, lastname: String)
    {
        do {
             if try validateFirstLastName(firstName, lastname)
            {
                 self.firstName = firstName
                 self.lastName = lastname
                 self.object = noneObject
                 self.rating = 0.0
                 return
             }else {print("Ошибка в инициализации обьекта!\nОшибка при создании Имени или Фамилии!\n"); return nil}
        }catch AddErrorStudent.emptyFirstName
        {
            print("Ошибка в вводе данных, \"ИМЯ\" не может быть пустым!\nОбьект не будет создан!\n")
            return nil
        }catch AddErrorStudent.emptyLastName
        {
            print("Ошибка в вводе данных, \"ФАМИЛИЯ\" не может быть пустым!\nОбьект не будет создан!\n")
            return nil
        }catch AddErrorStudent.TooBigSmallLastName
        {
            print("Ошибка в вводе данных, \"ФАМИЛИЯ\" должно быть от 3 до 10 символов!\nОбьект не будет создан!\n")
            return nil
        }catch AddErrorStudent.TooBigSmallFirstName
        {
            print("Ошибка в вводе данных, \"ИМЯ\" должно быть от 3 до 10 символов!\nОбьект не будет создан!\n")
            return nil
        } catch {
            print("Неизвестаня ошибка! При инициализации Имени или Фамилии обьекта возникла ошибка\nОбьект не будет создан!\n")
            return nil
        }
    }
    
    convenience init?(firstName: String, lastName: String, object: String)
    {
        do
        {
            self.init(firstName: firstName, lastname: lastName)
            let validationObject = try validateObject(object)
            if validationObject
            {
                self.object = object
                self.rating = 0.0
                return
            }else {print("Ошибка в инициализации обьекта!\nОшибка при создании предмета или рейтинга!\n"); return nil}
                }catch AddErrorStudent.RangeNegativeRating
                {
                    print("Ошибка при инициализации обьекта, \"РЕЙТИНГ\" не может быть меньше 0 или больше 100!\nОбьект не будет создан!\n")
                    return nil
                }catch AddErrorStudent.emptyObject
                {
                    print("Ошибка при инициализации обьекта, \"ПРЕДМЕТ\"  не может быть путсым! \nОбьект не будет создан!\n")
                    return nil
                } catch
                {
                    print("Неизвестаня ошибка! При инициализации премета или оценки обьекта возникла ошибка\nОбьект не будет создан!\n")
                    return nil
                }
        
    }

}
