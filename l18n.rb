module L18n

  # The default is currently "en." Once the spanish translation is complete,
  # we should probably change this to "es."
  def lang
    @lang = params["lang"] || request.cookies["lang"] || 'en'
    set_cookie("lang", @lang)
    @lang
  end

  def get_string(key)
    strings[lang][key.to_s] || key
  end

  def strings
    @strings ||= {
      "en" => YAML.load(File.read(File.dirname(__FILE__) + "/strings.en.yaml")),
      "es" => YAML.load(File.read(File.dirname(__FILE__) + "/strings.es.yaml"))
    }
  end

end