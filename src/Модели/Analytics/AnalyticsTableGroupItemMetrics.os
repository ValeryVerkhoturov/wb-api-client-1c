#Использовать jason

// AnalyticsTableGroupItemMetrics
//
// Метрики товара в таблице
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

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

