class Currency
  
  class<<self
    def find(iso_code)
      self.new(@@iso_codes[iso_code.to_s.downcase.intern])
    end
    def all
      @@all ||= @@iso_codes.collect{|c| new(c[1])}.sort
    end
    def iso_codes
      @@iso_codes
    end
  end
  
  def <=>(o)
    [self.position, self.name] <=> [o.position, o.name]
  end
  
  def description
    # ["#{name}#{(iso_code.nil? ? "" : " (#{iso_code})")}", sign].compact.join(" - ")
    # ["#{name} - #{sign}", iso_code].compact.join(" ")
    # [name, sign].compact.join(" - ") + (iso_code.nil? ? "" : " (#{iso_code})")
    [iso_code, "#{name} (#{sign})"].join(" - ")
  end
  
  def to_s
    iso_code
  end
  
  def unit
    sign
  end
  
  attr_accessor :name, :sign, :iso_code, :format, :separator, :delimiter, :fractional_monitary_unit, :number_to_basic, :position
  def initialize(params={})
    params.each { |k, v| send("#{k}=", v)} if params
  end
  
  @@iso_codes = {
    :usd => {:position => 1,   :name => "United States Dollar",                      :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "USD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :aud => {:position => 2,   :name => "Australian Dollar",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "AUD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :cad => {:position => 3,   :name => "Canadian Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "CAD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :gbp => {:position => 4,   :name => "British Pound",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£", :iso_code => "GBP", :fractional_monitary_unit => "Penny", :number_to_basic => "100"},
    :eur => {:position => 5,   :name => "Euro",                                      :format => "%n %u", :delimiter => '.', :separator => ',', :sign => "€", :iso_code => "EUR", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :afn => {:position => 100, :name => "Afghan Afghani",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "؋", :iso_code => "AFN", :fractional_monitary_unit => "Pul", :number_to_basic => "100"},
    :all => {:position => 100, :name => "Albanian Lek",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "ALL", :fractional_monitary_unit => "Qintar", :number_to_basic => "100"},
    :dzd => {:position => 100, :name => "Algerian Dinar",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.ج", :iso_code => "DZD", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :aoa => {:position => 100, :name => "Angolan Kwanza",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Kz", :iso_code => "AOA", :fractional_monitary_unit => "Cêntimo", :number_to_basic => "100"},
    :ars => {:position => 100, :name => "Argentine Peso",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "ARS", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :amd => {:position => 100, :name => "Armenian Dram",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "դր.", :iso_code => "AMD", :fractional_monitary_unit => "Luma", :number_to_basic => "100"},
    :awg => {:position => 100, :name => "Aruban Florin",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ƒ", :iso_code => "AWG", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :azn => {:position => 100, :name => "Azerbaijani Manat",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "AZN", :fractional_monitary_unit => "Qəpik", :number_to_basic => "100"},
    :bsd => {:position => 100, :name => "Bahamian Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "BSD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :bhd => {:position => 100, :name => "Bahraini Dinar",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ب.د", :iso_code => "BHD", :fractional_monitary_unit => "Fils", :number_to_basic => "1,000"},
    :bdt => {:position => 100, :name => "Bangladeshi Taka",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "৳", :iso_code => "BDT", :fractional_monitary_unit => "Paisa", :number_to_basic => "100"},
    :bbd => {:position => 100, :name => "Barbadian Dollar",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "BBD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :byr => {:position => 100, :name => "Belarusian Ruble",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Br", :iso_code => "BYR", :fractional_monitary_unit => "Kapyeyka", :number_to_basic => "100"},
    :bzd => {:position => 100, :name => "Belize Dollar",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "BZD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :bmd => {:position => 100, :name => "Bermudian Dollar",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "BMD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :btn => {:position => 100, :name => "Bhutanese Ngultrum",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "BTN", :fractional_monitary_unit => "Chertrum", :number_to_basic => "100"},
    :bob => {:position => 100, :name => "Bolivian Boliviano",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Bs.", :iso_code => "BOB", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :bam => {:position => 100, :name => "Bosnia and Herzegovina Convertible Mark",   :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "KM or КМ", :iso_code => "BAM", :fractional_monitary_unit => "Fening", :number_to_basic => "100"},
    :bwp => {:position => 100, :name => "Botswana Pula",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "P", :iso_code => "BWP", :fractional_monitary_unit => "Thebe", :number_to_basic => "100"},
    :brl => {:position => 100, :name => "Brazilian Real",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "R$", :iso_code => "BRL", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :bnd => {:position => 100, :name => "Brunei Dollar",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "BND", :fractional_monitary_unit => "Sen", :number_to_basic => "100"},
    :bgn => {:position => 100, :name => "Bulgarian Lev",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "лв", :iso_code => "BGN", :fractional_monitary_unit => "Stotinka", :number_to_basic => "100"},
    :bif => {:position => 100, :name => "Burundian Franc",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "BIF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :khr => {:position => 100, :name => "Cambodian Riel",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "៛", :iso_code => "KHR", :fractional_monitary_unit => "Sen", :number_to_basic => "100"},
    :cve => {:position => 100, :name => "Cape Verdean Escudo",                       :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$ or Esc", :iso_code => "CVE", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :kyd => {:position => 100, :name => "Cayman Islands Dollar",                     :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "KYD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :xaf => {:position => 100, :name => "Central African Cfa Franc",                 :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "XAF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :xpf => {:position => 100, :name => "Cfp Franc",                                 :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "XPF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :clp => {:position => 100, :name => "Chilean Peso",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "CLP", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :cny => {:position => 100, :name => "Chinese Renminbi Yuan",                     :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "¥", :iso_code => "CNY", :fractional_monitary_unit => "Jiao", :number_to_basic => "10"},
    :cop => {:position => 100, :name => "Colombian Peso",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "COP", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :kmf => {:position => 100, :name => "Comorian Franc",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "KMF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :cdf => {:position => 100, :name => "Congolese Franc",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "CDF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :crc => {:position => 100, :name => "Costa Rican Colón",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₡", :iso_code => "CRC", :fractional_monitary_unit => "Céntimo", :number_to_basic => "100"},
    :hrk => {:position => 100, :name => "Croatian Kuna",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "kn", :iso_code => "HRK", :fractional_monitary_unit => "Lipa", :number_to_basic => "100"},
    :cuc => {:position => 100, :name => "Cuban Convertible Peso",                    :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "CUC", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :cup => {:position => 100, :name => "Cuban Peso",                                :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "CUP", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :czk => {:position => 100, :name => "Czech Koruna",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Kč", :iso_code => "CZK", :fractional_monitary_unit => "Haléř", :number_to_basic => "100"},
    :dkk => {:position => 100, :name => "Danish Krone",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "kr", :iso_code => "DKK", :fractional_monitary_unit => "Øre", :number_to_basic => "100"},
    :djf => {:position => 100, :name => "Djiboutian Franc",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "DJF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :dop => {:position => 100, :name => "Dominican Peso",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "DOP", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :xcd => {:position => 100, :name => "East Caribbean Dollar",                     :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "XCD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :egp => {:position => 100, :name => "Egyptian Pound",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£ or ج.م", :iso_code => "EGP", :fractional_monitary_unit => "Piastre", :number_to_basic => "100"},
    :ern => {:position => 100, :name => "Eritrean Nakfa",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Nfk", :iso_code => "ERN", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :eek => {:position => 100, :name => "Estonian Kroon",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "KR", :iso_code => "EEK", :fractional_monitary_unit => "Sent", :number_to_basic => "100"},
    :etb => {:position => 100, :name => "Ethiopian Birr",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "ETB", :fractional_monitary_unit => "Santim", :number_to_basic => "100"},
    :fkp => {:position => 100, :name => "Falkland Pound",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£", :iso_code => "FKP", :fractional_monitary_unit => "Penny", :number_to_basic => "100"},
    :fjd => {:position => 100, :name => "Fijian Dollar",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "FJD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :gmd => {:position => 100, :name => "Gambian Dalasi",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "D", :iso_code => "GMD", :fractional_monitary_unit => "Butut", :number_to_basic => "100"},
    :gel => {:position => 100, :name => "Georgian Lari",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ლ", :iso_code => "GEL", :fractional_monitary_unit => "Tetri", :number_to_basic => "100"},
    :ghc => {:position => 100, :name => "Ghanaian Cedi",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₵", :iso_code => "GHC", :fractional_monitary_unit => "Pesewa", :number_to_basic => "100"},
    :gip => {:position => 100, :name => "Gibraltar Pound",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£", :iso_code => "GIP", :fractional_monitary_unit => "Penny", :number_to_basic => "100"},
    :gtq => {:position => 100, :name => "Guatemalan Quetzal",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Q", :iso_code => "GTQ", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :gnf => {:position => 100, :name => "Guinean Franc",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "GNF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :gyd => {:position => 100, :name => "Guyanese Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "GYD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :htg => {:position => 100, :name => "Haitian Gourde",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "G", :iso_code => "HTG", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :hnl => {:position => 100, :name => "Honduran Lempira",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "HNL", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :hkd => {:position => 100, :name => "Hong Kong Dollar",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "HKD", :fractional_monitary_unit => "Ho", :number_to_basic => "10"},
    :huf => {:position => 100, :name => "Hungarian Forint",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Ft", :iso_code => "HUF", :fractional_monitary_unit => "Fillér", :number_to_basic => "100"},
    :isk => {:position => 100, :name => "Icelandic Króna",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "kr", :iso_code => "ISK", :fractional_monitary_unit => "Eyrir", :number_to_basic => "100"},
    :inr => {:position => 100, :name => "Indian Rupee",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₨", :iso_code => "INR", :fractional_monitary_unit => "Paisa", :number_to_basic => "100"},
    :idr => {:position => 100, :name => "Indonesian Rupiah",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Rp", :iso_code => "IDR", :fractional_monitary_unit => "Sen", :number_to_basic => "100"},
    :irr => {:position => 100, :name => "Iranian Rial",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "﷼", :iso_code => "IRR", :fractional_monitary_unit => "Dinar", :number_to_basic => "100"},
    :iqd => {:position => 100, :name => "Iraqi Dinar",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ع.د", :iso_code => "IQD", :fractional_monitary_unit => "Fils", :number_to_basic => "1,000"},
    :ils => {:position => 100, :name => "Israeli New Sheqel",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₪", :iso_code => "ILS", :fractional_monitary_unit => "Agora", :number_to_basic => "100"},
    :jmd => {:position => 100, :name => "Jamaican Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "JMD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :jpy => {:position => 100, :name => "Japanese Yen",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "¥", :iso_code => "JPY", :fractional_monitary_unit => "Sen", :number_to_basic => "100"},
    :jod => {:position => 100, :name => "Jordanian Dinar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.ا", :iso_code => "JOD", :fractional_monitary_unit => "Piastre", :number_to_basic => "100"},
    :kzt => {:position => 100, :name => "Kazakhstani Tenge",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "〒", :iso_code => "KZT", :fractional_monitary_unit => "Tiyn", :number_to_basic => "100"},
    :kes => {:position => 100, :name => "Kenyan Shilling",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Sh", :iso_code => "KES", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :kwd => {:position => 100, :name => "Kuwaiti Dinar",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.ك", :iso_code => "KWD", :fractional_monitary_unit => "Fils", :number_to_basic => "1,000"},
    :kgs => {:position => 100, :name => "Kyrgyzstani Som",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "KGS", :fractional_monitary_unit => "Tyiyn", :number_to_basic => "100"},
    :lak => {:position => 100, :name => "Lao Kip",                                   :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₭", :iso_code => "LAK", :fractional_monitary_unit => "Att", :number_to_basic => "100"},
    :lvl => {:position => 100, :name => "Latvian Lats",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Ls", :iso_code => "LVL", :fractional_monitary_unit => "Santīms", :number_to_basic => "100"},
    :lbp => {:position => 100, :name => "Lebanese Lira",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ل.ل", :iso_code => "LBP", :fractional_monitary_unit => "Piastre", :number_to_basic => "100"},
    :lsl => {:position => 100, :name => "Lesotho Loti",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "LSL", :fractional_monitary_unit => "Sente", :number_to_basic => "100"},
    :lrd => {:position => 100, :name => "Liberian Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "LRD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :lyd => {:position => 100, :name => "Libyan Dinar",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ل.د", :iso_code => "LYD", :fractional_monitary_unit => "Dirham", :number_to_basic => "1,000"},
    :ltl => {:position => 100, :name => "Lithuanian Litas",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Lt", :iso_code => "LTL", :fractional_monitary_unit => "Centas", :number_to_basic => "100"},
    :mop => {:position => 100, :name => "Macanese Pataca",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "P", :iso_code => "MOP", :fractional_monitary_unit => "Avo", :number_to_basic => "100"},
    :mkd => {:position => 100, :name => "Macedonian Denar",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ден", :iso_code => "MKD", :fractional_monitary_unit => "Deni", :number_to_basic => "100"},
    :mga => {:position => 100, :name => "Malagasy Ariary",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "MGA", :fractional_monitary_unit => "Iraimbilanja", :number_to_basic => "5"},
    :mwk => {:position => 100, :name => "Malawian Kwacha",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "MK", :iso_code => "MWK", :fractional_monitary_unit => "Tambala", :number_to_basic => "100"},
    :myr => {:position => 100, :name => "Malaysian Ringgit",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "RM", :iso_code => "MYR", :fractional_monitary_unit => "Sen", :number_to_basic => "100"},
    :mvr => {:position => 100, :name => "Maldivian Rufiyaa",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ރ.", :iso_code => "MVR", :fractional_monitary_unit => "Laari", :number_to_basic => "100"},
    :mro => {:position => 100, :name => "Mauritanian Ouguiya",                       :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "UM", :iso_code => "MRO", :fractional_monitary_unit => "Khoums", :number_to_basic => "5"},
    :mur => {:position => 100, :name => "Mauritian Rupee",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₨", :iso_code => "MUR", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :mxn => {:position => 100, :name => "Mexican Peso",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "MXN", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :mdl => {:position => 100, :name => "Moldovan Leu",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "MDL", :fractional_monitary_unit => "Ban", :number_to_basic => "100"},
    :mnt => {:position => 100, :name => "Mongolian Tögrög",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₮", :iso_code => "MNT", :fractional_monitary_unit => "Möngö", :number_to_basic => "100"},
    :mad => {:position => 100, :name => "Moroccan Dirham",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.م.", :iso_code => "MAD", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :mzn => {:position => 100, :name => "Mozambican Metical",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "MTn", :iso_code => "MZN", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :mmk => {:position => 100, :name => "Myanmar Kyat",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "K", :iso_code => "MMK", :fractional_monitary_unit => "Pya", :number_to_basic => "100"},
    :nad => {:position => 100, :name => "Namibian Dollar",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "NAD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :npr => {:position => 100, :name => "Nepalese Rupee",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₨", :iso_code => "NPR", :fractional_monitary_unit => "Paisa", :number_to_basic => "100"},
    :ang => {:position => 100, :name => "Netherlands Antillean Gulden",              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ƒ", :iso_code => "ANG", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :twd => {:position => 100, :name => "New Taiwan Dollar",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "TWD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :nzd => {:position => 100, :name => "New Zealand Dollar",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "NZD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :nio => {:position => 100, :name => "Nicaraguan Córdoba",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "C$", :iso_code => "NIO", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :ngn => {:position => 100, :name => "Nigerian Naira",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₦", :iso_code => "NGN", :fractional_monitary_unit => "Kobo", :number_to_basic => "100"},
    :kpw => {:position => 100, :name => "North Korean Won",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₩", :iso_code => "KPW", :fractional_monitary_unit => "Chŏn", :number_to_basic => "100"},
    :nok => {:position => 100, :name => "Norwegian Krone",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "kr", :iso_code => "NOK", :fractional_monitary_unit => "Øre", :number_to_basic => "100"},
    :omr => {:position => 100, :name => "Omani Rial",                                :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ر.ع.", :iso_code => "OMR", :fractional_monitary_unit => "Baisa", :number_to_basic => "1,000"},
    :pkr => {:position => 100, :name => "Pakistani Rupee",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₨", :iso_code => "PKR", :fractional_monitary_unit => "Paisa", :number_to_basic => "100"},
    :pab => {:position => 100, :name => "Panamanian Balboa",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "B/.", :iso_code => "PAB", :fractional_monitary_unit => "Centésimo", :number_to_basic => "100"},
    :pgk => {:position => 100, :name => "Papua New Guinean Kina",                    :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "K", :iso_code => "PGK", :fractional_monitary_unit => "Toea", :number_to_basic => "100"},
    :pyg => {:position => 100, :name => "Paraguayan Guaraní",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₲", :iso_code => "PYG", :fractional_monitary_unit => "Céntimo", :number_to_basic => "100"},
    :pen => {:position => 100, :name => "Peruvian Nuevo Sol",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "S/.", :iso_code => "PEN", :fractional_monitary_unit => "Céntimo", :number_to_basic => "100"},
    :php => {:position => 100, :name => "Philippine Peso",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₱", :iso_code => "PHP", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :pln => {:position => 100, :name => "Polish Złoty",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "zł", :iso_code => "PLN", :fractional_monitary_unit => "Grosz", :number_to_basic => "100"},
    :qar => {:position => 100, :name => "Qatari Riyal",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ر.ق", :iso_code => "QAR", :fractional_monitary_unit => "Dirham", :number_to_basic => "100"},
    :ron => {:position => 100, :name => "Romanian Leu",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "RON", :fractional_monitary_unit => "Ban", :number_to_basic => "100"},
    :rub => {:position => 100, :name => "Russian Ruble",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "р.", :iso_code => "RUB", :fractional_monitary_unit => "Kopek", :number_to_basic => "100"},
    :rub => {:position => 100, :name => "Russian Ruble",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "руб.", :iso_code => "RUB", :fractional_monitary_unit => "Kopek", :number_to_basic => "100"},
    :rwf => {:position => 100, :name => "Rwandan Franc",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "RWF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :shp => {:position => 100, :name => "Saint Helenian Pound",                      :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£", :iso_code => "SHP", :fractional_monitary_unit => "Penny", :number_to_basic => "100"},
    :svc => {:position => 100, :name => "Salvadoran Colón",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₡", :iso_code => "SVC", :fractional_monitary_unit => "Centavo", :number_to_basic => "100"},
    :wst => {:position => 100, :name => "Samoan Tala",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "T", :iso_code => "WST", :fractional_monitary_unit => "Sene", :number_to_basic => "100"},
    :sar => {:position => 100, :name => "Saudi Riyal",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ر.س", :iso_code => "SAR", :fractional_monitary_unit => "Hallallah", :number_to_basic => "100"},
    :rsd => {:position => 100, :name => "Serbian Dinar",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "din. or дин.", :iso_code => "RSD", :fractional_monitary_unit => "Para", :number_to_basic => "100"},
    :scr => {:position => 100, :name => "Seychellois Rupee",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₨", :iso_code => "SCR", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :sll => {:position => 100, :name => "Sierra Leonean Leone",                      :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Le", :iso_code => "SLL", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :sgd => {:position => 100, :name => "Singapore Dollar",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "SGD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :skk => {:position => 100, :name => "Slovak Koruna",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Sk", :iso_code => "SKK", :fractional_monitary_unit => "Halier", :number_to_basic => "100"},
    :sbd => {:position => 100, :name => "Solomon Islands Dollar",                    :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "SBD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :sos => {:position => 100, :name => "Somali Shilling",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Sh", :iso_code => "SOS", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :zar => {:position => 100, :name => "South African Rand",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "R", :iso_code => "ZAR", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :krw => {:position => 100, :name => "South Korean Won",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₩", :iso_code => "KRW", :fractional_monitary_unit => "Jeon", :number_to_basic => "100"},
    :lkr => {:position => 100, :name => "Sri Lankan Rupee",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ரூ", :iso_code => "LKR", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :sdg => {:position => 100, :name => "Sudanese Pound",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£", :iso_code => "SDG", :fractional_monitary_unit => "Piastre", :number_to_basic => "100"},
    :srd => {:position => 100, :name => "Surinamese Dollar",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "SRD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :szl => {:position => 100, :name => "Swazi Lilangeni",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "L", :iso_code => "SZL", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :sek => {:position => 100, :name => "Swedish Krona",                             :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "kr", :iso_code => "SEK", :fractional_monitary_unit => "Öre", :number_to_basic => "100"},
    :chf => {:position => 100, :name => "Swiss Franc",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "CHF", :fractional_monitary_unit => "Rappen", :number_to_basic => "100"},
    :chf => {:position => 100, :name => "Swiss Franc",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "CHF", :fractional_monitary_unit => "Rappen", :number_to_basic => "100"},
    :syp => {:position => 100, :name => "Syrian Pound",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "£ or ل.س", :iso_code => "SYP", :fractional_monitary_unit => "Piastre", :number_to_basic => "100"},
    :std => {:position => 100, :name => "São Tomé and Príncipe Dobra",               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Db", :iso_code => "STD", :fractional_monitary_unit => "Cêntimo", :number_to_basic => "100"},
    :tjs => {:position => 100, :name => "Tajikistani Somoni",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ЅМ", :iso_code => "TJS", :fractional_monitary_unit => "Diram", :number_to_basic => "100"},
    :tzs => {:position => 100, :name => "Tanzanian Shilling",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Sh", :iso_code => "TZS", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :thb => {:position => 100, :name => "Thai Baht",                                 :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "฿", :iso_code => "THB", :fractional_monitary_unit => "Satang", :number_to_basic => "100"},
    :top => {:position => 100, :name => "Tongan Paʻanga",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "T$", :iso_code => "TOP", :fractional_monitary_unit => "Seniti", :number_to_basic => "100"},
    :ttd => {:position => 100, :name => "Trinidad and Tobago Dollar",                :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "TTD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :tnd => {:position => 100, :name => "Tunisian Dinar",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.ت", :iso_code => "TND", :fractional_monitary_unit => "Millime", :number_to_basic => "1,000"},
    :try => {:position => 100, :name => "Turkish New Lira",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "YTL", :iso_code => "TRY", :fractional_monitary_unit => "New kuruş", :number_to_basic => "100"},
    :try => {:position => 100, :name => "Turkish New Lira",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₤", :iso_code => "TRY", :fractional_monitary_unit => "New kuruş", :number_to_basic => "100"},
    :tmm => {:position => 100, :name => "Turkmenistani Manat",                       :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "m", :iso_code => "TMM", :fractional_monitary_unit => "Tennesi", :number_to_basic => "100"},
    :ugx => {:position => 100, :name => "Ugandan Shilling",                          :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Sh", :iso_code => "UGX", :fractional_monitary_unit => "Cent", :number_to_basic => "100"},
    :uah => {:position => 100, :name => "Ukrainian Hryvnia",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₴", :iso_code => "UAH", :fractional_monitary_unit => "Kopiyka", :number_to_basic => "100"},
    :aed => {:position => 100, :name => "United Arab Emirates Dirham",               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "د.إ", :iso_code => "AED", :fractional_monitary_unit => "Fils", :number_to_basic => "100"},
    :uyu => {:position => 100, :name => "Uruguayan Peso",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "UYU", :fractional_monitary_unit => "Centésimo", :number_to_basic => "100"},
    :uzs => {:position => 100, :name => "Uzbekistani Som",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => nil, :iso_code => "UZS", :fractional_monitary_unit => "Tiyin", :number_to_basic => "100"},
    :vuv => {:position => 100, :name => "Vanuatu Vatu",                              :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Vt", :iso_code => "VUV", :fractional_monitary_unit => nil, :number_to_basic => nil},
    :vef => {:position => 100, :name => "Venezuelan Bolívar",                        :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Bs F", :iso_code => "VEF", :fractional_monitary_unit => "Céntimo", :number_to_basic => "100"},
    :vnd => {:position => 100, :name => "Vietnamese Đồng",                           :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "₫", :iso_code => "VND", :fractional_monitary_unit => "Hào", :number_to_basic => "10"},
    :xof => {:position => 100, :name => "West African Cfa Franc",                    :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "Fr", :iso_code => "XOF", :fractional_monitary_unit => "Centime", :number_to_basic => "100"},
    :yer => {:position => 100, :name => "Yemeni Rial",                               :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "﷼", :iso_code => "YER", :fractional_monitary_unit => "Fils", :number_to_basic => "100"},
    :zmk => {:position => 100, :name => "Zambian Kwacha",                            :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "ZK", :iso_code => "ZMK", :fractional_monitary_unit => "Ngwee", :number_to_basic => "100"},
    :zwd => {:position => 100, :name => "Zimbabwean Dollar",                         :format => "%u%n", :delimiter => ',', :separator => '.', :sign => "$", :iso_code => "ZWD", :fractional_monitary_unit => "Cent", :number_to_basic => "100"}
  }
end