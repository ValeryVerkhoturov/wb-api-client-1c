// InStorePickupApi
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Пример:
//   Настройки = Новый Конфигурация();
//   Настройки.УстановитьТокен("...");
//   Клиент = Новый InStorePickupApi(Настройки);

Перем Настройки Экспорт;
Перем Транспорт Экспорт;

Процедура ПриСозданииОбъекта(Знач ВходящиеНастройки)
	Настройки = ВходящиеНастройки;
	Транспорт = Новый ТранспортHTTP(Настройки);
КонецПроцедуры

// Получить информацию о завершённых сборочных заданиях
//
// Метод возвращает информацию о завершённых сборочных заданиях после продажи или отмены заказа.
//
// Можно получить данные за заданный период, максимум 30 календарных дней одним запросом.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   limit - Число - Количество элементов в ответе
//   next - Число - Параметр пагинации. Чтобы получить полный список данных, укажите `0` в первом запросе. Чтобы получить следующий пакет данных, используйте значение `next` из отв…
//   dateFrom - Число - Дата начала периода в формате Unix timestamp
//   dateTo - Число - Дата конца периода в формате Unix timestamp
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3ClickCollectOrders(Знач limit, Знач next, Знач dateFrom, Знач dateTo) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("limit", limit);
	ПараметрыЗапроса.Вставить("next", next);
	ПараметрыЗапроса.Вставить("dateFrom", dateFrom);
	ПараметрыЗапроса.Вставить("dateTo", dateTo);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/click-collect/orders",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить список новых сборочных заданий
