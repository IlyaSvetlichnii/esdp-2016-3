# language: ru
  Функционал: удаление и редактирование книги админом.
    @login_admin
    Сценарий: удаление книги админом.
      И кликаю на "Список литературы"
      И кликаю на Удалить через tr
      И кликаю на алерт "Ок"
      И должен не найти текст "Book2"

    @login_admin
    Сценарий: изменение названия книги админом.
      И кликаю на "Список литературы"
      И кликаю через xpath на книгу Изменить
      И ввожу в поле "Наименование" текст "Книга Максима"
      И ввожу в поле "Описание" текст "Это лучшая книга Максима"
      И кликаю на "Сохранить Литературу"
      И должен увидеть текст "Книга Максима"
      И должен увидеть текст "Это лучшая книга Максима"