#Использовать jason

// AnalyticsTableSizeResponseSizesInnerMetrics
//
// Метрики размера
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// ordersCount - Число - Заказы, шт.
&Сериализуемое("ordersCount")
&Тип("Число")
Перем ordersCount Экспорт;

// ordersSum - Число - Заказы, сумма
&Сериализуемое("ordersSum")
&Тип("Число")
Перем ordersSum Экспорт;

// avgOrders - Число - Среднее количество заказов в день
&Сериализуемое("avgOrders")
&Тип("Число")
Перем avgOrders Экспорт;

// avgOrdersByMonth - Массив - Среднее количество заказов по месяцам
&Сериализуемое("avgOrdersByMonth")
&Тип("Массив")
&ДляКаждого
&Тип("AnalyticsFloatGraphByPeriodItem")
Перем avgOrdersByMonth Экспорт;

// buyoutCount - Число - Выкупы, шт.
&Сериализуемое("buyoutCount")
&Тип("Число")
Перем buyoutCount Экспорт;

// buyoutSum - Число - Выкупы, сумма
&Сериализуемое("buyoutSum")
&Тип("Число")
Перем buyoutSum Экспорт;

// buyoutPercent - Число - Процент выкупа
&Сериализуемое("buyoutPercent")
&Тип("Число")
Перем buyoutPercent Экспорт;

// stockCount - Число - Остатки на текущий день, шт.
&Сериализуемое("stockCount")
&Тип("Число")
Перем stockCount Экспорт;

// stockSum - Число - Стоимость остатков на текущий день
&Сериализуемое("stockSum")
&Тип("Число")
Перем stockSum Экспорт;

// saleRate - AnalyticsTableCommonMetricsSaleRate
&Сериализуемое("saleRate")
&Тип("AnalyticsTableCommonMetricsSaleRate")
Перем saleRate Экспорт;

// avgStockTurnover - AnalyticsTableCommonMetricsAvgStockTurnover
&Сериализуемое("avgStockTurnover")
&Тип("AnalyticsTableCommonMetricsAvgStockTurnover")
Перем avgStockTurnover Экспорт;

// toClientCount - Число - В пути к клиенту, шт.
&Сериализуемое("toClientCount")
&Тип("Число")
Перем toClientCount Экспорт;

// fromClientCount - Число - В пути от клиента, шт.
&Сериализуемое("fromClientCount")
&Тип("Число")
Перем fromClientCount Экспорт;

// officeMissingTime - AnalyticsTableCommonMetricsOfficeMissingTime
&Сериализуемое("officeMissingTime")
&Тип("AnalyticsTableCommonMetricsOfficeMissingTime")
Перем officeMissingTime Экспорт;

// lostOrdersCount - Число - Упущенные заказы, шт. Особые случаи: 1. Значение меньше `0` и не равно `-2` — значение не рассчитано 2. Значение `-2` — нулевое значение
&Сериализуемое("lostOrdersCount")
&Тип("Число")
Перем lostOrdersCount Экспорт;

// lostOrdersSum - Число - Упущенные заказы, сумма. Особые случаи: 1. Значение меньше `0` и не равно `-2` — значение не рассчитано 2. Значение `-2` — нулевое значение
&Сериализуемое("lostOrdersSum")
&Тип("Число")
Перем lostOrdersSum Экспорт;

// lostBuyoutsCount - Число - Упущенные выкупы, шт. Особые случаи: 1. Значение меньше `0` и не равно `-2` — значение не рассчитано 2. Значение `-2` — нулевое значение
&Сериализуемое("lostBuyoutsCount")
&Тип("Число")
Перем lostBuyoutsCount Экспорт;

// lostBuyoutsSum - Число - Упущенные выкупы, сумма. Особые случаи: 1. Значение меньше `0` и не равно `-2` — значение не рассчитано 2. Значение `-2` — нулевое значение
&Сериализуемое("lostBuyoutsSum")
&Тип("Число")
Перем lostBuyoutsSum Экспорт;

// currentPrice - AnalyticsTableItemItemStMetricsAllOfCurrentPrice
&Сериализуемое("currentPrice")
&Тип("AnalyticsTableItemItemStMetricsAllOfCurrentPrice")
Перем currentPrice Экспорт;

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

