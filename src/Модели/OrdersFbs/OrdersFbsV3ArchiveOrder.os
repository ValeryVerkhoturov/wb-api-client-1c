#Использовать jason

// OrdersFbsV3ArchiveOrder
//
// Архивное сборочное задание
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// cargoType - Строка - Тип товара: - `mgt` — малогабаритный товар (МГТ) - `sgt` — сверхгабаритный товар (СГТ) - `kgtPlus` — крупногабаритный товар (КГТ+)
&Сериализуемое("cargoType")
&Тип("Строка")
Перем cargoType Экспорт;

// colorCode - Строка - Код цвета для колеруемых товаров
&Сериализуемое("colorCode")
&Тип("Строка")
Перем colorCode Экспорт;

// createdAt - Строка - Дата создания заказа
&Сериализуемое("createdAt")
&Тип("Строка")
Перем createdAt Экспорт;

// crossBorder - OrdersFbsV3ArchiveOrderCrossBorder
&Сериализуемое("crossBorder")
&Тип("OrdersFbsV3ArchiveOrderCrossBorder")
Перем crossBorder Экспорт;

// crossBorderType - Строка - Тип сборочного задания: - `local` — внутренняя поставка - `crossBorder` — трансграничная поставка
&Сериализуемое("crossBorderType")
&Тип("Строка")
Перем crossBorderType Экспорт;

// id - Число - ID сборочного задания
&Сериализуемое("id")
&Тип("Число")
Перем id Экспорт;

// isZeroOrder - Булево - Признак заказа товара с нулевым остатком: - `false` — заказ сделан на товар с ненулевым остатком - `true` — заказ сделан на товар с нулевым остатком
&Сериализуемое("isZeroOrder")
&Тип("Булево")
Перем isZeroOrder Экспорт;

// metaDetails - Массив - Детали маркировки
&Сериализуемое("metaDetails")
&Тип("Массив")
&ДляКаждого
&Тип("OrdersFbsV3ArchiveOrderMetaDetailsInner")
Перем metaDetails Экспорт;

// options - OrdersFbsV3ArchiveOrderOptions
&Сериализуемое("options")
&Тип("OrdersFbsV3ArchiveOrderOptions")
Перем options Экспорт;

// orderUid - Строка - ID транзакции для группировки сборочных заданий. Сборочные задания в одной корзине покупателя будут иметь одинаковый `orderUid`
&Сериализуемое("orderUid")
&Тип("Строка")
Перем orderUid Экспорт;

// priceInfo - OrdersFbsV3ArchiveOrderPriceInfo
&Сериализуемое("priceInfo")
&Тип("OrdersFbsV3ArchiveOrderPriceInfo")
Перем priceInfo Экспорт;

// product - OrdersFbsV3ArchiveOrderProduct
&Сериализуемое("product")
&Тип("OrdersFbsV3ArchiveOrderProduct")
Перем product Экспорт;

// rid - Строка - Уникальный ID заказа. Примечание: `rid` — это `srid` в ответах методов: - [Заявки покупателей на возврат](./customer-communication#tag/buyersReturns/operation/g…
&Сериализуемое("rid")
&Тип("Строка")
Перем rid Экспорт;

// scanPrice - Число - Цена приёмки заказа в копейках
&Сериализуемое("scanPrice")
&Тип("Число")
Перем scanPrice Экспорт;

// status - OrdersFbsV3ArchiveOrderStatus
&Сериализуемое("status")
&Тип("OrdersFbsV3ArchiveOrderStatus")
Перем status Экспорт;

// stickerId - Число - ID стикера
&Сериализуемое("stickerId")
&Тип("Число")
Перем stickerId Экспорт;

// supplyId - Строка - ID поставки
&Сериализуемое("supplyId")
&Тип("Строка")
Перем supplyId Экспорт;

// warehouseId - Число - ID склада продавца, с которого был отгружен товар
&Сериализуемое("warehouseId")
&Тип("Число")
Перем warehouseId Экспорт;

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

