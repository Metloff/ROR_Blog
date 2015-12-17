class Project < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
      text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
