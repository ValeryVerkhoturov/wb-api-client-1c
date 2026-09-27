#Использовать jason

// ItemsPostV2GetCardsListResponse200CardsInnerDocuments
//
// Документы
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// items - Массив - Список документов
&Сериализуемое("items")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerDocumentsItemsInner")
Перем items Экспорт;

// overallVerdict - ItemsPostV2GetCardsListResponse200CardsInnerDocumentsOverallVerdict
&Сериализуемое("overallVerdict")
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerDocumentsOverallVerdict")
Перем overallVerdict Экспорт;

// excludeDocuments - Булево - Исключены ли документы из проверки карточки товара: - `true` — да, документы не проверяются при проверке карточки - `false` — нет, документы проверяются при про…
&Сериализуемое("excludeDocuments")
&Тип("Булево")
Перем excludeDocuments Экспорт;

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

