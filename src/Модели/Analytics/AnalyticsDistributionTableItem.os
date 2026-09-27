#Использовать jason

// AnalyticsDistributionTableItem
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// nmId - Число - Артикул WB
&Сериализуемое("nmId")
&Тип("Число")
Перем nmId Экспорт;

// title - Строка - Название товара
&Сериализуемое("title")
&Тип("Строка")
Перем title Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// subjectId - Число - ID предмета
&Сериализуемое("subjectId")
&Тип("Число")
Перем subjectId Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// brandName - Строка - Бренд
&Сериализуемое("brandName")
&Тип("Строка")
Перем brandName Экспорт;

// tagName - Строка - Название ярлыка
&Сериализуемое("tagName")
&Тип("Строка")
Перем tagName Экспорт;

// tagId - Число - ID ярлыка
&Сериализуемое("tagId")
&Тип("Число")
Перем tagId Экспорт;

// pinnedFeedback - Булево - Отзыв закреплён
&Сериализуемое("pinnedFeedback")
&Тип("Булево")
Перем pinnedFeedback Экспорт;

// rating - Число - Рейтинг карточки товара
&Сериализуемое("rating")
&Тип("Число")
Перем rating Экспорт;

// feedbackRating - AnalyticsDistributionTableItemFeedbackRating
&Сериализуемое("feedbackRating")
&Тип("AnalyticsDistributionTableItemFeedbackRating")
Перем feedbackRating Экспорт;

// feedbackCount - AnalyticsDistributionTableItemFeedbackCount
&Сериализуемое("feedbackCount")
&Тип("AnalyticsDistributionTableItemFeedbackCount")
Перем feedbackCount Экспорт;

// fiveStar - AnalyticsDistributionTableItemFiveStar
&Сериализуемое("fiveStar")
&Тип("AnalyticsDistributionTableItemFiveStar")
Перем fiveStar Экспорт;

// fourStar - AnalyticsDistributionTableItemFourStar
&Сериализуемое("fourStar")
&Тип("AnalyticsDistributionTableItemFourStar")
Перем fourStar Экспорт;

// threeStar - AnalyticsDistributionTableItemThreeStar
&Сериализуемое("threeStar")
&Тип("AnalyticsDistributionTableItemThreeStar")
Перем threeStar Экспорт;

// twoStar - AnalyticsDistributionTableItemTwoStar
&Сериализуемое("twoStar")
&Тип("AnalyticsDistributionTableItemTwoStar")
Перем twoStar Экспорт;

// oneStar - AnalyticsDistributionTableItemOneStar
&Сериализуемое("oneStar")
&Тип("AnalyticsDistributionTableItemOneStar")
Перем oneStar Экспорт;

// disqualified - Число - Отзывы, исключённые из рейтинга
&Сериализуемое("disqualified")
&Тип("Число")
Перем disqualified Экспорт;

// isShadowed - Булево - Является ли товар скрытым из каталога: - `true` — товар скрыт из каталога - `false` — товар не скрыт из каталога
&Сериализуемое("isShadowed")
&Тип("Булево")
Перем isShadowed Экспорт;

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

