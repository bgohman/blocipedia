module TestFactories
  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  def admin_user
  	authenticated_user(role: 'admin')
  end

  def new_wiki(options={})
    wiki_options = {title: "fake #{rand}", body: "fake #{rand} #{rand} paragraph", private: false}.merge(options)
    Wiki.create(wiki_options)
  end
end