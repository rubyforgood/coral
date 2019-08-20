module Helpers
  def locale_path_prefixes
    I18n.available_locales.map{ |l| "/#{l}" } << ""
  end
  def default_locale
    I18n.default_locale
  end
end