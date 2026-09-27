#Использовать jason

// RatesModelsWarehouseBoxRates
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// boxDeliveryBase - Строка - Логистика, первый литр, ₽
&Сериализуемое("boxDeliveryBase")
&Тип("Строка")
Перем boxDeliveryBase Экспорт;

// boxDeliveryCoefExpr - Строка - Коэффициент **Логистика**, %. На него умножается стоимость логистики. Уже учтён в тарифах
&Сериализуемое("boxDeliveryCoefExpr")
&Тип("Строка")
Перем boxDeliveryCoefExpr Экспорт;

// boxDeliveryLiter - Строка - Логистика, дополнительный литр, ₽
&Сериализуемое("boxDeliveryLiter")
&Тип("Строка")
Перем boxDeliveryLiter Экспорт;

// boxDeliveryMarketplaceBase - Строка - Логистика FBS, первый литр, ₽
&Сериализуемое("boxDeliveryMarketplaceBase")
&Тип("Строка")
Перем boxDeliveryMarketplaceBase Экспорт;

// boxDeliveryMarketplaceCoefExpr - Строка - Коэффициент **FBS**, %. На него умножается стоимость логистики FBS. Уже учтён в тарифах
&Сериализуемое("boxDeliveryMarketplaceCoefExpr")
&Тип("Строка")
Перем boxDeliveryMarketplaceCoefExpr Экспорт;

// boxDeliveryMarketplaceLiter - Строка - Логистика FBS, дополнительный литр, ₽
&Сериализуемое("boxDeliveryMarketplaceLiter")
&Тип("Строка")
Перем boxDeliveryMarketplaceLiter Экспорт;

// boxStorageBase - Строка - Хранение в день, первый литр, ₽
&Сериализуемое("boxStorageBase")
&Тип("Строка")
Перем boxStorageBase Экспорт;

// boxStorageCoefExpr - Строка - Коэффициент **Хранение**, %. На него умножается стоимость хранения в день. Уже учтён в тарифах
&Сериализуемое("boxStorageCoefExpr")
&Тип("Строка")
Перем boxStorageCoefExpr Экспорт;

// boxStorageLiter - Строка - Хранение в день, дополнительный литр, ₽
&Сериализуемое("boxStorageLiter")
&Тип("Строка")
Перем boxStorageLiter Экспорт;

// geoName - Строка - Местонахождение склада
&Сериализуемое("geoName")
&Тип("Строка")
Перем geoName Экспорт;

// warehouseName - Строка - Название склада
&Сериализуемое("warehouseName")
&Тип("Строка")
Перем warehouseName Экспорт;

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

