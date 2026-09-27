#Использовать jason

// AnalyticsStatistic
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// period - AnalyticsStatisticPeriod
&Сериализуемое("period")
&Тип("AnalyticsStatisticPeriod")
Перем period Экспорт;

// openCount - Число - Количество переходов в карточку товара
&Сериализуемое("openCount")
&Тип("Число")
Перем openCount Экспорт;

// cartCount - Число - Положили в корзину, шт.
&Сериализуемое("cartCount")
&Тип("Число")
Перем cartCount Экспорт;

// orderCount - Число - Заказали товаров, шт.
&Сериализуемое("orderCount")
&Тип("Число")
Перем orderCount Экспорт;

// orderSum - Число - Заказали на сумму
&Сериализуемое("orderSum")
&Тип("Число")
Перем orderSum Экспорт;

// buyoutCount - Число - Выкупили товаров, шт.
&Сериализуемое("buyoutCount")
&Тип("Число")
Перем buyoutCount Экспорт;

// buyoutSum - Число - Выкупили на сумму
&Сериализуемое("buyoutSum")
&Тип("Число")
Перем buyoutSum Экспорт;

// cancelCount - Число - Отменили и вернули товаров, шт.
&Сериализуемое("cancelCount")
&Тип("Число")
Перем cancelCount Экспорт;

// cancelSum - Число - Отменили и вернули на сумму
&Сериализуемое("cancelSum")
&Тип("Число")
Перем cancelSum Экспорт;

// avgPrice - Число - Средняя цена
&Сериализуемое("avgPrice")
&Тип("Число")
Перем avgPrice Экспорт;

// avgOrdersCountPerDay - Число - Среднее количество заказов в день, шт.
&Сериализуемое("avgOrdersCountPerDay")
&Тип("Число")
Перем avgOrdersCountPerDay Экспорт;

// shareOrderPercent - Число - Доля в выручке
&Сериализуемое("shareOrderPercent")
&Тип("Число")
Перем shareOrderPercent Экспорт;

// addToWishlist - Число - Добавили в **Отложенные**
&Сериализуемое("addToWishlist")
&Тип("Число")
Перем addToWishlist Экспорт;

// timeToReady - AnalyticsStatisticTimeToReady
&Сериализуемое("timeToReady")
&Тип("AnalyticsStatisticTimeToReady")
Перем timeToReady Экспорт;

// localizationPercent - Число - Локальные заказы в рамках одного региона. [На данный момент](https://dev.wildberries.ru/release-notes?id=570) может быть только `100`
&Сериализуемое("localizationPercent")
&Тип("Число")
Перем localizationPercent Экспорт;

// wbClub - AnalyticsStatisticWbClub
&Сериализуемое("wbClub")
&Тип("AnalyticsStatisticWbClub")
Перем wbClub Экспорт;

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

