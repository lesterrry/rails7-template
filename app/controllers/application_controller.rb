# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

class ApplicationController < ActionController::Base
	before_action :set_locale

	private
	def set_locale
		loc = extract_locale
		unless loc.nil?
			I18n.locale = loc
			cookies[:locale] = loc
		end
	end

	# TODO: debug locales
	def extract_locale
		if !params[:locale].blank?
			p 'a'
			parsed_locale = params[:locale]
		elsif !cookies[:locale].blank?
			p 'b'
			parsed_locale = cookies[:locale]
		elsif !request.location.country_code.blank?
			p 'c'
			parsed_locale = request.location.country_code.downcase
		elsif !request.env['HTTP_ACCEPT_LANGUAGE'].blank?
			p 'd'
			parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0]
		else
			p 'e'
			return nil
		end
		p parsed_locale
		I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
	end
end
