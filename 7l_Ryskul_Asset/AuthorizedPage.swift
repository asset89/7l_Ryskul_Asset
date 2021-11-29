//
//  AuthorizedPage.swift
//  7l_Ryskul_Asset
//
//  Created by Asset Ryskul on 26.11.2021.
//

// MARK: - структура для авторизации
struct Authorization {
    let username: String  // имя пользователя
    let token: AuthToken  // экземпляр структуры для токена и ID
    let credentials: Credentials // экземпляр структуры для эл.почты и пароля
}

// MARK: - структура для данных аутентификации
struct Credentials {
    let email: String
    let password: String
}

// MARK: - структура данных после авторизации
struct AuthToken {
    let token: String 
    let id: Int
}

// MARK: - ошибки при авторизации
enum AuthorizationError: Error {
    case invalidUsername                    // неправильное имя пользователя
    case invalidEmail                       // неправильная электронная почта
    case invalidPassword                    // неправильный пароль
    case invalidAccess                      // другая ошибка при авторизации
}

// MARK: - класс для авторизации
class Authorize {
     
    // БД авторизационных данных
    var auth_DB = [
        "admin" : Authorization(username: "admin", token: AuthToken(token: "3487jcd3", id: 1), credentials: Credentials(email: "admin@mail.com", password: "admin")),
        "user1" : Authorization(username: "user1", token: AuthToken(token: "dhfjhwe123", id: 2), credentials: Credentials(email: "user@mail.ru", password: "qwerty")),
        "superuser" : Authorization(username: "superuser", token: AuthToken(token: "q138fk7cd3", id: 3), credentials: Credentials(email: "steve@gmail.com", password: "P@ssw0rd"))
        
    ]
    
    // метод для авторизации
    func sign_in(username name: String, email: String, password: String) throws -> AuthToken {
         var item_email: String
         var item_pass: String
        
         guard let item_name = auth_DB[name]?.username else {
             throw AuthorizationError.invalidUsername
         }
        
         if email == auth_DB[item_name]?.credentials.email {
             item_email = email
         } else {
             throw AuthorizationError.invalidEmail
         }
        
         if password == auth_DB[item_name]?.credentials.password {
             item_pass = password
         } else {
             throw AuthorizationError.invalidPassword
         }
        
         print("Пользователь \(item_name) успешно зашел в аккаунт \(item_email) с паролем \(item_pass)")
         return auth_DB[item_name]!.token
    }
    
}


