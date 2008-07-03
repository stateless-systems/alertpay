require 'cgi'

module Alertpay
  class Notification
    attr_accessor :params
    attr_accessor :raw

    def initialize(post)
      @params = {}
      parse(post)
    end

    # The type of purchase. E.g. 'item' or 'subscription'.
    def purchase_type
      params['ap_purchasetype']
    end

    # Security code sent through from alertpay. You are to compare this with a
    # hard coded value that you get from your alertpay profile, which only you
    # should know.
    def security_code
      params['ap_securitycode']
    end

    # Name of the item that was purchased.
    def item_name
      params['ap_itemname']
    end

    # Was the payment successful?
    def successful?
      status == 'Success'
    end

    # Was this a subscription payment?
    def is_subscription_payment?
      status == 'Subscription-Payment-Success'
    end

    # The shipping charges for this transaction.
    def shipping
      params['ap_shippingcharges'].to_f
    end

    # Amount of item purchased.
    def amount
      params['ap_amount'].to_f
    end

    # Currency that the payment was made in.
    def currency
      params['ap_currency']
    end

    # Status of the payment. E.g. 'Succes'
    def status
      params['ap_status']
    end

    # The reference number or transaction ID you can use to refer to this
    # transaction.
    def reference_number
      params['ap_referencenumber']
    end

    # The email address associated with the merchant that recieved the monies.
    def merchant
      params['ap_merchant']
    end

    # The item code on the alertpay side
    def item_code
      params['ap_itemcode']
    end

    # An array containing the 6 custom elements
    def custom
      params.values_at('apc_1', 'apc_2', 'apc_3', 'apc_4', 'apc_5', 'apc_6')
    end

    private
      def parse(post)
        @raw = post
        CGI.parse(post).each_pair do |k,v|
          params[k] = v.to_s
        end
      end
  end
end
