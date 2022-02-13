# mobile_bank

Кроссплатформенное мобильное приложение на языке Dart и фреймворке Flutter.

## О приложении

Приложение было разработано 13.02.2022 в рамках лекционного заданя Сбера на образовательном форуме УрФу "Программная инженерия и радиотехника".

Мобильное приложение банка для совершения операций: перевода денег по номеру телефона и перевода по номеру карты.

### Идеи

Killer-фичи:
- Безопасная аутентификация через страницу с пин-кодом, использование биометрии
- Автоматическое получение контактов с устройства пользователя и возможность поиска по ним (по параметрам: имя, телефон)

Перевод – вызов запроса с самыми частыми контактами для перевода и телефонной книжкой

Предпочтения по сервисам из модели данных

При входе подбор предпочтений клиента для показа уведомлений

При перевороте телефоны скрываются данные счетов

Данные для аутентификации запрашиваются из базы данных

Список сервисов из базы данных

### Реализовано:
- :white_check_mark: Макет экрана ввода пин-кода, на текущем этапе - симулируем заполнение пинкода и пользователю нужно лишь нажать кнопку </br>
<img src="Screenshot_1644744178.png"> </br>
- :white_check_mark: Макет главного экрана с двумя функциональными кнопками - операции банка по заданию
- :white_check_mark: Всплывающие сообщения - рандомный факт из истории банка.
- :white_check_mark: Макет экрана перевода средств по номеру телефона/счета в зависимости от флага.
- :white_check_mark:
