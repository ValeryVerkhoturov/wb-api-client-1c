#Использовать jason

// AnalyticsItemsResponseProductsInnerStatistic
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// selected - AnalyticsStatisticsSelected
&Сериализуемое("selected")
&Тип("AnalyticsStatisticsSelected")
Перем selected Экспорт;

// past - AnalyticsStatisticsPast
&Сериализуемое("past")
&Тип("AnalyticsStatisticsPast")
Перем past Экспорт;

// comparison - AnalyticsStatisticsComparison
&Сериализуемое("comparison")
&Тип("AnalyticsStatisticsComparison")
Перем comparison Экспорт;

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

