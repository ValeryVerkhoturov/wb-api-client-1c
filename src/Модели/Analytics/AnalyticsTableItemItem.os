#Использовать jason

// AnalyticsTableItemItem
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// nmId - Число - Артикул WB
&Сериализуемое("nmId")
&Тип("Число")
Перем nmId Экспорт;

// name - Строка - Название товара
&Сериализуемое("name")
&Тип("Строка")
Перем name Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// brandName - Строка - Бренд
&Сериализуемое("brandName")
&Тип("Строка")
Перем brandName Экспорт;

// mainPhoto - Строка - URL главного фото карточки товара
&Сериализуемое("mainPhoto")
&Тип("Строка")
Перем mainPhoto Экспорт;

// isAdvertised - Булево - Находится ли товар в продвижении в Поисковой выдаче
&Сериализуемое("isAdvertised")
&Тип("Булево")
Перем isAdvertised Экспорт;

// isSubstitutedSKU - Булево - Искали ли товар по подменному артикулу. Поле будет в ответе при наличии в запросе `includeSubstitutedSKUs` и/или `includeSearchTexts`
&Сериализуемое("isSubstitutedSKU")
&Тип("Булево")
Перем isSubstitutedSKU Экспорт;

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

// avgPosition - AnalyticsTableGroupItemMetricsAvgPosition
&Сериализуемое("avgPosition")
&Тип("AnalyticsTableGroupItemMetricsAvgPosition")
Перем avgPosition Экспорт;

// openCard - AnalyticsVisibilityInfoOpenCard
&Сериализуемое("openCard")
&Тип("AnalyticsVisibilityInfoOpenCard")
Перем openCard Экспорт;

// addToCart - AnalyticsTableGroupItemMetricsAddToCart
&Сериализуемое("addToCart")
&Тип("AnalyticsTableGroupItemMetricsAddToCart")
Перем addToCart Экспорт;

// openToCart - AnalyticsTableGroupItemMetricsOpenToCart
&Сериализуемое("openToCart")
&Тип("AnalyticsTableGroupItemMetricsOpenToCart")
Перем openToCart Экспорт;

// orders - AnalyticsTableGroupItemMetricsOrders
&Сериализуемое("orders")
&Тип("AnalyticsTableGroupItemMetricsOrders")
Перем orders Экспорт;

// cartToOrder - AnalyticsTableGroupItemMetricsCartToOrder
&Сериализуемое("cartToOrder")
&Тип("AnalyticsTableGroupItemMetricsCartToOrder")
Перем cartToOrder Экспорт;

// visibility - AnalyticsTableGroupItemMetricsVisibility
&Сериализуемое("visibility")
&Тип("AnalyticsTableGroupItemMetricsVisibility")
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

