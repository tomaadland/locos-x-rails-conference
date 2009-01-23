require 'ext_helpers'
require 'yaml'

module L18n

  # The default is currently "en." Once the spanish translation is complete,
  # we should probably change this to "es."
  def default_lang
    'es'
  end

  def lang
    @lang = params["lang"] || request.cookies["lang"] || default_lang
    response.set_cookie("lang", @lang)
    @lang
  end

  
  def get_string(key, l = lang)
    k = key.to_s
    str = strings[l][k]
    str = strings[default_lang][k] if str.blank? && default_lang != l
    str.blank? ? k : str
  end

  def strings
    @strings ||= {
      "en" => YAML.load(File.read(File.dirname(__FILE__) + "/strings.en.yaml")),
      "es" => YAML.load(File.read(File.dirname(__FILE__) + "/strings.es.yaml"))
    }
  end

end
