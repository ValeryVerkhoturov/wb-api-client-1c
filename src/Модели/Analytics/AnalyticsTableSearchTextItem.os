#Использовать jason

// AnalyticsTableSearchTextItem
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// text - Строка - Текст поискового запроса
&Сериализуемое("text")
&Тип("Строка")
Перем text Экспорт;

// nmId - Число - Артикул WB
&Сериализуемое("nmId")
&Тип("Число")
Перем nmId Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// brandName - Строка - Бренд
&Сериализуемое("brandName")
&Тип("Строка")
Перем brandName Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// name - Строка - Название товара
&Сериализуемое("name")
&Тип("Строка")
Перем name Экспорт;

// isCardRated - Булево - Есть ли рейтинг у карточки товара
&Сериализуемое("isCardRated")
&Тип("Булево")
Перем isCardRated Экспорт;

// rating - Число - Рейтинг карточки товара
&Сериализуемое("rating")
&Тип("Число")
Перем rating Экспорт;

// feedbackRating - Число - Рейтинг по отзывам
&Сериализуемое("feedbackRating")
&Тип("Число")
Перем feedbackRating Экспорт;

// price - AnalyticsTableItemItemAllOfPrice
&Сериализуемое("price")
&Тип("AnalyticsTableItemItemAllOfPrice")
Перем price Экспорт;

// frequency - AnalyticsTableSearchTextItemAllOfFrequency
&Сериализуемое("frequency")
&Тип("AnalyticsTableSearchTextItemAllOfFrequency")
Перем frequency Экспорт;

// weekFrequency - Число - Количество обращений с поисковым запросом за неделю
&Сериализуемое("weekFrequency")
&Тип("Число")
Перем weekFrequency Экспорт;

// medianPosition - AnalyticsTableSearchTextItemAllOfMedianPosition
&Сериализуемое("medianPosition")
&Тип("AnalyticsTableSearchTextItemAllOfMedianPosition")
Перем medianPosition Экспорт;

// avgPosition - AnalyticsTableGroupItemMetricsAvgPosition
&Сериализуемое("avgPosition")
&Тип("AnalyticsTableGroupItemMetricsAvgPosition")
Перем avgPosition Экспорт;

// openCard - AnalyticsTableSearchTextItemAllOfOpenCard
&Сериализуемое("openCard")
&Тип("AnalyticsTableSearchTextItemAllOfOpenCard")
Перем openCard Экспорт;

// addToCart - AnalyticsTableSearchTextItemAllOfAddToCart
&Сериализуемое("addToCart")
&Тип("AnalyticsTableSearchTextItemAllOfAddToCart")
Перем addToCart Экспорт;

// openToCart - AnalyticsTableSearchTextItemAllOfOpenToCart
&Сериализуемое("openToCart")
&Тип("AnalyticsTableSearchTextItemAllOfOpenToCart")
Перем openToCart Экспорт;

// orders - AnalyticsTableSearchTextItemAllOfOrders
&Сериализуемое("orders")
&Тип("AnalyticsTableSearchTextItemAllOfOrders")
Перем orders Экспорт;

// cartToOrder - AnalyticsTableSearchTextItemAllOfCartToOrder
&Сериализуемое("cartToOrder")
&Тип("AnalyticsTableSearchTextItemAllOfCartToOrder")
Перем cartToOrder Экспорт;

// visibility - AnalyticsTableSearchTextItemAllOfVisibility
&Сериализуемое("visibility")
&Тип("AnalyticsTableSearchTextItemAllOfVisibility")
Перем visibility Экспорт;

// Возвращает JSON-представление модели.
//
// Незаполненные свойства пропускаются, поэтому в теле запроса не появится
// null там, где сервис ожидает отсутствие поля.
//
// Возвращаемое значение:
//   Строка
//
Функция ВJson() Экспорт
	Возврат Новый СериализаторJson().Сериализовать(ЭтотОбъект);
КонецФункции

