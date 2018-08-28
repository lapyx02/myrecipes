class Chef < ApplicationRecord
  has_many :recipes
  
  validates :chefname, { presence: true, length: { maximum: 50 }}
  validates :email, { presence: true, length: { maximum: 200 }, uniqueness: true}
  validates :email, format: { with: /\A[\w+\-.]+@[\w\d\-]+(\.[\w\d\-]+)*\.[\w]+\z/i,
    massage: "Не вернны формат email" }
  validate :check_with_blacklist, :check_lowcase_unique
    
  BLACKLIST = ['test@test.ru', 'aaa@aaa.ru']  
  
  def check_with_blacklist
    if BLACKLIST.include? email
      errors.add(:email, "Email in blacklist")
    end
  end
  
  def check_lowcase_unique
    # .where(chefname: '4234234') Select from chefs where LOWER(chefname) = ''
    # .where("LOWER(chefname) = #{name.downcase}")
    if Chef.where('lower(chefname) = ?', chefname.downcase).count > 0 
      errors.add(:chefname, 'ChefName not UNIQUE')
    end
  end
end