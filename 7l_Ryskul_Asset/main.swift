//
//  main.swift
//  7l_Ryskul_Asset
//
//  Created by Asset Ryskul on 26.11.2021.
//

// MARK: - обьект класса группы студентов, реализация класса в файле GroupMates
let group = Groupmates()
print(group.evaluation(atFio: "Иванов Иван Иванович")) // 50
print(group.evaluation(atFio: "Брюс Вейн Бэтмэнович")) // nil
print(group.averageEvaluation())

// MARK: - обьект класса для авторизации, реализация класса в файле AuthorizedPage
let authorize_process = Authorize()
do {
    let auth_token = try authorize_process.sign_in(username: "admin", email: "admin@gmail.com", password: "admin")
    print(auth_token.token)
} catch AuthorizationError.invalidUsername {
    print("Несуществующее имя пользователя")
} catch AuthorizationError.invalidEmail {
    print("Неправильный адрес электронной почты")
} catch AuthorizationError.invalidPassword {
    print("Неправильный пароль")
} catch AuthorizationError.invalidAccess {
    print("Сервер не отвечает")
}


