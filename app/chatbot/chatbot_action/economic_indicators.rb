module ChatbotAction
  class EconomicIndicators < BaseAction
    def self.perform(conversation)
      indicators = ApiRest::Mindicator.get_indicators
      return error_message unless indicators
      uf =  indicators['uf']['valor']
      usd =  indicators['dolar']['valor']
      utm =  indicators['uf']['valor']
      "uf: #{uf}, usd: #{usd}, utm #{utm} "
    end
  end
end