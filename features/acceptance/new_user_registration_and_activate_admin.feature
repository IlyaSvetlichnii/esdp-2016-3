# language: ru
  Функционал: Авторизация учителя
     Сценарий: Регистрация нового пользователя(студента) и подтверждение админом.
       Допустим я на рутовой странице
       И кликаю на "Регистрация"
       И ввожу в поле "Имя" текст "Николай Петрович"
       И ввожу в поле "Телефон" текст "0558126394"
       И ввожу в поле "Skype" текст "karamba92911"
       И ввожу в поле "Email" текст "nic.pet.esdp@gmail.com"
       И ввожу в поле "Пароль" текст "nic.pet.esdpnic.pet.esdp"
       И ввожу в поле "Подтверждение пароля" текст "nic.pet.esdpnic.pet.esdp"
       И кликаю по html "Сохранить"
       И должен увидеть текст "Вы успешно зарегистрировались, перейдите в вашу почту для подтверждения аккаунта"
       И перехожу на страницу почты mailcatcher
       И кликаю на письмо через xpath
       И перехожу на страницу письма для подтверждения
       И кликаю на ссылку "Подтвердить"
       И должен увидеть текст "Ваш адрес электронной почты успешно подтвержден. С Вами свяжутся в ближайшее время."
       И ввожу в поле "Email" текст "nic.pet.esdp@gmail.com"
       И ввожу в поле "Пароль" текст "nic.pet.esdpnic.pet.esdp"
       И кликаю на кнопку "Войти"
       И должен увидеть текст "Ваша учетная запись находится на стадии подтверждения. С Вами свяжутся в ближайшее время."
       И перехожу на страницу почты mailcatcher
       И кликаю на письмо через xpath
       И перехожу на страницу письма уведомления для админа
       И должен увидеть текст "Зарегистрировался новый пользователь"
       И перехожу в админку
       И ввожу в поле "Эл. почта*" текст "step2universe@gmail.com"
       И ввожу в поле "Пароль*" текст "fjdksl56"
       И кликаю на кнопку "Войти"
       И должен увидеть текст "Вход в систему выполнен"
       И кликаю на ссылку "Запросы на регистрацию"
       И кликаю через xpath "Подтвердить"
       И перехожу на страницу почты mailcatcher
       И кликаю на письмо через xpath
       И перехожу на страницу письма уведомления для юзера
       И должен увидеть текст "Ваш аккаунт подтверждён"
       И перехожу на страницу почты mailcatcher
       И кликаю на ссылку "Clear"
       И кликаю на алерт "Ok"







