class Usuario < ActiveRecord::Base
  
  # link com Model Nota
  has_many :nota
  
  #
  attr_accessor :password
  
  #
  attr_accessible :nome, :password
  
  #
  validates_uniqueness_of :nome
  
  #
  validates_presence_of :nome, :password

  # method called before
  def before_create
    self.hashed_password = Usuario.hash_password(self.password)
  end
  
  # method called after ???
  def after_create
    @password = nil
  end
  
  #
  def self.authenticate(nome, password)
    hashed_pass = hash_password(password || "")
    find(:first,
         :conditions => ["nome = ? and hashed_password = ?", nome, hashed_pass])
  end
  
  private
  
  # creates a hashed password
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
  
end
