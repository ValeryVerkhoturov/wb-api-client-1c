#Использовать jason

// AnalyticsMainResponse
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// commonInfo - AnalyticsCommonInfo
&Сериализуемое("commonInfo")
&Тип("AnalyticsCommonInfo")
Перем commonInfo Экспорт;

// positionInfo - AnalyticsPositionInfo
&Сериализуемое("positionInfo")
&Тип("AnalyticsPositionInfo")
Перем positionInfo Экспорт;

// visibilityInfo - AnalyticsVisibilityInfo
&Сериализуемое("visibilityInfo")
&Тип("AnalyticsVisibilityInfo")
Перем visibilityInfo Экспорт;

// groups - Массив - Список элементов таблицы
&Сериализуемое("groups")
&Тип("Массив")
&ДляКаждого
&Тип("AnalyticsTableGroupItem")
Перем groups Экспорт;

// currency - Строка - Валюта отчёта
&Сериализуемое("currency")
&Тип("Строка")
Перем currency Экспорт;

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

