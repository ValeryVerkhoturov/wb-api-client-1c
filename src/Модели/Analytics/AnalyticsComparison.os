#Использовать jason

// AnalyticsComparison
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// openCountDynamic - Число - Динамика переходов в карточку товара
&Сериализуемое("openCountDynamic")
&Тип("Число")
Перем openCountDynamic Экспорт;

// cartCountDynamic - Число - Динамика добавлений в корзину
&Сериализуемое("cartCountDynamic")
&Тип("Число")
Перем cartCountDynamic Экспорт;

// orderCountDynamic - Число - Динамика количества заказов
&Сериализуемое("orderCountDynamic")
&Тип("Число")
Перем orderCountDynamic Экспорт;

// orderSumDynamic - Число - Динамика суммы заказов
&Сериализуемое("orderSumDynamic")
&Тип("Число")
Перем orderSumDynamic Экспорт;

// buyoutCountDynamic - Число - Динамика выкупов
&Сериализуемое("buyoutCountDynamic")
&Тип("Число")
Перем buyoutCountDynamic Экспорт;

// buyoutSumDynamic - Число - Динамика суммы выкупов
&Сериализуемое("buyoutSumDynamic")
&Тип("Число")
Перем buyoutSumDynamic Экспорт;

// cancelCountDynamic - Число - Динамика отмен и возвратов товаров
&Сериализуемое("cancelCountDynamic")
&Тип("Число")
Перем cancelCountDynamic Экспорт;

// cancelSumDynamic - Число - Динамика сумм отмен и возвратов товаров
&Сериализуемое("cancelSumDynamic")
&Тип("Число")
Перем cancelSumDynamic Экспорт;

// avgOrdersCountPerDayDynamic - Число - Динамика среднего количества заказов в день
&Сериализуемое("avgOrdersCountPerDayDynamic")
&Тип("Число")
Перем avgOrdersCountPerDayDynamic Экспорт;

// avgPriceDynamic - Число - Динамика средней цены на товары. Учитываются скидки для акций
&Сериализуемое("avgPriceDynamic")
&Тип("Число")
Перем avgPriceDynamic Экспорт;

// shareOrderPercentDynamic - Число - Динамика доли в выручке
&Сериализуемое("shareOrderPercentDynamic")
&Тип("Число")
Перем shareOrderPercentDynamic Экспорт;

// addToWishlistDynamic - Число - Динамика добавлений товара в избранное
&Сериализуемое("addToWishlistDynamic")
&Тип("Число")
Перем addToWishlistDynamic Экспорт;

// timeToReadyDynamic - AnalyticsComparisonTimeToReadyDynamic
&Сериализуемое("timeToReadyDynamic")
&Тип("AnalyticsComparisonTimeToReadyDynamic")
Перем timeToReadyDynamic Экспорт;

// localizationPercentDynamic - Число - Динамика локальных заказов в рамках одного региона. [На данный момент](https://dev.wildberries.ru/release-notes?id=570) может быть только `0`
&Сериализуемое("localizationPercentDynamic")
&Тип("Число")
Перем localizationPercentDynamic Экспорт;

// wbClubDynamic - AnalyticsComparisonWbClubDynamic
&Сериализуемое("wbClubDynamic")
&Тип("AnalyticsComparisonWbClubDynamic")
Перем wbClubDynamic Экспорт;

// conversions - AnalyticsStatisticConversions
&Сериализуемое("conversions")
&Тип("AnalyticsStatisticConversions")
Перем conversions Экспорт;

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

