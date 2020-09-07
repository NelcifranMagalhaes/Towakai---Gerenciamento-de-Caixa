# frozen_string_literal: true

json.array! @payment_types, partial: 'payment_types/payment_type', as: :payment_type
