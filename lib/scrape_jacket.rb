# -*- coding: utf-8 -*-

require 'open-uri'
require 'nokogiri'
require 'scanf'
require 'json'
require 'net/http'
require 'dotenv'

User_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)'

class ScrapeJacket
  # =====================================================================
  # 楽天ブックスからCDへのリンクを収集する
  # =====================================================================

  def self.rakuten_get_link(title, num)
    links = [] # 検索結果格納用
    begin
      title = title.encode 'EUC-JP' # 日本語をEUC形式にする
      url_title = URI.encode(title) # 日本語文字列をURI変換する
    rescue
      return nil
    end

    url = "http://search.books.rakuten.co.jp/bksearch/nm?sv=30&h=30&o=0&v=&spv=&s=1&e=&cy=&b=1&g=002&sitem=#{url_title}&x=0&y=0"

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML(open(url, 'User-Agent' => User_agent).read)

    for i in 1..num do
      begin
        # 検索結果
        url = doc.xpath('//*[@id="ratArea"]/div/'+"div[#{i}]/div[2]/div[1]/h3/a").attribute('href').value
        links << url
      rescue
      end
    end
    return links if links.present?
  end

  # =====================================================================
  #  楽天ブックスのリンクからCDジャケットを収集する
  # =====================================================================

  def self.rakuten_get_cdjacket(urls)
    imgs = [] # 画像URL格納用
    urls.each do |url|
      # htmlをパース(解析)してオブジェクトを生成
      doc = Nokogiri::HTML(open(url, 'User-Agent' => User_agent).read)

      # リンク先から画像のurlを取得
      img = doc.xpath('//*[@id="productExtra"]/dl/dt/a/img').attribute('src').value
      img =  img.split('?')[0] if img.present?
      imgs << img
    end
    return imgs if imgs.present?
  end
end
