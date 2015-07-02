require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'pry'
class Hoge

  @url = "http://pickup.pbs.gov.tw/pbsmgt/"

  def self.scrape_include_js_contents
    #poltergistの設定
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 1000 })
    end
    session = Capybara::Session.new(:poltergeist)
    #自由にUser-Agent設定してください。
    session.driver.headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }
    session.visit @url+"Puba.html"
    #page = Nokogiri::HTML.parse(session.html)
    links = session.all 'tr td a'

    all_ans = []
    links.drop(1).each do |link|
      session = Capybara::Session.new(:poltergeist)
      session.visit @url+link[:href]
      text_content = session.all('tbody tr td').map {|x| x.text}
      img_content = session.all('tbody tr td img').map {|x| x[:src]}
      ans = text_content.each_with_index.map {|x,index| {text: x, img:img_content[index]}}
      p ans
      all_ans = all_ans + ans
    end
    binding.pry
  end
end

Hoge.scrape_include_js_contents
