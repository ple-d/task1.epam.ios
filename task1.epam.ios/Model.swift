//
//  Model.swift
//  task1.epam.ios
//
//  Created by XO on 12.06.2021.
//  Copyright © 2021 XO. All rights reserved.
//

import Foundation

struct Item {

   // Название элемента
   var title: String

   // Название картинки, чтобы спарсить ее из Assets
   var imageName: String

   // Цена (можно вписывать рандомно, но чур без огромных чисел, у одного элемента должен быть nil)
   var price: Double?

   // Ваша личная оценка от 1 до 5
   var myRating: Double

   // Описание (можно брать из википедии, либо придумать самому (не менее 15 символов))
   var description: String

  // Итого 5 полей

static func fetchItems() -> [Item] {
    let item1 = Item(title: "Ribeye-steak", imageName: "rib-eye", price: 1000, myRating: 4.8, description: "Рибай (англ. ribeye) — наиболее известный стейк в мире. Нарезается из отруба говядины толстый край с 6 по 12 ребро животного. Несмотря на то, что дословно «рибай» разбирается на «ребро» и «глаз» (англ. rib «ребро» + eye «глаз»), никакого отношения к рисунку, якобы напоминающему глаз, название не имеет. «Глаз» в данном случае обозначает центр лучшей вырезки без кости.")
    let item2 = Item(title: "Striploin-steak", imageName: "striploin-steak", price: 1698, myRating: 4.6, description: "Стриплойн (англ. strip + loin «филейная полоса») — «премиальный» стейк, который нарезается из отруба тонкий край, состоящего из единственной мышцы. По периметру стейка проходит тонкая полоска жира, придающая мясу сочность. Многие повара обрезают ее после прожарки стейка, и он получается постным.")
    let item3 = Item(title: "Flank-steak", imageName: "flank-steak", price: 970, myRating: 3.6, description: "Фланк-стейк — вырезается из нижней части живота; это жесткие, постные стейки с крупными и длинными волокнами, насыщенным мясным вкусом и ароматом. Рекомендуется предварительное маринование или обработка тендерайзером.")
    let item4 = Item(title: "T-bone", imageName: "Tbone-steak", price: nil, myRating: 4.4, description: "Тибоун-стейк (T-bone)  - стейк на Т-образной кости, вырезаемый из участка туши на границе между спинной и поясничной частями в области тонкого края длиннейшей мышцы спины и тонкого конца вырезки, поэтому состоящий сразу из двух видов стейкового мяса — филе-миньон с одной стороны косточки и «Нью-Йорк» — с другой")
    
    return [item1, item2, item3, item4]
}

}
