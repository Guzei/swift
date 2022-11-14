> [Markdown](https://daringfireball.net/projects/markdown/)

# Cheat Sheet for Swift

# Sources for Swift
In English, the main documentation is from [Apple developer][Apple developer]. Apple also created the [Swift community][Swift community]. In 2017-2018, Stanford University published a lecture course CS193P on [iOS 11 app development with Swift][Stanford] on YouTube.

On english main documentation on [Apple developer][Apple developer]. Also Apple make [Swift community][Swift community]. In 20172018 Stanford Univercity record to YouTube cors about [Developing iOS 11 Apps with Swift][Stanford]

[Apple developer]: https://developer.apple.com/documentation/swift/
[Swift community]: https://www.swift.org
[Stanford]: https://youtube.com/playlist?list=PL3d_SFOiG7_8ofjyKzX6Nl1wZehbdiZC_  "EN, YouTube"


По-русски полезный (переводной-коммерческий) сайт [swiftbook.ru][swiftbook.ru] и его новый вариант с платынми видеокурсами [swiftbook.org][swiftbook.org]. На ютубе множество курсов на разный вкус и разного качества.
* Легко смотрятся видосы от [MadiSpace][MadiSpace]
* и [Вячеслава Белого][Belii]
* живой канал [justaSid][justaSid]
* Нв SwiftBook есть и [Курс по теории языка Swift][SwiftBook 1], и [Копошилка][Swiftbook 2] с "фишками" и много ещё.
* Так же можно сказать спасибо Ivan Skorokhod за [перевод станфордских лекций][Ivan Skorokhod] 
* В 2020 Ian Solomein сделал [множество уроков][Ian Solomein]
* С 2013 по 2018 [Alex Skutarenko со своей подачей материала][Alex Skutarenko]
* С 2017 по 2018 [Евгений Зверик][The Swift Developers] записал много видео

[swiftbook.ru]: https://swiftbook.ru/content/docs/  "RU"
[Swiftbook 1]: https://www.youtube.com/playlist?list=PLtovLaW_R9-PUVWIFRq_V6s4JxE_Mj2ha
[SwiftBook 2]: https://www.youtube.com/playlist?list=PLtovLaW_R9-PmRcQ0tdIgHEpf5L4nBMOH
[swiftbook.org]: https://swiftbook.org/courses
[MadiSpace]: https://www.youtube.com/MadiSpace
[Belii]: https://youtube.com/playlist?list=PLnlik7Rjo4n2lNGklbWwvsmqgd-D9HqZf
[Ivan Skorokhod]: https://www.youtube.com/channel/UChfEfFKYILtO5yZSX2irynw
[Ian Solomein]: https://www.youtube.com/c/IanSolomein/featured
[Alex Skutarenko]: https://www.youtube.com/c/AlexSkutarenko/featured
[The Swift Developers]: https://www.youtube.com/channel/UCiyiEAeWUuuPj6tt_jePALQ
[justaSid]: https://www.youtube.com/channel/UCzEEFRoqIZht9kSGFhtScbA  "Дата регистрации: 28 дек. 2019 г."

# Операторы
```
+ сложение
- вычитание
* умножение
/ деление
% остатот от целочисленного деления
= присваивание
+= увеличение себя
-= уменьшение себя
*= умножение себя
/= деление себя
условие ? да : нет    -- тернарный
== сравнение "равно"
!= сравнение "не равно"
>, >=, <, <=
!переменная    -- отрицание
переменная!    -- жёсткое извлечение опционала
..., ...<    -- диапазон
тип?   -- расширение типа до опционала
??  -- мягкое извлечение опционала
```

# Types

## Value types / Типы значений
### Primitives types
* Int, UInt (8, 16, 32, 64) // UInt64.max
* Double, Float, Float80
* Boolean
* String
* Character
### ...
* [Protocol](https://github.com/Guzei/swift/blob/main/protocol.playground/Contents.swift)
* Struct
* Enum (not inderect)
* Tuples / Кортежи

## Referens types / Ссылочные типы
* classes
* Function // Function type () -> ()
* Inderect Enums
* Actors

## Collection types
* [Array](https://github.com/Guzei/swift/blob/main/array.playground/Contents.swift)
* [Set](https://github.com/Guzei/swift/blob/main/set.playground/Contents.swift)
* Dictionary
* Enum

# Memory
## Heap (куча)
* referens types non fix size & unnown time life
* при соблюдении протокола (...экзитенциальные контейнеры...)
* смешенный тип (класс в структуре и наоборот)
* сбегающее замыкание
* inout параметр

## Stack (временная память, более быстрая)
* value types
* referens types with fix size or time life

# Ветвления (if, switch)
[if & switch](https://github.com/Guzei/swift/blob/main/branching.playground/Contents.swift)

# ООП
[inheritanse - наследование](https://github.com/Guzei/swift/blob/main/inheritance.playground/Contents.swift)
