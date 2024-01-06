# frozen_string_literal: true

json.extract! player, :id, :name, :surname, :height, :weight, :birthday, :birthmonth, :birthyear, :slug, :hs_year,
              :recruiter_id, :facebook, :instagram, :twitter, :hand, :positions_validated, :hs_position, :created_at, :updated_at
json.url player_url(player, format: :json)
