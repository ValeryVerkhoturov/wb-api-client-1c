#Использовать jason

// AnalyticsSearchReportPositionClusters
//
// Количество товаров со средней позицией в поиске:
// - `firstHundred` — от 1 до 100
// - `secondHundred` — от 101 до 200
// - `below` — от 201 и ниже
//
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// firstHundred - AnalyticsSearchReportPositionClustersFirstHundred
&Сериализуемое("firstHundred")
&Тип("AnalyticsSearchReportPositionClustersFirstHundred")
Перем firstHundred Экспорт;

// secondHundred - AnalyticsSearchReportPositionClustersSecondHundred
&Сериализуемое("secondHundred")
&Тип("AnalyticsSearchReportPositionClustersSecondHundred")
Перем secondHundred Экспорт;

// below - AnalyticsSearchReportPositionClustersBelow
&Сериализуемое("below")
&Тип("AnalyticsSearchReportPositionClustersBelow")
Перем below Экспорт;

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

