#Использовать jason

// ItemsPostV2GetCardsListResponse200CardsInner
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// nmID - Число - Артикул WB
&Сериализуемое("nmID")
&Тип("Число")
Перем nmID Экспорт;

// imtID - Число - ID для [объединённых](https://dev.wildberries.ru/knowledge-base/articles/019d49a4-1320-71bb-9dac-8ba07e7177ce/rabota-s-tovarami#obuedinenie-i-razuedinenie-karto…
&Сериализуемое("imtID")
&Тип("Число")
Перем imtID Экспорт;

// nmUUID - Строка - Внутренний технический ID карточки товара
&Сериализуемое("nmUUID")
&Тип("Строка")
Перем nmUUID Экспорт;

// subjectID - Число - ID предмета
&Сериализуемое("subjectID")
&Тип("Число")
Перем subjectID Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// brand - Строка - Бренд
&Сериализуемое("brand")
&Тип("Строка")
Перем brand Экспорт;

// title - Строка - Наименование товара
&Сериализуемое("title")
&Тип("Строка")
Перем title Экспорт;

// description - Строка - Описание товара
&Сериализуемое("description")
&Тип("Строка")
Перем description Экспорт;

// needKiz - Булево - Требуется ли код маркировки [Честного знака](https://честныйзнак.рф/) для этого товара: - `false` — не требуется - `true` — требуется
&Сериализуемое("needKiz")
&Тип("Булево")
Перем needKiz Экспорт;

// kizMarked - Булево - Есть ли подтверждение от продавца, что обязательный код маркировки [Честного знака](https://честныйзнак.рф/) нанесён на товар: - `true` — да - `false` — нет Явл…
&Сериализуемое("kizMarked")
&Тип("Булево")
Перем kizMarked Экспорт;

// photos - Массив - Массив фото
&Сериализуемое("photos")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerPhotosInner")
Перем photos Экспорт;

// video - Строка - URL видео
&Сериализуемое("video")
&Тип("Строка")
Перем video Экспорт;

// wholesale - ItemsPostV2GetCardsListResponse200CardsInnerWholesale
&Сериализуемое("wholesale")
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerWholesale")
Перем wholesale Экспорт;

// dimensions - ItemsPostV2GetCardsListResponse200CardsInnerDimensions
&Сериализуемое("dimensions")
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerDimensions")
Перем dimensions Экспорт;

// documents - ItemsPostV2GetCardsListResponse200CardsInnerDocuments
&Сериализуемое("documents")
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerDocuments")
Перем documents Экспорт;

// characteristics - Массив - Характеристики
&Сериализуемое("characteristics")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerCharacteristicsInner")
Перем characteristics Экспорт;

// sizes - Массив - Размеры товара
&Сериализуемое("sizes")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerSizesInner")
Перем sizes Экспорт;

// tags - Массив - Ярлыки
&Сериализуемое("tags")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerTagsInner")
Перем tags Экспорт;

// createdAt - Строка - Дата и время создания
&Сериализуемое("createdAt")
&Тип("Строка")
Перем createdAt Экспорт;

// updatedAt - Строка - Дата и время изменения
&Сериализуемое("updatedAt")
&Тип("Строка")
Перем updatedAt Экспорт;

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

