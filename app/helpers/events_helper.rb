module EventsHelper
  def locales_and_names
    I18n.available_locales.collect do |l|
      name = I18n.t :locale_name, locale: l
      [name, l]
    end
  end
end
