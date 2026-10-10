// GeneralApi
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Пример:
//   Настройки = Новый Конфигурация();
//   Настройки.УстановитьТокен("...");
//   Клиент = Новый GeneralApi(Настройки);

Перем Настройки Экспорт;
Перем Транспорт Экспорт;

Процедура ПриСозданииОбъекта(Знач ВходящиеНастройки)
	Настройки = ВходящиеНастройки;
	Транспорт = Новый ТранспортHTTP(Настройки);
КонецПроцедуры

// Удалить пользователя
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену
//
// Метод удаляет пользователя из [списка сотрудников продавца](https://dev.wildberries.ru/openapi/api-information#tag/sellerUserManagement/operation/getV1Users). Этому пользователю будет закрыт доступ в профиль продавца.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 10 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/delete-api-v1-user
//
// Параметры:
//   deletedUserID - Число - ID пользователя, которому будет закрыт доступ
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция DeleteV1User(Знач deletedUserID) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	ПараметрыЗапроса.Вставить("deletedUserID", deletedUserID);
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"DELETE",
		"/api/v1/user",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://user-management-api.wildberries.ru");

КонецФункции

// Проверка подключения
//
// Метод проверяет:
// 1. Успешно ли запрос доходит до WB API
// 2. Валидность токена авторизации и URL запроса
// 3. Совпадают ли категория токена и сервис
//
// Метод не предназначен для проверки доступности сервисов WB
//
// У каждого сервиса есть свой вариант метода в зависимости от домена:
// | Категория | URL запроса |
// |---------------|-----------------------|
// | Контент | `https://content-api.wildberries.ru/ping`
// `https://content-api-sandbox.wildberries.ru/ping` |
// | Аналитика | `https://seller-analytics-api.wildberries.ru/ping` |
// | Цены и скидки | `https://discounts-prices-api.wildberries.ru/ping`
// `https://discounts-prices-api-sandbox.wildberries.ru/ping` |
// | Маркетплейс | `https://marketplace-api.wildberries.ru/ping` |
// | Статистика | `https://statistics-api.wildberries.ru/ping`
// `https://statistics-api-sandbox.wildberries.ru/ping` |
// | Продвижение | `https://advert-api.wildberries.ru/ping`
// `https://advert-api-sandbox.wildberries.ru/ping` |
// | Вопросы и отзывы | `https://feedbacks-api.wildberries.ru/ping`
// `https://feedbacks-api-sandbox.wildberries.ru/ping` |
// | Чат с покупателями | `https://buyer-chat-api.wildberries.ru/ping` |
// | Поставки | `https://supplies-api.wildberries.ru/ping` |
// | Возвраты покупателями | `https://returns-api.wildberries.ru/ping` |
// | Документы | `https://documents-api.wildberries.ru/ping` |
// | Финансы | `https://finance-api.wildberries.ru/ping` |
// | Тарифы, Новости, Получить информацию о продавце | `https://common-api.wildberries.ru/ping` |
// | Управление пользователями продавца | `https://user-management-api.wildberries.ru/ping` |
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 30 сек | 3 запроса | 10 сек | 99 запросов |
//
// Лимит действует отдельно для каждого варианта метода в зависимости от домена
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-ping
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetPing() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/ping",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://common-api.wildberries.ru");

КонецФункции

// Получить рейтинг продавца
//
// Для доступа к методу используйте [токен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Kak-sozdat-personalnyj-bazovyj-ili-testovyj-token) для категории **Вопросы и отзывы**
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Сервисному** токену
//
// Метод возвращает пользовательский рейтинг продавца и количество отзывов.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-common-v1-rating
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1Rating() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/common/v1/rating",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://feedbacks-api.wildberries.ru");

КонецФункции

// Получить информацию о продавце
//
// Информацию о продавце можно получить с токеном любой [категории](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Kategorii-tokenov)
//
// Метод позволяет получать наименование продавца и ID его профиля.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Сервисный | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Базовый с секретом | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Базовый | 24 ч | 1 запрос | 24 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-v1-seller-info
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1SellerInfo() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/seller-info",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://common-api.wildberries.ru");

КонецФункции

// Получить информацию о подписке Джем
//
// Информацию о подписке Джем можно получить с токеном любой [категории](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Kategorii-tokenov)
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Сервисному** токену
//
// Метод возвращает информацию о подписке [Джем](https://seller.wildberries.ru/monetization/jam):
// - Если продавец никогда не подключал подписку Джем, возвращается пустой ответ `200`.
// - Если продавец активировал и никогда не отменял подписку, возвращается:
// - дата активации подписки `since`
// - дата окончания текущего оплаченного периода `till`
// - Если подписка закончилась или была отменена, но продавец подключил её повторно, возвращается:
// - дата первой активации подписки `since`
// - дата окончания текущего оплаченного периода `till`
// - Если подписка неактивна, возвращается:
// - дата первой активации подписки `since`
// - дата окончания последнего оплаченного периода `till`
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 10 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-common-v1-subscriptions
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1Subscriptions() Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/common/v1/subscriptions",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://common-api.wildberries.ru");

КонецФункции

