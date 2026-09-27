#Использовать jason

// ItemsPostV2CardsUploadRequestInnerVariantsInner
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// brand - Строка - Бренд
&Сериализуемое("brand")
&Тип("Строка")
Перем brand Экспорт;

// title - Строка - Наименование товара
&Сериализуемое("title")
&Тип("Строка")
Перем title Экспорт;

// description - Строка - Описание товара. Максимальное количество символов зависит от категории товара Стандарт — 2000, минимум — 1000, максимум — 5000 Подробно о \\*\\*правилах заполне…
&Сериализуемое("description")
&Тип("Строка")
Перем description Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// kizMarked - Булево - Подтверждение, что на товар нанесён обязательный код маркировки [Честного знака](https://честныйзнак.рф/): - `true` — продавец подтверждает, что на товар нанесё…
&Сериализуемое("kizMarked")
&Тип("Булево")
Перем kizMarked Экспорт;

// wholesale - ItemsPostV2CardsUploadRequestInnerVariantsInnerWholesale
&Сериализуемое("wholesale")
&Тип("ItemsPostV2CardsUploadRequestInnerVariantsInnerWholesale")
Перем wholesale Экспорт;

// dimensions - ItemsPostV2CardsUploadRequestInnerVariantsInnerDimensions
&Сериализуемое("dimensions")
&Тип("ItemsPostV2CardsUploadRequestInnerVariantsInnerDimensions")
Перем dimensions Экспорт;

// sizes - Массив - Массив размеров. Если не указать для размерного товара (обувь, одежда и др.), сгенерируется автоматически с `techSize` = \"A\", `wbSize` = \"1\" и баркодом
&Сериализуемое("sizes")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2CardsUploadRequestInnerVariantsInnerSizesInner")
Перем sizes Экспорт;

// characteristics - Массив - Характеристики товара. Можно получить методом [Характеристики предмета](./item-management#tag/categoriesSubcategoriesAndCharacteristics/operation/getV2ObjectCha…
&Сериализуемое("characteristics")
&Тип("Массив")
&ДляКаждого
&Тип("ItemsPostV2CardsUpdateRequestInnerCharacteristicsInner")
Перем characteristics Экспорт;

// documents - ItemsPostV2CardsUploadRequestInnerVariantsInnerDocuments
&Сериализуемое("documents")
&Тип("ItemsPostV2CardsUploadRequestInnerVariantsInnerDocuments")
Перем documents Экспорт;

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

