#Использовать jason

// ItemsPostV2GetCardsTrashResponse200CardsInner
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

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// kizMarked - Булево - Есть ли подтверждение от продавца, что обязательный код маркировки [Честного знака](https://честныйзнак.рф/) нанесён на товар: - `true` — да - `false` — нет Что…
&Сериализуемое("kizMarked")
&Тип("Булево")
Перем kizMarked Экспорт;

// subjectID - Число - ID предмета
&Сериализуемое("subjectID")
&Тип("Число")
Перем subjectID Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

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

// sizes - Массив - Массив размеров
&Сериализуемое("sizes")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsTrashResponse200CardsInnerSizesInner")
Перем sizes Экспорт;

// dimensions - ItemsPostV2GetCardsListResponse200CardsInnerDimensions
&Сериализуемое("dimensions")
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerDimensions")
Перем dimensions Экспорт;

// characteristics - Массив - Характеристики
&Сериализуемое("characteristics")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2GetCardsListResponse200CardsInnerCharacteristicsInner")
Перем characteristics Экспорт;

// createdAt - Строка - Date and time the item was listed
&Сериализуемое("createdAt")
&Тип("Строка")
Перем createdAt Экспорт;

// trashedAt - Строка - Дата и время помещения в корзину
&Сериализуемое("trashedAt")
&Тип("Строка")
Перем trashedAt Экспорт;

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

