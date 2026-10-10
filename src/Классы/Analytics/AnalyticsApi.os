// AnalyticsApi
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Пример:
//   Настройки = Новый Конфигурация();
//   Настройки.УстановитьТокен("...");
//   Клиент = Новый AnalyticsApi(Настройки);

Перем Настройки Экспорт;
Перем Транспорт Экспорт;

Процедура ПриСозданииОбъекта(Знач ВходящиеНастройки)
	Настройки = ВходящиеНастройки;
	Транспорт = Новый ТранспортHTTP(Настройки);
КонецПроцедуры

// Получить список отчётов
//
// Метод возвращает список отчётов с расширенной аналитикой продавца. Ответ содержит ID [созданных отчётов](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/postV2NmReportDownloads) и статусы генерации.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/get-api-v2-nm-report-downloads
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * filter[downloadIds] - Массив - ID отчёта
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV2NmReportDownloads(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v2/nm-report/downloads",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Получить отчёт
//
// Метод возвращает отчёт с расширенной аналитикой продавца по ID [задания на генерацию](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/postV2NmReportDownloads).
//
// Можно получить отчёт, который сгенерирован за последние 48 часов.
// Отчёт будет загружен внутри архива ZIP в формате CSV.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/get-api-v2-nm-report-downloads-file-downloadid
//
// Параметры:
//   downloadId - Строка - ID отчёта
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV2NmReportDownloadsFileDownloadId(Знач downloadId) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		СтрШаблон("/api/v2/nm-report/downloads/file/%1", Транспорт.ЭкранироватьСегмент(downloadId)),
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Получить отчёт
//
// Метод формирует набор данных о заказах и продажах.
//
// Данные отчёта обновляются в режиме реального времени.
//
// > 1 заказ = 1 сборочное задание = 1 единица товара
// Параметры `brandNames`,`subjectIds`, `tagIds`, `nmIds` могут быть пустыми `[]`, тогда в ответе возвращаются все заказы продавца.
// Если вы указали несколько параметров, в ответе будут заказы, в которых есть одновременно все эти параметры. Если заказы не подходят по параметрам запроса, вернётся пустой массив `[]`.
//
// Можно получить отчёт максимум за последние 31 день.
//
// Заказы отдаются по времени текущего статуса, от самого нового к самому раннему.
//
// Можно использовать пагинацию.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Сервисный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый с секретом | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый | 3 ч | 1 запрос | 3 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v1-order-feed
//
// Параметры:
//   Тело - AnalyticsOrderFeedRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1OrderFeed(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v1/order-feed",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Остатки на складах продавца
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает текущие остатки товаров на складах продавца.
//
// Данные обновляются 1 раз в 30 минут.
//
// 1 строка ответа — данные об 1 размере товара на 1 складе продавца.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 3 запроса | 20 сек | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v1-stocks-report-seller-warehouses
//
// Параметры:
//   Тело - AnalyticsInventoryRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1StocksReportSellerWarehouses(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v1/stocks-report/seller-warehouses",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Остатки на складах WB
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену,
// **Базовому** токену **с секретом**
//
// Метод возвращает текущие остатки товаров на складах WB.
//
// Данные обновляются 1 раз в 30 минут.
//
// 1 строка ответа — данные об 1 размере товара на 1 складе WB.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 3 запроса | 20 сек | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v1-stocks-report-wb-warehouses
//
// Параметры:
//   Тело - AnalyticsInventoryRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1StocksReportWbWarehouses(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v1/stocks-report/wb-warehouses",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Получить отчёт
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод формирует набор данных об оценках товаров.
//
// Данные отчёта обновляются 1 раз в час.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 3 запроса | 20 сек | 3 запроса |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v2-item-rating
//
// Параметры:
//   Тело - AnalyticsItemRatingRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2ItemRating(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v2/item-rating",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Создать отчёт
//
// Метод создаёт задание на генерацию отчёта с расширенной аналитикой продавца.
//
// Вы можете создать CSV-версии отчётов по [воронке продаж](https://dev.wildberries.ru/openapi/analytics#tag/salesFunnel) или [параметрам поиска](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems) с группировкой по:
// \\* артикулам WB
// \\* предметам, брендам и ярлыкам
// В отчётах по воронке продаж можно группировать данные по дням, неделям или месяцам.
//
// Также можете создать CSV-версии отчётов по [текстам поисковых запросов](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportProductSearchTexts) и [остаткам](https://dev.wildberries.ru/openapi/analytics#tag/stocksReport).
//
// Каждый новый отчёт должен иметь уникальный ID.
//
// Не используйте одинаковые ID для разных отчётов — это может привести к ошибкам при генерации
//
// Набор параметров запроса в объекте `params` зависит от типа отчёта. Чтобы получить описание параметров, выберите тип отчёта в раскрывающемся списке в описании параметра `reportType`.
//
// Параметры `includeSubstitutedSKUs` и `includeSearchTexts` не могут одновременно иметь значение `false`.
//
// Если не удалось [получить отчёт](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/getV2NmReportDownloadsFileDownloadId), можно создать [повторное задание на генерацию](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/postV2NmReportDownloadsRetry). Также можно [получить список и проверить статусы](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/getV2NmReportDownloads) отчётов.
//
// Данные отчётов обновляются 1 раз в 2 часа.
//
// Отчёты по [остаткам](https://seller.wildberries.ru/content-analytics/history-remains) — типы `STOCK_HISTORY_REPORT_CSV` и `STOCK_HISTORY_DAILY_CSV` — можно создать без подписки [Джем](https://seller.wildberries.ru/monetization/jam)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-nm-report-downloads
//
// Параметры:
//   Тело - AnalyticsPostV2NmReportDownloadsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2NmReportDownloads(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/nm-report/downloads",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Сгенерировать отчёт повторно
//
// Метод создает повторное [задание на генерацию](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/postV2NmReportDownloads) отчёта с расширенной аналитикой продавца. Необходимо, если при генерации отчёта вы [получили статус](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv/operation/getV2NmReportDownloads) `FAILED`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-nm-report-downloads-retry
//
// Параметры:
//   Тело - AnalyticsNmReportRetryReportRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2NmReportDownloadsRetry(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/nm-report/downloads/retry",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Заказы и позиции по поисковым запросам товара
//
// Метод формирует данные для таблицы:
// - о заказах по каждому поисковому запросу для конкретного товара
// - о позициях товара в результатах поиска по каждому запросу
// Данные указаны в рамках периода для [запрошенного товара](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportProductSearchTexts) и сгруппированы по дням. Максимальный период — 7 дней.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// Можно получить отчёт максимум за последние 365 дней с момента выполнения запроса
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-search-report-product-orders
//
// Параметры:
//   Тело - AnalyticsItemOrdersRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2SearchReportProductOrders(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/search-report/product/orders",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Поисковые запросы по товару
//
// Метод формирует топ поисковых запросов по товару.
// Параметры выбора поисковых запросов:
// - `limit` — количество запросов, максимум 30. Для тарифов [Джема](https://seller.wildberries.ru/monetization/tariffs) \\*\\*Продвинутый\\*\\* и \\*\\*Премиальный\\*\\* максимум — 100.
// - `topOrderBy` — способ выбора топа запросов
// Параметры `includeSubstitutedSKUs` и `includeSearchTexts` не могут одновременно иметь значение `false`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-search-report-product-search-texts
//
// Параметры:
//   Тело - AnalyticsItemSearchTextsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2SearchReportProductSearchTexts(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/search-report/product/search-texts",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Основная страница
//
// Метод формирует набор данных для основной страницы отчёта по поисковым запросам с:
// - общей информацией
// - позициями товаров
// - данными по видимости и переходам в карточку
// - данными для таблицы по группам
// Для получения дополнительных данных в таблице используйте отдельный запрос для:
// - [пагинации по группам](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportTableGroups)
// - [получения по товарам в группе](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportTableDetails)
// Дополнительный параметр выбора списка товаров в таблице:
// - `positionCluster` — средняя позиция в поиске
// Параметры `includeSubstitutedSKUs` и `includeSearchTexts` не могут одновременно иметь значение `false`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-search-report-report
//
// Параметры:
//   Тело - AnalyticsMainRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2SearchReportReport(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/search-report/report",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Пагинация по товарам в группе
//
// Метод формирует дополнительные данные к [основному отчёту](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportReport) с пагинацией по товарам в группе. Пагинация возможна вне зависимости от наличия фильтров.
//
// Фильтры для пагинации по товарам в группе или без фильтров:
// - кортеж `subjectId`,`brandName`,`tagId` — фильтр для группы
// - `nmIds` — фильтр по карточке товара
// Дополнительный параметр выбора списка товаров:
// - `positionCluster` — средняя позиция в поиске
// Параметры `includeSubstitutedSKUs` и `includeSearchTexts` не могут одновременно иметь значение `false`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-search-report-table-details
//
// Параметры:
//   Тело - AnalyticsTableDetailsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2SearchReportTableDetails(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/search-report/table/details",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Пагинация по группам
//
// Метод формирует дополнительные данные к [основному отчёту](https://dev.wildberries.ru/openapi/analytics#tag/searchQueriesForYourItems/operation/postV2SearchReportReport) с пагинацией по группам. Пагинация возможна только при наличии фильтра по бренду, предмету или ярлыку.
//
// Дополнительный параметр выбора списка товаров в таблице:
// - `positionCluster` — средняя позиция в поиске
// Параметры `includeSubstitutedSKUs` и `includeSearchTexts` не могут одновременно иметь значение `false`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-search-report-table-groups
//
// Параметры:
//   Тело - AnalyticsTableGroupRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2SearchReportTableGroups(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/search-report/table/groups",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Данные по складам
//
// Метод формирует набор данных об остатках по складам.
//
// Данные по складам продавца приходят в агрегированном виде — по всем сразу, без детализации по конкретным складам — эти записи будут с `\"regionName\":\"Свой склад\"` и `\"offices\":[]`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-stocks-report-offices
//
// Параметры:
//   Тело - AnalyticsTableShippingOfficeRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2StocksReportOffices(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/stocks-report/offices",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Данные по группам
//
// Метод формирует набор данных об остатках по группам товаров.
//
// Группа товаров описывается кортежем `subjectID, brandName, tagID`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-stocks-report-products-groups
//
// Параметры:
//   Тело - AnalyticsTableGroupRequestSt
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2StocksReportProductsGroups(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/stocks-report/products/groups",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Данные по товарам
//
// Метод формирует набор данных об остатках по товарам.
//
// Можно получить данные как по отдельным товарам, так и в рамках всего отчёта — если в запросе отсутствуют фильтры: `nmIDs`, `subjectID`, `brandName`, `tagID`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-stocks-report-products-products
//
// Параметры:
//   Тело - AnalyticsTableItemRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2StocksReportProductsProducts(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/stocks-report/products/products",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Данные по размерам
//
// Метод формирует набор данных об остатках по размерам товара.
//
// Возможны случаи:
// 1. Товар имеет размеры и `\"includeOffice\":true`, тогда в ответе будут данные об остатках по каждому из размеров с вложенной детализацией по складам.
// 2. Товар имеет размеры и `\"includeOffice\":false`, тогда в ответе будут данные об остатках по каждому из размеров без вложенной детализации по складам.
// 3. Товар не имеет размера и `\"includeOffice\":true`, тогда в ответе будет детализация по складам. Без данных об остатках по каждому из размеров.
// 4. Товар не имеет размера и `\"includeOffice\":false`, тогда тело ответа будет пустым.
// Товар не имеет размера, если у него единственный размер с `\"techSize\":\"0\"`. В ответах метода получения данных по [товарам](https://dev.wildberries.ru/openapi/analytics#tag/stocksReport/operation/postV2StocksReportProductsProducts) у таких товаров `\"hasSizes\":false`.
// Данные по складам продавца приходят в агрегированном виде — по всем сразу, без детализации по конкретным складам — эти записи будут с `\"regionName\":\"Свой склад\"` и `\"officeName\":\"\"`.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-v2-stocks-report-products-sizes
//
// Параметры:
//   Тело - AnalyticsTableSizeRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV2StocksReportProductsSizes(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v2/stocks-report/products/sizes",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Статистика групп карточек товаров по дням
//
// Метод возвращает статистику карточек товаров по дням или неделям.
// Карточки товаров сгруппированы по предметам, брендам и ярлыкам.
// Можно получить данные максимум за последнюю неделю.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// В течение часа после события появляется большая часть данных:
// - о заказах
// - о переходах в карточку товара
// - о добавлениях товаров в корзину
// Малая часть этих данных может появляться в течение нескольких дней.
//
// Выкупы, отмены и возвраты отображаются в отчёте за тот день, когда товар был заказан. Например, если заказ был сделан 1 января, а покупатель вернул товар 10 января, данные об этом возврате появятся в отчёте за 1 января.
// Окончательные итоги продаж вы можете отслеживать с помощью [детализаций к отчётам реализации](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/financialReports).
//
// Параметры `brandNames`, `subjectIds`, `tagIds` могут быть пустыми `[]`, тогда группировка происходит по всем карточкам продавца.
//
// Произведение количества предметов, брендов, ярлыков в запросе может быть не больше 16. Например, 4 бренда и 4 предмета или 2 предмета, 2 ярлыка и 4 бренда.
//
// Чтобы получать отчёты за период до года, используйте методы [Аналитика продавца CSV](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv) — тип `GROUPED_HISTORY_REPORT`. Отчёты этого типа доступны только с подпиской [Джем](https://seller.wildberries.ru/monetization/jam)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v3-sales-funnel-grouped-history
//
// Параметры:
//   Тело - AnalyticsGroupedHistoryRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3SalesFunnelGroupedHistory(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v3/sales-funnel/grouped/history",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Статистика карточек товаров за период
//
// Метод формирует отчёт о товарах, сравнивая ключевые показатели за текущий период с аналогичным прошлым.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// В течение часа после события появляется большая часть данных:
// - о заказах
// - о переходах в карточку товара
// - о добавлениях товаров в корзину
// Малая часть этих данных может появляться в течение нескольких дней.
//
// Выкупы, отмены и возвраты отображаются в отчёте за тот день, когда товар был заказан. Например, если заказ был сделан 1 января, а покупатель вернул товар 10 января, данные об этом возврате появятся в отчёте за 1 января.
// Окончательные итоги продаж вы можете отслеживать с помощью [детализаций к отчётам реализации](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/financialReports).
//
// Параметры `brandNames`,`subjectIds`, `tagIds`, `nmIds` могут быть пустыми `[]`, тогда в ответе возвращаются все карточки продавца.
//
// Если вы указали несколько параметров, в ответе будут карточки, в которых есть одновременно все эти параметры. Если карточки не подходят по параметрам запроса, вернётся пустой ответ `[]`.
//
// Можно получить отчёт максимум за последние 365 дней.
//
// В данных предыдущего периода:
// \\* Данные в `pastPeriod` указаны за такой же период, что и в `selectedPeriod`
// \\* Если дата начала `pastPeriod` раньше, чем год назад от текущей даты, она будет приведена к виду: `pastPeriod.start = текущая дата — 365 дней`
// Можно использовать пагинацию.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v3-sales-funnel-products
//
// Параметры:
//   Тело - AnalyticsItemsRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3SalesFunnelProducts(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v3/sales-funnel/products",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

// Статистика карточек товаров по дням
//
// Метод возвращает статистику карточек товаров по дням или неделям.
// Можно получить данные максимум за последнюю неделю.
//
// Данные отчёта обновляются 1 раз в 2 часа.
//
// В течение часа после события появляется большая часть данных:
// - о заказах
// - о переходах в карточку товара
// - о добавлениях товаров в корзину
// Малая часть этих данных может появляться в течение нескольких дней.
//
// Выкупы, отмены и возвраты отображаются в отчёте за тот день, когда товар был заказан. Например, если заказ был сделан 1 января, а покупатель вернул товар 10 января, данные об этом возврате появятся в отчёте за 1 января.
// Окончательные итоги продаж вы можете отслеживать с помощью [детализаций к отчётам реализации](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/financialReports).
//
// Чтобы получать отчёты за период до года, используйте методы [Аналитика продавца CSV](https://dev.wildberries.ru/openapi/analytics#tag/sellerAnalyticsCsv) — тип `DETAIL_HISTORY_REPORT`. Отчёты этого типа доступны только с подпиской [Джем](https://seller.wildberries.ru/monetization/jam)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Сервисный | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый с секретом | 1 мин | 3 запроса | 20 сек | 3 запроса |
// | Базовый | 1 ч | 2 запроса | 30 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/analytics/post-api-analytics-v3-sales-funnel-products-history
//
// Параметры:
//   Тело - AnalyticsItemHistoryRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV3SalesFunnelProductsHistory(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/analytics/v3/sales-funnel/products/history",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://seller-analytics-api.wildberries.ru");

КонецФункции

