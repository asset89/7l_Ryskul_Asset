//
//  BookShop.swift
//  7l_Ryskul_Asset
//
//  Created by Asset Ryskul on 26.11.2021.
//

// MARK: - структура для описания товара
struct BookItem {
    let price: Int   // цена
    var count: Int   // количество
    let book: Book   // товар
}

// MARK: - структура книги
struct Book {
    let name: String // название товара
}

// MARK: - ошибки при покупке книги
enum BookShopError: Error {

    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}

// MARK: - класс для покупки книг через Интернет
class BookShop {
    var products = [
        "War & Piece" : BookItem(price: 150, count: 10, book: Book(name: "War & Piece")),
        "Adventures of Sherlock Holmes" : BookItem(price: 200, count: 5, book: Book(name: "Adventures of Sherlock Holmes")),
        "Faust": BookItem(price: 100, count: 8, book: Book(name: "Faust"))
    ]
    
    var coinsDeposited = 0
// продаем товар
    func sell(itemNamed name: String) -> Book? {
// если наша машина не знает такого товара вообще, возвращаем nil
        guard let item = products[name] else {
            return nil
        }
// если товара нет в наличии, возвращаем nil
        guard item.count > 0 else {
            return nil
        }
// если недостаточно денег, возвращаем nil
        guard item.price <= coinsDeposited else {
            return nil
        }
// продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        products[name] = newItem
        print("Dispensing \(name)")
        return newItem.book
    }
}
