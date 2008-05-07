module Alertpay
  module Helpers
    def alertpay_form_tag(url = 'https://www.alertpay.com/PayProcess.aspx', options = {}, &block)
      if block_given?
        form_tag(url, options, &block)
      else
        form_tag(url, options)
      end
    end

    def alertpay_setup(amount, item_id, merchant, options = {})
      params = {
        :ap_amount       => amount,
        :ap_merchant     => merchant,
        :ap_itemcode     => item_id,
        :ap_quantity     => 1
      }

      if options.include?(:subscription)
        params[:ap_purchasetype] = :subscription
        params[:ap_periodlength] = options[:subscription][:length]
        params[:ap_timeunit] = case options[:subscription][:period]
          when :monthly; 'Month'
          when :yearly;  'Year'
          when :weekly;  'Week'
          when :daily;   'Day'
        end
      else
        params[:ap_purchasetype] = :item
      end

      if options.include?(:custom)
        options[:custom].each_index {|i| params["apc_#{i.to_i + 1}"] = options[:custom][i] }
      end

      params[:ap_quantity]   = options[:quanity]       if options.include?(:quanity)
      params[:ap_itemname]   = options[:item_name]     if options.include?(:item_name)
      params[:purchase_type] = options[:purchase_type] if options.include?(:purchase_type)
      params[:ap_notifyurl]  = options[:notify_url]    if options.include?(:notify_url)
      params[:ap_returnurl]  = options[:return_url]    if options.include?(:return_url)
      params[:ap_cancelurl]  = options[:cancel_url]    if options.include?(:cancel_url)

      returning button = [] do
        params.each do |k, v|
          button << tag(:input, :type => :hidden, :name => k.to_s, :value => v.to_s) unless v.nil?
        end
      end.join("\n")
    end
  end
end
