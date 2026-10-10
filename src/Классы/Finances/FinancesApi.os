// FinancesApi
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Пример:
//   Настройки = Новый Конфигурация();
//   Настройки.УстановитьТокен("...");
//   Клиент = Новый FinancesApi(Настройки);

Перем Настройки Экспорт;
Перем Транспорт Экспорт;

Процедура ПриСозданииОбъекта(Знач ВходящиеНастройки)
	Настройки = ВходящиеНастройки;
	Транспорт = Новый ТранспортHTTP(Настройки);
КонецПроцедуры

// Получить баланс продавца
//
// Метод возвращает данные виджета баланса на [главной странице](https://seller.wildberries.ru) портала продавцов.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Сервисный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый с секретом | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1AccountBalance() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/account/balance",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://finance-api.wildberries.ru");

КонецФункции

// Категории документов
//
// Метод возвращает категории документов для получения [списка документов продавца](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/documents/operation/getV1DocumentsList).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Сервисный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый с секретом | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * locale - Строка - Язык поля `title`: - `ru` — русский - `en` — английский - `zh` — китайский
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1DocumentsCategories(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/documents/categories",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://documents-api.wildberries.ru");

КонецФункции

// Получить документ
//
// Метод загружает один документ из [списка документов продавца](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/documents/operation/getV1DocumentsList).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Сервисный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый с секретом | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Параметры:
//   serviceName - Строка - Уникальный ID документа
//   extension - Строка - Формат документа
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1DocumentsDownload(Знач serviceName, Знач extension) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("serviceName", serviceName);
	ПараметрыЗапроса.Вставить("extension", extension);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/documents/download",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://documents-api.wildberries.ru");

КонецФункции

// Список документов
//
// Метод возвращает список документов продавца. Вы можете получить [один](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/documents/operation/getV1DocumentsDownload) или [несколько](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/documents/operation/postV1DocumentsDownloadAll) документов из полученного списка.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Сервисный | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый с секретом | 10 сек | 1 запрос | 10 сек | 5 запросов |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * locale - Строка - Язык поля `category`: - `ru` — русский - `en` — английский - `zh` — китайский
//    * beginTime - Строка - Начало периода. Только вместе с `endTime`
//    * endTime - Строка - Конец периода. Только вместе с `beginTime`
//    * sort - Строка - Сортировка: - `date` — по дате создания документа - `category` — по категории (только при `locale=ru`) Только вместе с `order`
//    * order - Строка - Сортировка: - `desc` — по убыванию - `asc` — по возрастанию Только вместе с `sort`
//    * category - Строка - ID [категории документов](./documents-and-accounting#tag/documents/operation/getV1DocumentsCategories) из поля `name`
//    * serviceName - Строка - Уникальный ID документа
//    * limit - Число - Максимальное количество строк ответа
//    * offset - Число - После какой строки выдавать данные
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1DocumentsList(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/documents/list",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://documents-api.wildberries.ru");

КонецФункции

// Детализации к отчётам об издержках на приём платежей за период
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает детализации к [отчётам об издержках на приём платежей](https://seller.wildberries.ru/suppliers-mutual-settlements/reports-implementations/acquiring-reports) за указанный период.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Параметры:
//   Тело - FinancesAcquiringReportsDetailedReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1AcquiringDetailed(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/finance/v1/acquiring/detailed",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

// Детализации к отчётам об издержках на приём платежей по ID отчётов
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает детализации к [отчётам об издержках на приём платежей](https://seller.wildberries.ru/suppliers-mutual-settlements/reports-implementations/acquiring-reports) по ID отчётов.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Параметры:
//   reportId - Число - ID отчёта
//   Тело - FinancesFinancialReportsDetailedReportIdReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1AcquiringDetailedReportId(Знач reportId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		СтрШаблон("/api/finance/v1/acquiring/detailed/%1", Транспорт.ЭкранироватьСегмент(reportId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

// Список отчётов об издержках на приём платежей
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает список отчётов об издержках на приём платежей по формату [таблицы отчётов](https://seller.wildberries.ru/suppliers-mutual-settlements/reports-implementations/acquiring-reports).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Параметры:
//   Тело - FinancesAcquiringReportListReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1AcquiringList(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/finance/v1/acquiring/list",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

// Получить документы
//
// Метод загружает несколько документов из [списка документов продавца](https://dev.wildberries.ru/openapi/documents-and-accounting#tag/documents/operation/getV1DocumentsList).
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 5 мин | 1 запрос | 5 мин | 5 запросов |
// | Сервисный | 5 мин | 1 запрос | 5 мин | 5 запросов |
// | Базовый с секретом | 5 мин | 1 запрос | 5 мин | 5 запросов |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Параметры:
//   Тело - FinancesRequestDownload
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1DocumentsDownloadAll(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v1/documents/download/all",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://documents-api.wildberries.ru");

КонецФункции

// Детализации к отчётам реализации за период
//
// Метод возвращает детализации к [отчётам реализации](https://seller.wildberries.ru/suppliers-mutual-settlements) за указанный период.
//
// Данные доступны с 29 января 2024 года.
//
// Вы можете выгрузить данные в [Google Таблицы](https://dev.wildberries.ru/knowledge-base/articles/019d49a4-650c-7b04-9596-ba441936f9d3)
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Сервисный | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый с секретом | 1 мин | 1 запрос | 1 мин | 1 запрос |
// | Базовый | 24 ч | 2 запроса | 12 ч | 1 запрос |
//
// Параметры:
//   Тело - FinancesSalesReportsDetailedReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1SalesReportsDetailed(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/finance/v1/sales-reports/detailed",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

// Детализации к отчётам реализации по ID отчётов
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает детализации к [отчётам реализации](https://seller.wildberries.ru/suppliers-mutual-settlements) по ID отчётов.
//
// Данные доступны с 29 января 2024 года.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Параметры:
//   reportId - Число - ID отчёта. Для ежедневных отчётов вместо стандартной десериализации рекомендуем использовать нестандартные библиотеки с поддержкой [BigInt](https://www.npmjs.co…
//   Тело - FinancesFinancialReportsDetailedReportIdReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1SalesReportsDetailedReportId(Знач reportId, Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		СтрШаблон("/api/finance/v1/sales-reports/detailed/%1", Транспорт.ЭкранироватьСегмент(reportId)),
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

// Список отчётов реализации
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену,
// **Сервисному** токену
//
// Метод возвращает список отчётов релизации по формату [таблицы отчётов](https://seller.wildberries.ru/suppliers-mutual-settlements).
//
// Данные доступны с 29 января 2024 года.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Параметры:
//   Тело - FinancesSalesReportListReq
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1SalesReportsList(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/finance/v1/sales-reports/list",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://finance-api.wildberries.ru");

КонецФункции

