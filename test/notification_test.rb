$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'test/unit'
require 'alertpay'

class NotificationTest < Test::Unit::TestCase
  def test_parse
    alertpay = Alertpay::Notification.new raw_post
  end

  def test_successful
    alertpay = Alertpay::Notification.new raw_post
    assert alertpay.successful?
  end

  def test_custom
    alertpay = Alertpay::Notification.new raw_post
    assert_equal 'Danial Pearce', alertpay.custom[2]
  end

  private
    def raw_post
      'ap_merchant=alertpay@tigris.id.au&ap_securitycode=NOT_SECURE&ap_custfirstname=Danial&ap_custlastname=Pearce&ap_custaddress=1 There St&ap_custcity=Melbourne&ap_custstate=VIC&ap_custcountry=AUS&ap_custzip=3000&ap_custemailaddress=alertpay@tigris.id.au&ap_purchasetype=subscription&ap_referencenumber=TEST TRANSACTION&ap_itemname=Jigglets&ap_description=&ap_itemcode=&ap_quantity=1&ap_amount=28&ap_shippingcharges=0&ap_additionalcharges=0&ap_taxamount=0&ap_discountamount=0&ap_totalamount=28&ap_currency=USD&ap_subscriptionreferencenumber=REFERENCE&ap_timeunit=Month&ap_periodlength=1&ap_periodcount=-1&ap_nextrundate=&apc_1=1&apc_2=alertpay@tigris.id.au&apc_3=Danial Pearce&apc_4=&apc_5=&apc_6=&ap_test=1&ap_status=Success'
    end
end
