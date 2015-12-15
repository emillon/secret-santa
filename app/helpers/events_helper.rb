module EventsHelper
  def locales_and_names
    locales = [:fr, :en]
    locales.collect do |l|
      name = I18n.t :locale_name, locale: l
      [name, l]
    end
  end
end