//
// Метод возвращает список всех новых [сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders), которые есть у продавца на момент запроса.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV3ClickCollectOrdersNew() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v3/click-collect/orders/new",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Информация о покупателе
//
// Метод возвращает информацию о покупателе по ID сборочного задания.
//
// Доступно только для сборочных заданий в статусах:
// - `confirm` — на сборке
// - `prepare` — готов к выдаче
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для методов **сборочных заданий Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 300 запросов | 200 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersClient(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/click-collect/orders/client",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Проверить, что заказ принадлежит покупателю
//
// Метод сообщает, принадлежит ли проверяемый заказ покупателю или нет по переданному коду.
//
// Доступно, если хотя бы одно сборочное задание из заказа находится в статусе prepare - готов к выдаче.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 30 запросов | 2 сек | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiCheckIdentityRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersClientIdentity(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v3/click-collect/orders/client/identity",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить цены продавца и суммы к оплате
//
// Метод возвращает:
// - цены продавца без учёта скидок
// - суммы к оплате покупателем с учетом всех скидок и кэшбека
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **получения и удаления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 150 запросов | 400 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersFinalPrice(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/final-price",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить номера ДТ за сборочными заданиями
//
// Метод обновляет номера ДТ — деклараций на товары — и коды стран происхождения товаров в [идентификаторах маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails). У одного сборочного задания может быть только один номер ДТ.
// Закрепить номер ДТ можно, только если выполняются все условия:
// - сборочное задание имеет признак B2B-продажи — `\"isB2b\":true` в ответе метода [получения новых сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/getV3ClickCollectOrdersNew)
// - сборочное задание находится в [статусах](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` или `prepare`
// - поле `customsDeclaration` есть в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 20 запросов | 3 сек | 500 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupPostV3ClickCollectOrdersMetaCustomsDeclarationRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaCustomsDeclaration(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/customs-declaration",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Удалить идентификаторы маркировки сборочных заданий
//
// Метод удаляет значения указанных [идентификаторов маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails).
//
// В одном запросе можно удалить идентификаторы маркировки только одного типа. Укажите тип идентификаторов маркировки в запросе:
// - `imei` — [IMEI](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaImei)
// - `uin` — [УИН](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaUin)
// - `gtin` — [GTIN](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaGtin)
// - `sgtin` — [код маркировки](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaSgtin)
// - `customsDeclaration` — [номер ДТ](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaCustomsDeclaration). При удалении номера ДТ также удаляется код страны происхождения товара — `originCountryCode`
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **получения и удаления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 150 запросов | 400 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersMetaDeleteRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaDelete(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/delete",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить идентификаторы маркировки сборочных заданий
//
// Метод возвращает идентификаторы маркировки [сборочных заданий ](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) и статусы их проверки.
//
// Перечень идентификаторов маркировки, доступных для сборочного задания, можно получить в [списке новых сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/getV3ClickCollectOrdersNew), поле `requiredMeta`. Если поле `requiredMeta` не содержит какой-либо идентификатор маркировки, значит, у сборочного задания не может быть этого идентификатора — и добавить его нельзя.
// Возможные идентификаторы маркировки:
// - `imei` — [IMEI](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaImei)
// - `uin` — [УИН](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaUin)
// - `gtin` — [GTIN](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaGtin)
// - `sgtin` — [код маркировки](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaSgtin)
// - `customsDeclaration` — [номер ДТ](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaCustomsDeclaration)
// - `originCountryCode` — [числовой код страны происхождения товара](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaCustomsDeclaration) из [Общероссийского классификатора стран мира](https://esnsi.gosuslugi.ru/classifiers/16269)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **получения и удаления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 150 запросов | 400 мс | 20 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaDetails(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/details",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить GTIN за сборочными заданиями
//
// Метод обновляет GTIN, уникальный ID товара в Беларуси, в [идентификаторах маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails). У одного сборочного задания может быть только один GTIN.
// Закрепить GTIN можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails) есть поле `gtin`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 20 запросов | 3 сек | 500 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersGTINSetRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaGtin(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/gtin",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить IMEI за сборочными заданиями
//
// Метод обновляет IMEI в [идентификаторах маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails).
// У одного сборочного задания может быть только один IMEI. Если у устройства два IMEI — \\*\\*IMEI\\*\\* и \\*\\*IMEI2\\*\\* или \\*\\*IMEI1\\*\\* и \\*\\*IMEI2\\*\\* — укажите только \\*\\*IMEI\\*\\* или \\*\\*IMEI1\\*\\*. \\*\\*IMEI2\\*\\* указывать не нужно.
// Закрепить IMEI можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails) есть поле `imei`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 20 запросов | 3 сек | 500 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersIMEISetRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaImei(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/imei",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить коды маркировки Честного знака за сборочными заданиями
//
// Метод обновляет код маркировки [Честного знака](https://честныйзнак.рф/) в [идентификаторах маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails).
// Закрепить код маркировки можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails) есть поле `sgtin`.
//
// Получить загруженные маркировки можно в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 20 запросов | 3 сек | 500 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersSGTINsSetRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaSgtin(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/sgtin",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Закрепить УИН за сборочными заданиями
//
// Метод обновляет УИН, уникальные идентификационные номера, в [идентификаторах маркировки сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails). У одного сборочного задания может быть только один УИН.
// Закрепить УИН можно только за сборочным заданием в [статусе](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` и если в [идентификаторах маркировки сборочного задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupLabelIdentifiers/operation/postV3ClickCollectOrdersMetaDetails) есть поле `uin`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца для всех методов **закрепления идентификаторов маркировки Самовывоз**:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 20 запросов | 3 сек | 500 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersUINSetRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersMetaUin(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/meta/uin",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Отменить сборочные задания
//
// Переводит [сборочные задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) из [статусов](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `new`, `confirm`, `prepare` в статус `cancel` — отменено продавцом.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusCancel(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/cancel",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Перевести сборочные задания на сборку
//
// Метод переводит [сборочные задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) из [статуса](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `new` — новый — в статус `confirm` — на сборке.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusConfirm(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/confirm",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Получить статусы сборочных заданий
//
// Метод возвращает статусы [сборочных заданий](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) по их ID.
//
// `supplierStatus` — статус сборочного задания. Триггер его изменения - действие самого продавца.
// Возможные значения `supplierStatus`:
// | Статус | Описание | Как перевести сборочное задание в данный статус |
// | ------- | --------- | --------------------------------------|
// | `new` | \\*\\*Новое сборочное задание\\*\\* |
// | `confirm` | \\*\\*На сборке\\*\\* | [Перевести сборочное задание на сборку](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusConfirm)
// | `prepare` | \\*\\*Готов к выдаче\\*\\* | [Сообщить, что сборочное задание готово к выдаче](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusPrepare)
// | `receive` | \\*\\*Получено покупателем\\*\\* | [Сообщить, что заказ принят покупателем](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusReceive)
// | `reject` | \\*\\*Отказ покупателя при получении\\*\\* | [Сообщить, что покупатель отказался от заказа](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusReject)
// | `cancel` | \\*\\*Отменено продавцом\\*\\* | [Отменить сборочное задание](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusCancel)
// | `cancel\\_shelf\\_life` | \\*\\*Отмена по истечении срока хранения\\*\\* | Переводится автоматически по возникновению события
//
// `wbStatus` — статус системы Wildberries.
// Возможные значения `wbStatus`:
// - `waiting` - сборочное задание в работе
// - `sold` - заказ получен покупателем
// - `canceled` - отмена сборочного задания
// - `canceled\\_by\\_client` - покупатель отменил заказ при получении
// - `declined\\_by\\_client` - покупатель отменил заказ в первый чаc
//
// Отмена доступна покупателю в первый час с момента заказа, если заказ не переведён на сборку
// - `defect` - отмена заказа по причине брака
// - `ready\\_for\\_pickup` - заказ готов к выдаче
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusInfo(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/info",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Сообщить, что сборочные задания готовы к выдаче
//
// Метод переводит [сборочные задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) из [статуса](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `confirm` — на сборке — в статус `prepare` — готово к выдаче.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusPrepare(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/prepare",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Сообщить, что заказы приняты покупателями
//
// Метод переводит [сборочные задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) из [статуса](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `prepare` — готово к выдаче — в статус `receive` — получено покупателем.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusReceive(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/receive",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

// Сообщить об отказе от заказов
//
// Метод переводит [сборочные задания](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders) из [статуса](https://dev.wildberries.ru/openapi/in-store-pickup#tag/inStorePickupAssemblyOrders/operation/postV3ClickCollectOrdersStatusInfo) `prepare` — готово к выдаче — в статус `reject` — отказ при получении.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
// Один запрос с кодами ответов `4XX` учитывается как 10 запросов.
//
// ---
//
// В [песочнице](https://dev.wildberries.ru/sandbox) — максимум 1 запрос в секунду суммарно для всех методов **Маркетплейса**.
//
// Параметры:
//   Тело - InStorePickupApiOrdersRequestV2
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3ClickCollectOrdersStatusReject(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/marketplace/v3/click-collect/orders/status/reject",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://marketplace-api.wildberries.ru");

КонецФункции