// Получить информацию об опциях Конструктора тарифов
//
// Информацию об опциях Конструктора тарифов можно получить с токеном любой [категории](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Kategorii-tokenov)
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Сервисному** токену
//
// Метод возвращает информацию обо всех опциях и пакетах опций, которые продавец подключил в [Конструкторе тарифов](https://seller.wildberries.ru/tariff-constructor).
//
// Опции, входящие в подключённые пакеты, возвращаются в массиве `packages`. Опции, подключённые вне пакетов, возвращаются в массиве `options`.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 мин | 1 запрос | 1 мин | 10 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-common-v1-tariff-constructor-options
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * locale - Строка - Язык полей ответа: - `ru` — русский - `en` — английский
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1TariffConstructorOptions(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/common/v1/tariff-constructor/options",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://common-api.wildberries.ru");

КонецФункции

// Получить список активных или приглашённых пользователей продавца
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену
//
// Метод возвращает список активных или приглашённых пользователей профиля продавца.
//
// Чтобы выбрать список, укажите значение параметра `isInviteOnly`:
// - `isInviteOnly=true` — список приглашённых пользователей, которые ещё не активировали доступ
// - `isInviteOnly=false` или не указан — список активных пользователей
// По каждому пользователю можно получить:
// - роль пользователя
// - разделы, к которым есть доступы
// - статус приглашения
// Список приглашённых пользователей в ответе всегда отсортирован по дате создания: от новых до старых.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 5 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-v1-users
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * limit - Число - Количество активных или приглашённых пользователей в ответе
//    * offset - Число - Сколько элементов пропустить. Например, для значения 10 ответ начнется с 11 элемента
//    * isInviteOnly - Булево - - `true` — список приглашённых пользователей, которые ещё не активировали доступ - `false` или не указан — список активных пользователей профиля продавца
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV1Users(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/v1/users",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://user-management-api.wildberries.ru");

КонецФункции

// Получение новостей портала продавцов
//
// Метод позволяет получать новости портала продавцов.
// Для получения успешного ответа необходимо указать
// один из параметров `from` или `fromID`.
// За один запрос можно получить не более 100 новостей.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Тип | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- | --- |
// | Персональный | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Сервисный | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Базовый с секретом | 1 мин | 1 запрос | 1 мин | 10 запросов |
// | Базовый | 1 ч | 1 запрос | 1 ч | 1 запрос |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/get-api-communications-v2-news
//
// Параметры:
//   ДопПараметры - Структура, Соответствие - необязательные параметры:
//    * from - Строка - Дата, от которой необходимо выдать новости
//    * fromID - Число - ID новости, начиная с которой — включая её — нужно получить список новостей
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция GetV2News(Знач ДопПараметры = Неопределено) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;

	ИменаЗаголовков = Новый Массив;
	Транспорт.РазложитьПараметры(ДопПараметры, ИменаЗаголовков, ПараметрыЗапроса, Заголовки);
	Возврат Транспорт.ВыполнитьЗапрос(
		"GET",
		"/api/communications/v2/news",
		ПараметрыЗапроса,
		Заголовки,
		Неопределено,
		"https://common-api.wildberries.ru");

КонецФункции

// Создать приглашение для нового пользователя
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену
//
// Метод создаёт приглашение для нового пользователя с настройкой доступов к разделам профиля продавца.
// Как выдаются права доступа:
// - Если `access` пустой (`[]`) или не указан — по умолчанию выдаются все доступы, кроме доступов к витрине (`showcase`) и \\*\\*Джем\\*\\* (`changeJam`)
// - Если в `access` указана часть разделов профиля, то кроме тех доступов, что указаны в запросе, также выдаются все доступы по умолчанию
// - Если в `access` перечислены все возможные разделы, доступы будут выданы согласно запросу, без доступов по умолчанию
// - Если в `access` дважды указан один и тот же раздел (`code`):
// - при разных значениях `disabled` (`true` и `false`) доступ не будет выдан
// - при одинаковых значениях `\"disabled\": true` доступ не будет выдан
// - при одинаковых значениях `\"disabled\": false` доступ будет выдан
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 5 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/post-api-v1-invite
//
// Параметры:
//   Тело - GeneralCreateInviteRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PostV1Invite(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"POST",
		"/api/v1/invite",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://user-management-api.wildberries.ru");

КонецФункции

// Изменить права доступа пользователей
//
// Метод [доступен](https://dev.wildberries.ru/openapi/api-information#tag/authorization/Pravila-ispolzovaniya-tokenov-dostupa-k-API) по
// **Персональному** токену
//
// Метод меняет права доступа одному или нескольким пользователям.
//
// Обновляются только права доступа, переданные в параметрах запроса. Остальные поля остаются без изменений.
//
// [Лимит запросов](https://dev.wildberries.ru/openapi/api-information#tag/introduction/Limity-zaprosov) на один аккаунт продавца:
// | Период | Лимит | Интервал | Всплеск |
// | --- | --- | --- | --- |
// | 1 сек | 1 запрос | 1 сек | 5 запросов |
//
// Library doc: https://valeryverkhoturov.github.io/wb-api-client-docs/reference/api/general/put-api-v1-users-access
//
// Параметры:
//   Тело - GeneralUpdateUserAccessRequest
//
// Возвращаемое значение:
//   ОтветAPI
//
Функция PutV1UsersAccess(Знач Тело) Экспорт

	ПараметрыЗапроса = Новый Соответствие;
	Заголовки = Новый Соответствие;
	Возврат Транспорт.ВыполнитьЗапрос(
		"PUT",
		"/api/v1/users/access",
		ПараметрыЗапроса,
		Заголовки,
		Тело,
		"https://user-management-api.wildberries.ru");

КонецФункции

