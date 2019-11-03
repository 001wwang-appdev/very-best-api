# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#

class Dish < ApplicationRecord

  def cuisine
    return Cuisine.where({id: self.cuisine_id})
  end

  def experts
    return Venue.where({id: Bookmark.where({dish_id: self.id}).pluck('venue_id')}).order(:created_at)
  end

  def bookmarks
    return Bookmark.where({dish_id: self.id}).order(:created_at)
  end

  def fans
    return User.where({id: self.bookmarks.pluck('user_id')}).order(:created_at)
  end
end
