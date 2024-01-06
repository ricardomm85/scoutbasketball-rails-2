# frozen_string_literal: true

class Player < ApplicationRecord
  before_save :generate_slug

  def generate_slug
    return unless slug.blank?

    self.slug = "#{name} #{surname}".parameterize
  end
end
