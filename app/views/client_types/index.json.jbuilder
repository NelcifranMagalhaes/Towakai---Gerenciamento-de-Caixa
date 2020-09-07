# frozen_string_literal: true

json.array! @client_types, partial: 'client_types/client_type', as: :client_type
