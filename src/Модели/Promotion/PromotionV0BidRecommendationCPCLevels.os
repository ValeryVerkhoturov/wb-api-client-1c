#Использовать jason

// PromotionV0BidRecommendationCPCLevels
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// range1To2 - PromotionV0BidRecommendationBaseBid - Ставка для попадания в позиции 1-2
&Сериализуемое("range1To2")
&Тип("PromotionV0BidRecommendationBaseBid")
Перем range1To2 Экспорт;

// range3To10 - PromotionV0BidRecommendationBaseBid - Ставка для попадания в позиции 3-10
&Сериализуемое("range3To10")
&Тип("PromotionV0BidRecommendationBaseBid")
Перем range3To10 Экспорт;

// range11To34 - PromotionV0BidRecommendationBaseBid - Ставка для попадания в позиции 11-34
&Сериализуемое("range11To34")
&Тип("PromotionV0BidRecommendationBaseBid")
Перем range11To34 Экспорт;

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

