# API приложения YaMDB

Добро пожаловать в сервис YaMDB!
Наш сервис поможет определиться с выбором подходящих именно Вам фильмов, музыки и книг.

## 1. Что может API

Каждый пользователь сервиса (даже без регистрации) может:
- посмотреть список всех произведений или информацию о конкретном произведении;
- найти произведение по названию, жанру, категории, году появления;
- ознакомиться с жанрами и категориями произведений, доступных в нашем сервисе;
- посмотреть обзоры произведений, сделанные нашими пользователями, и комментарии к этим обзорам.

Если вы зарегистрируетесь, то дополнительно сможете:
- создавать/редактировать/удалять обзоры и комментарии к обзорам;
- просматривать и редактировать информацию о своем аккаунте.

## 2. Регистрация

Для регистрации нужно передать `email` POST-запросом к `/api/v1/email/`.
На `email` поступит код подтверждения (confirmation_code).
Для получения JWT-токена нужно сделать POST-запрос к `/api/v1/token/`, в теле заголовка указав свои `email` и `confirmation_code`.

## 3. Эндпоинты АPI

Все эндпоинты начинаются с `/api/v1/`

| Эндпоинт | Метод запроса | Результат|
|:----:|:----:|:----------:|
|/auth/email/|POST|Зарегистрироваться по email и получить код доступа|
|/auth/token/|POST|Получить токен в обмен на email и код доступа (confirmation_code)|
|/users/|GET POST|Посмотреть список всех пользователей, создать запись о новом (только администраторы)|
|/users/{username}/|GET PATCH DELETE|Посмотреть информацию о конкретном пользователе, отредактировать и удалить ее (только администраторы)|
|/users/me/|GET PATCH|Посмотреть и отредактировать информацию о своём аккаунте|
|/categories/|GET POST|Посмотреть список категорий, создать новую|
|/categories/{slug}|DELETE|Удалить категорию|
|/genres/|GET POST|Посмотреть список жанров, создать новый|
|/genres/{slug}/|DELETE|Удалить жанр|
|/titles/|GET POST|Посмотреть список всех произведений, создать информацию о новом произведении|
|/titles/{title_id}/|GET PATCH DELETE|Посмотреть/редактировать/удалить информацию о произведении|
|/titles/{title_id}/reviews/|GET POST|Посмотреть все обзоры, создать новый|
|/titles/{title_id}/reviews/{review_id}/|GET PATCH DELETE|Чтение/редактирование/удаление обзора|
|/titles/{title_id}/reviews/{review_id}/comments/|GET POST|Просмотреть комментарии, создать новый|
|/titles/{title_id}/reviews/{review_id}/comments/{comment_id}/|GET PATCH DELETE|Чтение/редактирование/удаление комментариев|

## 4. Формат и пример ответа на запрос к API

Ответ на запрос к API возвращается в формате `JSON`.

Пример ответа на GET-запрос по маршруту `title/` (получить список произведений)

```python
{
    "count": 33,
    "next": "http://localhost:8000/api/v1/titles/?page=2",
    "previous": null,
    "results": [
        {
            "id": 1,
            "rating": 5.5,
            "category": {
                "name": "Фильм",
                "slug": "movie"
            },
            "genre": [
                {
                    "name": "Драма",
                    "slug": "drama"
                }
            ],
            "name": "Побег из Шоушенка",
            "description": "w",
            "year": 1994
        },
        {
            "id": 2,
            "rating": 4.8,
            "category": {
                "name": "Фильм",
                "slug": "movie"
            },
            "genre": [
                {
                    "name": "Драма",
                    "slug": "drama"
                }
            ],
            "name": "Крестный отец",
            "description": "",
            "year": 1972
        },
...
```