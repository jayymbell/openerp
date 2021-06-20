class User < ApplicationRecord
  belongs_to :person
  

  has_secure_password
  attr_accessor :activation_token, :reset_token

  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
      SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
  end

  def password_reset_expired?
      reset_sent_at < 2.hours.ago
  end

  def account_activiation_expired?
      self.activation_sent_at < 2.days.ago
  end

  def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
  end

  def create_activation_digest
      self.activation_token  = User.new_token
      update_attribute(:activation_digest,  User.digest(activation_token))
      update_attribute(:activation_sent_at, Time.zone.now)
  end

  def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
  end

  def send_account_activation_email
      UserMailer.account_activation(self).deliver_now
  end

  private

  def password_complexity
      # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
      return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
      errors.add :password, 'does not meet requirements.'
  end
end
