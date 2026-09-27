#Использовать jason

// PromotionV0BidRecommendationNormQuery
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// normQuery - Строка - Поисковый кластер
&Сериализуемое("normQuery")
&Тип("Строка")
Перем normQuery Экспорт;

// reachMax - PromotionV0BidRecommendationReachMax
&Сериализуемое("reachMax")
&Тип("PromotionV0BidRecommendationReachMax")
Перем reachMax Экспорт;

// reachMedium - PromotionV0BidRecommendationReachMedium
&Сериализуемое("reachMedium")
&Тип("PromotionV0BidRecommendationReachMedium")
Перем reachMedium Экспорт;

// reachMin - PromotionV0BidRecommendationReachMin
&Сериализуемое("reachMin")
&Тип("PromotionV0BidRecommendationReachMin")
Перем reachMin Экспорт;

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

