module Product::Notifications
  extend ActiveSupport::Concern

  included do
    has_many :suscribers, dependent: :destroy
    after_update_commit :notify_subscribers, if: :back_in_stock?
  end

  def back_in_stock?
    inventory_count_previously_was.zero? && inventory_count.positive?
  end

  def notify_subscribers
    suscribers.each do |subscriber|
      ProductMailer.with(product: self, suscriber: subscriber).in_stock.deliver_later
    end
  end
end
