module EasyTemplate
  # Arguments:
  #   text: (String)
  #         the string containing your template
  #   variables: (Hash)
  #         the hash containing the values to substitute in place of the keys enclosed by { and }.
  def self.process(text, variables)
    text.gsub(/(\\\{)|((?<!\\)(?:\\\\)*#{variables.map{|v|"\\{#{Regexp.escape(v[0])}\\}"}.join('|')})/i){|s| s[0] == '\\' ? s[1] : 
    variables.fetch(s[1..-2], 
        ( s[1..-2].respond_to?(:to_sym) ? variables.fetch(s[1..-2].to_sym, nil) : nil)
      )
  }
  end
end
