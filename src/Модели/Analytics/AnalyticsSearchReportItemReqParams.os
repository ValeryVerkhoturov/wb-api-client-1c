#Использовать jason

// AnalyticsSearchReportItemReqParams
//
// Параметры отчёта
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

// subjectId - Число - ID предмета. Используйте значение `0`, чтобы получить отчёт по всем предметам
&Сериализуемое("subjectId")
&Тип("Число")
Перем subjectId Экспорт;

// brandName - Строка - Бренд
&Сериализуемое("brandName")
&Тип("Строка")
Перем brandName Экспорт;

// tagId - Число - ID ярлыка. Чтобы получить отчёт по всем ярлыкам, укажите значение 0
&Сериализуемое("tagId")
&Тип("Число")
Перем tagId Экспорт;

// nmIds - Массив - Артикулы WB, по которым составить отчёт. Оставьте пустым, чтобы получить отчёт обо всех товарах
&Сериализуемое("nmIds")
&Тип("Массив")
&ДляКаждого
&Тип("Число")
Перем nmIds Экспорт;

// positionCluster - AnalyticsPositionCluster
&Сериализуемое("positionCluster")
&Тип("AnalyticsPositionCluster")
Перем positionCluster Экспорт;

// orderBy - AnalyticsOrderBy
&Сериализуемое("orderBy")
&Тип("AnalyticsOrderBy")
Перем orderBy Экспорт;

// includeSubstitutedSKUs - Булево - Показать данные по прямым запросам с [подменным артикулом](https://seller.wildberries.ru/help-center/article/A-524)
&Сериализуемое("includeSubstitutedSKUs")
&Тип("Булево")
Перем includeSubstitutedSKUs Экспорт;

// includeSearchTexts - Булево - Показать данные по поисковым запросам без учёта подменного артикула
&Сериализуемое("includeSearchTexts")
&Тип("Булево")
Перем includeSearchTexts Экспорт;

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

