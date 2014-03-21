class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.zhuaqu
    url = "http://www.youdaili.cn/Daili/http/list_"
    agent = Mechanize.new
    10.times.each do |i|
      page = agent.get url+(i+1).to_s+".html"
      page.search(".newslist_line li a").each do |doc|
        proxy_url = doc.attributes["href"].value
        proxy_page = agent.get proxy_url
        ips = proxy_page.body.encode.scan(/[\d|\.\:]*(?=@)/).flatten.select{|str| str.present?}
        ips.each do |ip|
          if check_ip?(ip)
            puts "#{ip} 有效"
          else
            puts "#{ip} 无效"
          end
        end
      end
    end

  end

  def self.check_ip?(ip)
    agent = Mechanize.new
    ip, port = ip.split(":")
    agent.set_proxy(ip, port)
    is_available = false
    begin
      page = agent.get "http://www.baidu.com"
      is_available = true
      DailiIp.find_or_create_by(name: ip, port: port)
    rescue
    end
    is_available
  end
end
