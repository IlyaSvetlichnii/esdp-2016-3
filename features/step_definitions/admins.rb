constants = {email: 'admin@example.com', password: 'password', f_email: 'asd@asd.asd', f_password: 'asddsa'}

When(/^я нахожусь на странице авторизации админки$/) do
  visit('/admin/login')
  page.assert_text('Войти')
end

When(/^я пытаюсь авторизоватья как Админ$/) do
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:email])
    fill_in('Пароль*', with: constants[:password])
  end
  click_button('Войти')
end

When(/^авторизация проходит успешно$/) do
  page.assert_text('Вход в систему выполнен.')
end


When(/^я залогинен и нахожусь в корне админки$/) do
  visit('/admin/login')
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:email])
    fill_in('Пароль*', with: constants[:password])
  end
  click_button('Войти')
  page.assert_text('Вход в систему выполнен')
end

When(/^я захожу в раздел Ученики$/) do
  click_on('Студенты')
end

When(/^вижу список Учеников$/) do
  page.assert_text('stud1')
end

When(/^я захожу в раздел Учителя$/) do
  click_on('Преподаватели')
end

When(/^вижу список Учителей$/) do
  page.assert_text('teach1')
end

When(/^я захожу в раздел Запросы на регистрацию$/) do
  click_on('Запросы на регистрацию')
end

When(/^вижу список Неподтверждённых$/) do
  page.assert_text('pend1')
end

When(/^я подтверждаю регистрацию$/) do
  click_on('Подтвердить')
end

When(/^пользователь переводится в раздел Ученики$/) do
  click_on('Студенты')
  page.assert_text('pend1')
end

When(/^я отказываю пользователя$/) do
  within('#user_5') do
    click_on('Отказать')
  end
end

When(/^он перемещается в список Отказанные$/) do
  click_on('Отказанные')
  page.assert_text('pend1')
end

When(/^я пытаюсь авторизоватья как Незарегистрированный админ$/) do
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:f_email])
    fill_in('Пароль*', with: constants[:f_password])
  end
  click_button('Войти')
end

When(/^авторизация админа не проходит$/) do
  page.assert_text('Неверный адрес эл. почты или пароль.')
end

When(/^я захожу в раздел Вопросы$/) do
  click_on('Вопросы')
end

When(/^я вижу список вопросов$/) do
  page.assert_text('Вопросы')
  page.assert_text('Создать Вопрос')
end

When(/^я захожу в раздел "Панель управления"$/) do
  click_on('Панель управления')
end

When(/^вижу "Панель управления"$/) do
  page.assert_text('Панель управления')
  page.assert_text('Добро пожаловать в панель Администратора')
end

When(/^я захожу в раздел "Комментарии"$/) do
  click_on('Комментарии')
end


When(/^вижу список комментариев$/) do
  page.assert_text('Комментарии')
end