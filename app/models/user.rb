class User < ActiveRecord::Base
  validates :login_name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present

  def User.authenticate(name, password)
    if user = find_by_login_name(name)
      if user.password_hash == encrypt_password(password, user.password_salt)
        user
      end
    end
  end


  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "blabla" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.password_hash = self.class.encrypt_password(password, self.password_salt)
    end
  end

  private

    def generate_salt
      self.password_salt = [Array.new(6){rand(256).chr}.join].pack("m" ).chomp
    end

    def password_must_be_present
      errors.add(:password, "Missing password" ) unless password_hash.present?
    end

end
