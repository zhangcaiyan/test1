class Info < ActiveRecord::Base
  extend FriendlyId
  after_save :setup_slug

  friendly_id :slug

  protected

  def setup_slug
    self.update_column(:slug, "#{self.id} - #{self.name}")
  end
end
