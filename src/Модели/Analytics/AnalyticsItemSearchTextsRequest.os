#Использовать jason

// AnalyticsItemSearchTextsRequest
//
// Параметры для запроса по рейтингу поисковых запросов:
// - `currentPeriod` — текущий период
// - `pastPeriod` — предыдущий период для сравнения
//
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// currentPeriod - AnalyticsPeriod
&Сериализуемое("currentPeriod")
&Тип("AnalyticsPeriod")
Перем currentPeriod Экспорт;

// pastPeriod - AnalyticsPastPeriod
&Сериализуемое("pastPeriod")
&Тип("AnalyticsPastPeriod")
Перем pastPeriod Экспорт;

// nmIds - Массив - Список артикулов WB
&Сериализуемое("nmIds")
&Тип("Массив")
&ДляКаждого
&Тип("Число")
Перем nmIds Экспорт;

// topOrderBy - Строка - Фильтрация по поисковым запросам, по которым больше всего: - `openCard` — перешли в карточку - `addToCart` — добавили в корзину - `openToCart` — конверсия в кор…
&Сериализуемое("topOrderBy")
&Тип("Строка")
Перем topOrderBy Экспорт;

// includeSubstitutedSKUs - Булево - Показать данные по прямым запросам с [подменным артикулом](https://seller.wildberries.ru/help-center/article/A-524)
&Сериализуемое("includeSubstitutedSKUs")
&Тип("Булево")
Перем includeSubstitutedSKUs Экспорт;

// includeSearchTexts - Булево - Показать данные по поисковым запросам без учёта подменного артикула
&Сериализуемое("includeSearchTexts")
&Тип("Булево")
Перем includeSearchTexts Экспорт;

// orderBy - AnalyticsOrderByGrTe
&Сериализуемое("orderBy")
&Тип("AnalyticsOrderByGrTe")
Перем orderBy Экспорт;

// limit - AnalyticsTextLimit
&Сериализуемое("limit")
&Тип("AnalyticsTextLimit")
Перем limit Экспорт;

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

