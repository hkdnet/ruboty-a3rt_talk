require 'a3rt-talk'

module Ruboty
  module Handlers
    # Enable your ruboty to talk with you by a3rt talk api
    class A3rtTalk < Base
      on(
        /(?<body>.+)/,
        description: "Talk with you if given message didn't match any other handlers",
        missing: true,
        name: "talk"
      )
      env :A3RT_TALK_API_KEY, "API KEY for a3rt talk api"

      def talk(message)
        query = message[:body]
        resp = A3rt::Talk.talk(query, api_key)
        message.reply(resp.reply)
      end

      def api_key
        ENV['A3RT_TALK_API_KEY']
      end
    end
  end
end
