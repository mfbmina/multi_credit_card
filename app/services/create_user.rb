module CreateUser
  def self.call(user_params)
    user = User.new(user_params)
    user.build_wallet
    user.save
    user
  end
end
