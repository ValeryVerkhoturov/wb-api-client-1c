// OrdersFbsApi
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Пример:
//   Настройки = Новый Конфигурация();
//   Настройки.УстановитьТокен("...");
//   Клиент = Новый OrdersFbsApi(Настройки);

Перем Настройки Экспорт;
Перем Транспорт Экспорт;

Процедура ПриСозданииОбъекта(Знач ВходящиеНастройки)
	Настройки = ВходящиеНастройки;
	Транспорт = Новый ТранспортHTTP(Настройки);
КонецПроцедуры

// Удалить идентификаторы маркировки сборочного задания
//
// Метод удаляет значение [идентификаторов маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) для переданного ключа.
//
// Возможные идентификаторы маркировки:
// - `imei` — [IMEI](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaImei)
// - `uin` — [УИН](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaUin)
// - `gtin` — [GTIN](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaGtin)
// - `sgtin` — [код маркировки Честного знака](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaSgtin)
// - `customsDeclaration` — [номер ДТ](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaCustomsDeclaration)
// Можно передать только один ключ.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **получения и удаления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/delete-api-v3-orders-orderid-meta
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   key - Строка - Название идентификаторов маркировки для удаления. Передаётся только одно значение.
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция DeleteV3OrdersOrderIdMeta(Знач orderId, Знач key) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("key", key);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"DELETE",
		СтрШаблон("/api/v3/orders/%1/meta", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Удалить пропуск
//
// Метод удаляет пропуск продавца [из списка](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsPasses/operation/getV3Passes).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/delete-api-v3-passes-passid
//
// Параметры:
//   passId - Число - ID пропуска
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция DeleteV3PassesPassId(Знач passId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"DELETE",
		СтрШаблон("/api/v3/passes/%1", Транспорт.ЭкранироватьСегмент(passId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Удалить поставку
//
// Метод удаляет [поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId), если она активна и за ней не закреплено ни одно [сборочное задание](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/delete-api-v3-supplies-supplyid
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция DeleteV3SuppliesSupplyId(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"DELETE",
		СтрШаблон("/api/v3/supplies/%1", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Удалить грузоместа из поставки
//
// Метод удаляет грузоместа из поставки.
//
// Можно удалить только пока поставка на сборке.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/delete-api-v3-supplies-supplyid-trbx
//
// Параметры:
//   supplyId - Строка - ID поставки
//   Тело - OrdersFbsDeleteV3SuppliesSupplyIdTrbxRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция DeleteV3SuppliesSupplyIdTrbx(Знач supplyId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"DELETE",
		СтрШаблон("/api/v3/supplies/%1/trbx", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список стран ОКСМ
//
// Метод возвращает список стран ОКСМ — Общероссийского классификатора стран мира — с полными названиями и кодами.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-dictionaries-countries-oksm
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsDictionariesCountriesOksm() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/marketplace/v3/fbs/dictionaries/countries/oksm",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список архивных сборочных заданий
//
// Метод возвращает сборочные задания, созданные более 3 месяцев назад.
// Часть сборочных заданий попадает в архив позже, чем через 3 месяца после создания, так как поставка переходит в архив только после того, как все заказы в ней будут завершены.
// Например, так происходит, если продавец не доставил один из заказов в поставке и заказ был отменён автоматически через несколько дней.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-orders-archive
//
// Параметры:
//   year - Число - Год создания заказа
//   month - Число - Месяц создания заказа
//   next - Число - Параметр пагинации. Устанавливает значение, с которого надо получить следующий пакет данных. Для получения полного списка данных должен быть равен `0` в первом…
//   limit - Число - Количество сборочных заданий в ответе
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsOrdersArchive(Знач year, Знач month, Знач next, Знач limit) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("year", year);
	ПараметрыЗапроса.Вставить("month", month);
	ПараметрыЗапроса.Вставить("next", next);
	ПараметрыЗапроса.Вставить("limit", limit);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/marketplace/v3/fbs/orders/archive",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить настройки автовозврата продавца
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод возвращает информацию о настройках автовозврата, установленных продавцом.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-settings-autoreturns
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsSettingsAutoreturns() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/marketplace/v3/fbs/settings/autoreturns",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить предметы, которые не хранятся на складах WB
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод возвращает список ID предметов, товары которых не могут храниться на складах WB и будут возвращены в ПВЗ автоматически.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-settings-autoreturns-subcategories-restricted
//
// Параметры:
//   next - Число - Параметр пагинации. Устанавливает значение, с которого надо получить следующий пакет данных. Для получения полного списка данных должен быть равен `0` в первом…
//   limit - Число - Количество предметов в ответе
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsSettingsAutoreturnsSubcategoriesRestricted(Знач next, Знач limit) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("next", next);
	ПараметрыЗапроса.Вставить("limit", limit);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/marketplace/v3/fbs/settings/autoreturns/subcategories/restricted",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список пунктов отгрузки поставок
//
// Метод возвращает доступные пункты отгрузки поставок с фильтрами:
// - по населённым пунктам России
// - по типам товаров, которые принимает пункт отгрузки
// Используйте данные из этого метода, чтобы устанавливать [параметры отгрузки поставок](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3FbsSuppliesShippingMethod).
//
// Доступно только для продавцов из РФ.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-shipping-points
//
// Параметры:
//   city - Строка - Населённый пункт отгрузки поставки, кириллица
//   cargoType - Число - Тип товара, который принимает пункт отгрузки: - `1` — малогабаритный товар (МГТ) - `2` — сверхгабаритный товар (СГТ) - `3` — крупногабаритный товар (КГТ+)
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsShippingPoints(Знач city, Знач cargoType) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("city", city);
	ПараметрыЗапроса.Вставить("cargoType", cargoType);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/marketplace/v3/fbs/shipping-points",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить QR-код СПОТ
//
// Метод возвращает сформированный QR-код СПОТ для поставки в формате PNG, кодировка base64.
// Вы можете получить QR-код, когда в методе [получения данных СПОТ](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/postV3FbsSuppliesSpotList) будет признак `\"status\":\"completed\"`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-fbs-supplies-supplyid-stickers-spot
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3FbsSuppliesSupplyIdStickersSpot(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/marketplace/v3/fbs/supplies/%1/stickers/spot", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить информацию о сборочных заданиях
//
// Метод возвращает информацию о сборочных заданиях, созданных не более 3 месяцев назад, без их актуального [статуса](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus).
// Чтобы получить данные за период, укажите в запросе даты начала и окончания периода. Максимум 30 календарных дней одним запросом.
// В ответе метода будут сборочные задания, созданные в указанный период.
//
// Чтобы получить сборочные задания, созданные более 3 месяцев назад, используйте метод получения [списка архивных заказов](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3FbsOrdersArchive).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-orders
//
// Параметры:
//   limit - Число - Параметр пагинации. Устанавливает предельное количество возвращаемых данных.
//   next - Число - Параметр пагинации. Устанавливает значение, с которого надо получить следующий пакет данных. Для получения полного списка данных должен быть равен `0` в первом…
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * dateFrom - Число - Дата начала периода в формате Unix timestamp. По умолчанию — дата за 30 дней до запроса. Часовой пояс — UTC
//    * dateTo - Число - Дата конца периода в формате Unix timestamp. Часовой пояс — UTC
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3Orders(Знач limit, Знач next, Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("limit", limit);
	ПараметрыЗапроса.Вставить("next", next);
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/orders",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список новых сборочных заданий
//
// Метод возвращает список всех новых [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders), которые есть у продавца на момент запроса.
//
// Наличие в сборочных заданиях идентификаторов маркировки, указанных в полях `requiredMeta` и `optionalMeta`, влияет только на возможность перевести поставку в доставку. Если ваш товар подлежит обязательной [маркировке](https://seller.wildberries.ru/instructions/ru/ru/material/items-labeling-in-fbs) средствами
// идентификации, необходимо указывать идентификаторы маркировки независимо от того, в каком поле они были получены (п. 4.6 [Оферты](https://seller.wildberries.ru/confirm-offer-condition/product/view)).
//
// Рекомендуем добавлять в сборочные задания все идентификаторы маркировки, полученные в полях `requiredMeta` и `optionalMeta`
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-orders-new
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3OrdersNew() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/orders/new",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список пропусков
//
// Метод возвращает список всех [созданных](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsPasses/operation/postV3Passes) пропусков продавца.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-passes
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3Passes() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/passes",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список складов, для которых требуется пропуск
//
// Метод возвращает список складов для привязки к [пропуску продавца](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsPasses/operation/getV3Passes).
//
// Данные, которые возвращает метод, могут меняться. Рекомендуем периодически синхронизировать список
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-passes-offices
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3PassesOffices() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/passes/offices",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список поставок
//
// Метод возвращает список [поставок](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-supplies
//
// Параметры:
//   limit - Число - Параметр пагинации. Устанавливает предельное количество возвращаемых данных.
//   next - Число - Параметр пагинации. Устанавливает значение, с которого надо получить следующий пакет данных. Для получения полного списка данных должен быть равен `0` в первом…
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3Supplies(Знач limit, Знач next) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("limit", limit);
	ПараметрыЗапроса.Вставить("next", next);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/supplies",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить все сборочные задания для повторной отгрузки
//
// Метод возвращает все [сборочные задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders), требующие повторной отгрузки.
//
// Повторная отгрузка требуется, если поставка была отсканирована в пункте приёмки, но при этом в ней всё ещё есть неотсканированные товары. Спустя определённое время необходимо доставить эти товары заново. Данные сборочные задания можно перевести в [другую активную поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3SuppliesSupplyIdOrders).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-supplies-orders-reshipment
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3SuppliesOrdersReshipment() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/supplies/orders/reshipment",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить информацию о поставке
//
// Метод возвращает подробную информацию о поставке.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-supplies-supplyid
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3SuppliesSupplyId(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/v3/supplies/%1", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить QR-код поставки
//
// Метод возвращает QR-код [поставки](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId) в форматах:
// - SVG
// - ZPLV (вертикальный)
// - ZPLH (горизонтальный)
// - PNG
// QR-код поставки можно получить, только если поставка [передана в доставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3SuppliesSupplyIdDeliver).
//
// Размер — 580x400 px.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-supplies-supplyid-barcode
//
// Параметры:
//   supplyId - Строка - ID поставки
//   type - Строка - Тип стикера
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3SuppliesSupplyIdBarcode(Знач supplyId, Знач type) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("type", type);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/v3/supplies/%1/barcode", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить ID сборочных заданий поставки
//
// Метод возвращает список ID сборочных заданий, закреплённых за поставкой.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-marketplace-v3-supplies-supplyid-order-ids
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3SuppliesSupplyIdOrderIds(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/marketplace/v3/supplies/%1/order-ids", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список грузомест поставки
//
// Возвращает список грузомест поставки.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/get-api-v3-supplies-supplyid-trbx
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3SuppliesSupplyIdTrbx(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/v3/supplies/%1/trbx", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Обновить настройки автовозврата продавца
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод устанавливает настройки автовозврата продавца для малогабаритных товаров — `\"cargoType\":1`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-marketplace-v3-fbs-settings-autoreturns
//
// Параметры:
//   Тело - OrdersFbsPatchV3FbsSettingsAutoreturnsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3FbsSettingsAutoreturns(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		"/api/marketplace/v3/fbs/settings/autoreturns",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Обновить настройки автовозврата товаров
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод устанавливает настройки автовозврата малогабаритных товаров — `\"cargoType\":1`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-marketplace-v3-fbs-settings-autoreturns-items
//
// Параметры:
//   Тело - OrdersFbsPatchV3FbsSettingsAutoreturnsItemsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3FbsSettingsAutoreturnsItems(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		"/api/marketplace/v3/fbs/settings/autoreturns/items",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Установить параметры отгрузки поставок
//
// Метод устанавливает способ доставки, дату и пункт отгрузки у поставок.
//
// Параметры отгрузки нужно указать до передачи поставки в доставку. Вы можете обновлять параметры отгрузки до сканирования поставки и её коробов в пункте отгрузки. Когда поставка будет отсканирована, метод начнёт возвращать ошибку `409`.
//
// В запросе можно указать максимум 100 поставок. Результат обработки возвращается для каждой поставки отдельно.
//
// Доступно только для продавцов из РФ.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-marketplace-v3-fbs-supplies-shipping-method
//
// Параметры:
//   Тело - OrdersFbsPatchV3FbsSuppliesShippingMethodRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3FbsSuppliesShippingMethod(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		"/api/marketplace/v3/fbs/supplies/shipping-method",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Отменить сборочное задание
//
// Метод отменяет [сборочное задание](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) и переводит в [статус](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `cancel` — отменено продавцом.
//
// Сборочное задание можно отменить до его передачи Wildberries.
// Чтобы проверить, можно ли отменить сборочное задание, используйте метод [POST /api/v3/orders/status](https://dev.wildberries.ru/docs/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus), поле `isCancellable`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 100 запросов | 600 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-v3-orders-orderid-cancel
//
// Параметры:
//   orderId - Число - ID сборочного задания
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3OrdersOrderIdCancel(Знач orderId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		СтрШаблон("/api/v3/orders/%1/cancel", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Передать поставку в доставку
//
// Метод закрывает [поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId) и переводит все [сборочные задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) в ней в [статус](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `complete` — в доставке. После закрытия поставки добавить новые сборочные задания к ней нельзя.
//
// Если поставка не была передана в доставку, то при приёмке первого товара поставка автоматически закроется.
//
// Передать поставку в доставку можно, только если в ней:
// - есть хотя бы одно сборочное задание
// - для всех сборочных заданий указана обязательная маркировка
// - маркировка всех сборочных заданий прошла проверку
// Если поставка содержит сборочные задания с обязательным УИН, убедитесь, что вы заранее создали и загрузили спецификацию с договором на доставку. [ГИИС ДМДК](https://minfin.gov.ru/ru/perfomance/jewels/dmdk) требуется около 30 минут для обработки изменений в статусах УИН.
// Обязательно [указывайте параметры отгрузки](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3FbsSuppliesShippingMethod) для поставок от продавцов РФ на пункты отгрузки в РФ. Если способ доставки, дата или пункт отгрузки не указаны, возвращается ошибка `409`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-v3-supplies-supplyid-deliver
//
// Параметры:
//   supplyId - Строка - ID поставки
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3SuppliesSupplyIdDeliver(Знач supplyId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		СтрШаблон("/api/v3/supplies/%1/deliver", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Добавить сборочные задания к поставке
//
// Метод добавляет до 100 [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) к поставке и переводит их в [статус](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` — на сборке.
// Может перемещать сборочные задания:
// - между активными поставками
// - из закрытой поставки в активную, если сборочные задания требуют [повторной отгрузки](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3SuppliesOrdersReshipment)
//
// В пустую поставку можно добавить сборочные задания любого габаритного типа. Поставка приобретает габаритный тип первого добавленного сборочного задания [из поля](./orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId) `cargoType`.
//
// После этого в поставку можно добавить сборочные задания только того же габаритного типа, что и у поставки.
//
// В поставку нельзя добавить сборочные задания, поступившие на разные склады.
//
// В пустую поставку можно добавить сборочные задания трансграничных или внутренних поставок.
// После этого поставка приобретает тип первого добавленного сборочного задания из поля `crossBorderType`.
// Далее в неё можно добавить только сборочные задания такого же типа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/patch-api-marketplace-v3-supplies-supplyid-orders
//
// Параметры:
//   supplyId - Строка - ID поставки
//   Тело - OrdersFbsPatchV3SuppliesSupplyIdOrdersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PatchV3SuppliesSupplyIdOrders(Знач supplyId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PATCH",
		СтрШаблон("/api/marketplace/v3/supplies/%1/orders", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить настройки автовозврата товаров
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод возвращает настройки автовозврата товаров.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-marketplace-v3-fbs-settings-autoreturns-items
//
// Параметры:
//   Тело - OrdersFbsPostV3FbsSettingsAutoreturnsItemsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3FbsSettingsAutoreturnsItems(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/fbs/settings/autoreturns/items",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить данные СПОТ для списка поставок
//
// Метод возвращает данные СПОТ для списка поставок.
//
// Вы можете получить данные СПОТ, только если выполняются все условия:
// - поставка находится на этапе доставки
// - продавец зарегистрирован в любой стране ЕАЭС кроме РФ
// - склад назначения находится в РФ
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-marketplace-v3-fbs-supplies-spot-list
//
// Параметры:
//   Тело - OrdersFbsPostV3FbsSuppliesSpotListRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3FbsSuppliesSpotList(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/fbs/supplies/spot/list",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Заказы с информацией по клиенту
//
// Метод позволяет получать информацию о покупателе по ID сборочного задания.
// Только для трансграничных поставок из \\*\\*Турции\\*\\*.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-orders-client
//
// Параметры:
//   Тело - OrdersFbsOrdersRequestAPI
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersClient(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/orders/client",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить идентификаторы маркировки сборочных заданий
//
// Метод возвращает идентификаторы маркировки [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) и статусы их проверки.
//
// Перечень идентификаторов маркировки, доступных для сборочного задания, можно получить в [списке новых сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3OrdersNew), поля `requiredMeta` и `optionalMeta`. Если поля `requiredMeta` и `optionalMeta` не содержат какой-либо идентификатор маркировки, значит, у сборочного задания не может быть этого идентификатора — и добавить его нельзя.
// Возможные идентификаторы маркировки:
// - `imei` — [IMEI](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaImei)
// - `uin` — [УИН](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaUin)
// - `gtin` — [GTIN](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaGtin)
// - `sgtin` — [код маркировки Честного знака](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaSgtin)
// - `expiration` — [срок годности товара](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaExpiration)
// - `customsDeclaration` — [номер ДТ](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaCustomsDeclaration)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **получения и удаления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-marketplace-v3-orders-meta
//
// Параметры:
//   Тело - OrdersFbsV3GetMetaMultiRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersMeta(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/orders/meta",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить статусы сборочных заданий
//
// Метод возвращает статусы [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) по их ID.
//
// `supplierStatus` — статус сборочного задания. Триггер его изменения — действие самого продавца.
// Возможные значения `supplierStatus`:
// | Статус | Описание | Как перевести сборочное задание в данный статус |
// |-------|----------------------|--------------------------------------|
// | `new` | \\*\\*Новое сборочное задание\\*\\* | |
// | `confirm` | \\*\\*На сборке\\*\\* |[Добавить сборочное задание к поставке](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3SuppliesSupplyIdOrders)
// | `complete` | \\*\\*В доставке\\*\\* | [Передать поставку в доставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/patchV3SuppliesSupplyIdDeliver) |
// | `cancel` | \\*\\*Отменено продавцом\\*\\* | [Отменить сборочное задание](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/patchV3OrdersOrderIdCancel)|
// | `cancel\\_carrier` | \\*\\*Отменено перевозчиком\\*\\*
// Только для трансграничных поставок | Переводится перевозчиком |
//
// `wbStatus` — статус системы Wildberries.
// Возможные значения `wbStatus`:
// - `waiting` — сборочное задание в работе
// - `sorted` — сборочное задание отсортировано
// - `sold` — заказ получен покупателем
// - `canceled` — отмена сборочного задания
// - `canceled\\_by\\_client` — покупатель отменил заказ при получении
// - `declined\\_by\\_client` — покупатель отменил заказ. Отмена доступна покупателю в первый час с момента заказа, если заказ не переведён на сборку
// - `defect` — отмена заказа по причине брака
// - `ready\\_for\\_pickup` — заказ прибыл на пункт выдачи заказов (ПВЗ)
// - `accepted\\_by\\_carrier` — продавец передал заказ в службу доставки в своей стране
// - `sent\\_to\\_carrier` — заказ отправлен на склад службы доставки в стране продавца
// - `canceled\\_by\\_carrier` — заказ отменён перевозчиком. Только для трансграничных поставок
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-orders-status
//
// Параметры:
//   Тело - OrdersFbsPostV3OrdersStatusRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersStatus(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/orders/status",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// История статусов для сборочных заданий трансграничных поставок
//
// Метод возвращает историю [статусов](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) для [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) трансграничных поставок.
// В песочнице этот метод всегда возвращает ответ `200`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-orders-status-history
//
// Параметры:
//   Тело - OrdersFbsPostV3OrdersStatusHistoryRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersStatusHistory(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/orders/status/history",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить стикеры сборочных заданий
//
// Метод возвращает список стикеров для [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders) в [статусах](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` — на сборке и `complete` — в доставке.
//
// Если за сборочным заданием не закреплён обязательный [номер декларации на товары (ДТ)](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/putV3OrdersOrderIdMetaCustomsDeclaration), получить стикеры для этого сборочного задания невозможно.
//
// За один запрос можно получить максимум 100 стикеров.
// Можно получить стикер в форматах:
// - SVG
// - ZPLV (вертикальный)
// - ZPLH (горизонтальный)
// - PNG
// Доступны размеры:
// - 580x400 px при `width=58&height=40` в запросе
// - 400x300 px при `width=40&height=30` в запросе
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-orders-stickers
//
// Параметры:
//   type - Строка - Тип стикера
//   width - Число - Ширина стикера
//   height - Число - Высота стикера
//   Тело - OrdersFbsPostV3OrdersStickersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersStickers(Знач type, Знач width, Знач height, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("type", type);
	ПараметрыЗапроса.Вставить("width", width);
	ПараметрыЗапроса.Вставить("height", height);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/orders/stickers",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить стикеры сборочных заданий трансграничных поставок
//
// Метод возвращает список стикеров [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) трансграничных поставок в формате PDF.
//
// Для каждого сборочного задания в ответе указывается статус генерации стикера:
// - `awaitingTrackNumber` — стикер не готов. Ожидается трек-номер от перевозчика.
// - `ready` — стикер готов
//
// Стикер может генерироваться с задержкой. Повторяйте запрос, пока не получите статус `ready`.
//
// Ограничения:
// - За один запрос можно получить максимум 100 стикеров.
// - Можно получить стикеры только для сборочных заданий, находящихся на сборке или в доставке — [статусы](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm`, `complete`.
// В песочнице этот метод всегда возвращает ответ `200`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-orders-stickers-cross-border
//
// Параметры:
//   Тело - OrdersFbsPostV3OrdersStickersCrossBorderRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3OrdersStickersCrossBorder(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/orders/stickers/cross-border",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Создать пропуск
//
// Метод создаёт [пропуск продавца](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsPasses/operation/getV3Passes) с привязкой к складу WB.
// Пропуск действует 48 часов со времени создания.
//
// Максимум 1 запрос в 10 [минут](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца.
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-passes
//
// Параметры:
//   Тело - OrdersFbsPostV3PassesRequest - Общая длина ФИО ограничена от 6 до 100 символов. В номере машины могут быть только буквы и цифры
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3Passes(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/passes",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Создать новую поставку
//
// Метод создаёт новую [поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId).
// Ограничения:
// - Только для [сборочных заданий](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) по модели FBS.
// - При добавлении в поставку все передаваемые сборочные задания в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `new` будут автоматически переведены в статус `confirm` — на сборке.
// - Если вы переведёте сборочное задание в статус `cancel` — отмена продавцом, прикрепленное сборочное задание автоматически удалится из поставки.
// - Поставку можно собрать только из сборочных заданий (заказов) одного габаритного типа `cargoType`. Новая поставка не обладает габаритным признаком, она приобретает габаритный признак первого заказа, добавленного в поставку.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-supplies
//
// Параметры:
//   Тело - OrdersFbsPostV3SuppliesRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3Supplies(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/supplies",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Добавить грузоместа к поставке
//
// Метод добавляет требуемое количество [грузомест](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyIdTrbx) в [поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId).
//
// Грузоместа необходимо добавлять только в поставки, отгружаемые на ПВЗ.
//
// Грузоместа можно добавить только в открытую поставку. В одном грузоместе может быть несколько заказов. Например, если в поставке 10 заказов, распределите их по коробам: система позволит создать не больше 5 грузомест. Для 20 заказов — не больше 10 грузомест, для 100 — не больше 50.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-supplies-supplyid-trbx
//
// Параметры:
//   supplyId - Строка - ID поставки
//   Тело - OrdersFbsPostV3SuppliesSupplyIdTrbxRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3SuppliesSupplyIdTrbx(Знач supplyId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		СтрШаблон("/api/v3/supplies/%1/trbx", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить стикеры грузомест поставки
//
// Метод возвращает QR-стикеры в форматах:
// - SVG
// - ZPLV (вертикальный)
// - ZPLH (горизонтальный)
// - PNG
//
// Размер стикеров — 580x400 px.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/post-api-v3-supplies-supplyid-trbx-stickers
//
// Параметры:
//   supplyId - Строка - ID поставки
//   type - Строка - Тип стикера
//   Тело - OrdersFbsPostV3SuppliesSupplyIdTrbxStickersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3SuppliesSupplyIdTrbxStickers(Знач supplyId, Знач type, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("type", type);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		СтрШаблон("/api/v3/supplies/%1/trbx/stickers", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Добавить данные СПОТ в поставку
//
// Метод добавляет данные СПОТ в поставку.
//
// СПОТ можно добавить только в [поставку](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsSupplies/operation/getV3SuppliesSupplyId) с признаком `\"spotAvailable\":true`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-marketplace-v3-fbs-supplies-supplyid-spot
//
// Параметры:
//   supplyId - Строка - ID поставки
//   Тело - OrdersFbsPutV3FbsSuppliesSupplyIdSpotRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3FbsSuppliesSupplyIdSpot(Знач supplyId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/marketplace/v3/fbs/supplies/%1/spot", Транспорт.ЭкранироватьСегмент(supplyId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить номер ДТ за сборочным заданием
//
// Метод обновляет номер ДТ — декларации на товары — в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta). У одного сборочного задания может быть только один номер ДТ.
// Закрепить номер ДТ можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `customsDeclaration`.
//
// Продавцам из Армении необходимо обязательно указывать номер декларации на товары (ДТ), произведённые вне ЕАЭС, если заказ из Армении доставляется в РФ.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-marketplace-v3-orders-orderid-meta-customs-declaration
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaCustomsDeclarationRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaCustomsDeclaration(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/marketplace/v3/orders/%1/meta/customs-declaration", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить за сборочным заданием срок годности товара
//
// Метод закрепляет за [сборочным заданием](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders) срок годности товара. Товар годен до указанной даты.
// Закрепить срок годности можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `expiration`.
//
// Получить загруженные данные можно в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta).
// Чтобы изменить срок годности, отправьте запрос с новой датой. Удалить срок годности сборочного задания невозможно.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-orders-orderid-meta-expiration
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaExpirationRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaExpiration(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/orders/%1/meta/expiration", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить GTIN за сборочным заданием
//
// Метод обновляет GTIN, уникальный ID товара в Беларуси, в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta).
// У одного сборочного задания может быть только один GTIN.
// Закрепить GTIN можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `gtin`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-orders-orderid-meta-gtin
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaGtinRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaGtin(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/orders/%1/meta/gtin", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить IMEI за сборочным заданием
//
// Метод обновляет IMEI в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta).
// У одного сборочного задания может быть только один IMEI. Если у устройства два IMEI — \\*\\*IMEI\\*\\* и \\*\\*IMEI2\\*\\* или \\*\\*IMEI1\\*\\* и \\*\\*IMEI2\\*\\* — укажите только \\*\\*IMEI\\*\\* или \\*\\*IMEI1\\*\\*. \\*\\*IMEI2\\*\\* указывать не нужно.
// Закрепить IMEI можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `imei`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-orders-orderid-meta-imei
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaImeiRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaImei(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/orders/%1/meta/imei", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить код маркировки Честного знака за сборочным заданием
//
// Метод обновляет код маркировки [Честного знака](https://честныйзнак.рф/) в идентификаторах маркировки [сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/getV3Orders).
//
// Закрепить код маркировки Честного знака можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `sgtin`.
//
// Получить загруженные маркировки можно в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-orders-orderid-meta-sgtin
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaSgtinRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaSgtin(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/orders/%1/meta/sgtin", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить УИН за сборочным заданием
//
// Метод обновляет УИН, уникальный идентификационный номер, в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta).
// У одного сборочного задания может быть только один УИН.
// Закрепить УИН можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsAssemblyOrders/operation/postV3OrdersStatus) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsLabelIdentifiers/operation/postV3OrdersMeta) есть поле `uin`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1000 запросов | 60 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-orders-orderid-meta-uin
//
// Параметры:
//   orderId - Число - ID сборочного задания
//   Тело - OrdersFbsPutV3OrdersOrderIdMetaUinRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3OrdersOrderIdMetaUin(Знач orderId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/orders/%1/meta/uin", Транспорт.ЭкранироватьСегмент(orderId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Обновить пропуск
//
// Метод обновляет данные [пропуска продавца](https://dev.wildberries.ru/openapi/orders-fbs#tag/fbsPasses/operation/getV3Passes). В том числе, можно обновить данные привязанного склада WB.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий, поставок, пропусков и настроек автовозврата FBS**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/orders-fbs/put-api-v3-passes-passid
//
// Параметры:
//   passId - Число - ID пропуска
//   Тело - OrdersFbsPutV3PassesPassIdRequest - Общая длина ФИО ограничена от 6 до 100 символов. В номере машины могут быть только буквы и цифры.
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV3PassesPassId(Знач passId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		СтрШаблон("/api/v3/passes/%1", Транспорт.ЭкранироватьСегмент(passId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

