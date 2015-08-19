# Stripe Payment Solutions

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_IOqlYJtJaV85tC5tR2ZQWj7O',
    :secret_key => 'sk_test_j1UXPFBhZ878f1787tdpt8ap'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]