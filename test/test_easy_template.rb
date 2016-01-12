require 'minitest/autorun'
require 'easy_template'

class EasyTemplateTest < Minitest::Test
  def test_empty_string
    assert_equal '',
                 EasyTemplate::process('', {})
  end

  def test_without_substitution
    assert_equal 'test',
                 EasyTemplate::process('test', {})
  end

  def test_with_a_single_substitution
    assert_equal 'world!',
                 EasyTemplate::process('{hello}', {'hello' => 'world!'})
  end

  def test_with_static_text_and_substitution
    assert_equal 'Hello Mr Bowie!',
                 EasyTemplate::process('Hello Mr {last name}!', {'last name' => 'Bowie'})
  end

  def test_with_escaped_text
    assert_equal 'Hello Mrs {first name} Simone!',
                 EasyTemplate::process('Hello Mrs \{first name} {last name}!', {'first name' => 'Nina', 'last name' => 'Simone'})
  end

  def test_with_escaped_text_at_begin
    assert_equal '{first name} Simone!',
                 EasyTemplate::process('\{first name} {last name}!', {'first name' => 'Nina', 'last name' => 'Simone'})
  end

  def test_with_escaped_text_everywhere
    assert_equal '{first nam{e} {Simone{',
                 EasyTemplate::process('\{first nam\{e} \{{last name}\{', {'first name' => 'Nina', 'last name' => 'Simone'})
  end

  def test_fun
    assert_equal 'Not bad ={D!',
                 EasyTemplate::process('{fun }{{{}}} {test yeah!}', {'fun }{{{}}} {test yeah!' => 'Not bad ={D!'})
  end
end