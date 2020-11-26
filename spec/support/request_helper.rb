module Request
  module JsonHelper
    def body
      JSON.parse(subject.body, symbolize_names: true)
    end

    def data
      body[:data]
    end

    def error
      body[:error]
    end
  end
end
