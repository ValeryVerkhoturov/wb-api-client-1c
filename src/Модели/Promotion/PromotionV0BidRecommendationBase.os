#Использовать jason

// PromotionV0BidRecommendationBase
//
// Рекомендуемые ставки для карточек товаров
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// competitiveBid - PromotionV0BidRecommendationBaseBidCompetitiveBid
&Сериализуемое("competitiveBid")
&Тип("PromotionV0BidRecommendationBaseBidCompetitiveBid")
Перем competitiveBid Экспорт;

// leadersBid - PromotionV0BidRecommendationBaseBidLeadersBid
&Сериализуемое("leadersBid")
&Тип("PromotionV0BidRecommendationBaseBidLeadersBid")
Перем leadersBid Экспорт;

// top2 - PromotionV0BidRecommendationBaseBidTop2
&Сериализуемое("top2")
&Тип("PromotionV0BidRecommendationBaseBidTop2")
Перем top2 Экспорт;

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

