# EasyTemplate [![Gem Version](https://badge.fury.io/rb/easy_template.svg)](https://badge.fury.io/rb/easy_template)

Easy template language in ruby, with only variable substitution.

## Documentation

```ruby
# Arguments:
#   text: (String)
#         the string containing your template
#   variables: (Hash)
#         the hash containing the values to substitute in place of the keys
#         enclosed by { and }.
EasyTemplate::process(text, variables)
```
NB: If you want to use raw `{` in your template you can escape it with `\`.

## Examples:

```ruby
EasyTemplate::process('Hello Mr {last name}!', {
    'last name' => 'Bowie'
  })
```
_Hello Mr Bowie!_

```ruby
EasyTemplate::process('\{first name} {last name}!', {
    'first name' => 'Nina',
    'last name' => 'Simone'
  })
```
_{first name} Simone!_

## License

Copyright © 2016 Jérémy Lecerf, EasyTemplate is free software, and may be redistributed under the terms specified in the [license](LICENSE).