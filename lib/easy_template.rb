module EasyTemplate
  # params:
  #  text:      string
  #  variables: hash
  def self.process(text, variables)
    text.gsub(/(\\\{)|((?<!\\)(?:\\\\)*#{variables.map{|v|"\\{#{v[0]}\\}"}.join('|')})/i){|s| s[0] == '\\' ? s[1] : variables[s[1..-2]]}
  end
end
