#Использовать jason

// AnalyticsFeedbacksIncreaseItem
//
// Прирост оценок
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// current - Число - Прирост оценок за период
&Сериализуемое("current")
&Тип("Число")
Перем current Экспорт;

// total - Число - Всего оценок
&Сериализуемое("total")
&Тип("Число")
Перем total Экспорт;

// dynamics - Число - Динамика по сравнению с предыдущим периодом, %
&Сериализуемое("dynamics")
&Тип("Число")
Перем dynamics Экспорт;

// fiveStar - AnalyticsFeedbacksIncreaseItemFiveStar
&Сериализуемое("fiveStar")
&Тип("AnalyticsFeedbacksIncreaseItemFiveStar")
Перем fiveStar Экспорт;

// fourStar - AnalyticsFeedbacksIncreaseItemFourStar
&Сериализуемое("fourStar")
&Тип("AnalyticsFeedbacksIncreaseItemFourStar")
Перем fourStar Экспорт;

// threeStar - AnalyticsFeedbacksIncreaseItemThreeStar
&Сериализуемое("threeStar")
&Тип("AnalyticsFeedbacksIncreaseItemThreeStar")
Перем threeStar Экспорт;

// twoStar - AnalyticsFeedbacksIncreaseItemTwoStar
&Сериализуемое("twoStar")
&Тип("AnalyticsFeedbacksIncreaseItemTwoStar")
Перем twoStar Экспорт;

// oneStar - AnalyticsFeedbacksIncreaseItemOneStar
&Сериализуемое("oneStar")
&Тип("AnalyticsFeedbacksIncreaseItemOneStar")
Перем oneStar Экспорт;

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

