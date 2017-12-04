require "rails_helper"

RSpec.describe ProfilesController, :type => :controller do
  
  context "In profile show" do
    # create(:user) do |user|
    #   user.create(attributes_for(:user))
    # end
    # создать двух юзеров
    it "shold get error when not login" do
      # запросить профайл какого-то юр=зера
      get :show, params: {:id => create(:user).profile.id}
      # проверить соответствие ошибочного кода с кодом ответа
      expect(response).to redirect_to(new_user_session_path)
    end

    it "shold get error when access other user profile" do
# залогинить пользователя 1
      user1 = create(:user)
      user2 = create(:user)

      sign_in(user1)
# сдетать запрос на профайл пользователя 2
      get :show, params: {id: user2.profile.id}
#         # проверить соответствие ошибочного кода с кодом ответа
      expect(response).to have_http_status(404)
    end

    it "shold succeed when get my profile" do
      user1 = create(:user)
# залогинить пользователя 2
# сделать запрос на профайл 2
# получить ответ и сравинить его с положительным ответом
      sign_in(user1)
# сдетать запрос на профайл пользователя 2
      get :show, params: {id: user1.profile.id}
# проверить соответствие ошибочного кода с кодом ответа
      expect(response).to have_http_status(200)

    end
  end
end