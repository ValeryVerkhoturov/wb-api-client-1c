#Использовать jason

// AnalyticsPositionInfo
//
// Информация о позиции товара
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// average - AnalyticsPositionInfoAverage
&Сериализуемое("average")
&Тип("AnalyticsPositionInfoAverage")
Перем average Экспорт;

// median - AnalyticsPositionInfoMedian
&Сериализуемое("median")
&Тип("AnalyticsPositionInfoMedian")
Перем median Экспорт;

// chartItems - Массив - Данные для чарта по средней и медианной позиции товара в результатах поиска
&Сериализуемое("chartItems")
&Тип("Массив")
&ДляКаждого
&Тип("AnalyticsSearchReportPositionChartItem")
Перем chartItems Экспорт;

// clusters - AnalyticsSearchReportPositionClusters
&Сериализуемое("clusters")
&Тип("AnalyticsSearchReportPositionClusters")
Перем clusters Экспорт;

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

