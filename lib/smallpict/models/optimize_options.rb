# frozen_string_literal: true

module SmallPict
  module Models
    class OptimizeOptions
      attr_reader :format, :quality, :max_width, :max_height, :max_dimension, :fit,
                  :lossless, :strip_metadata, :filename, :mime_type, :content_type, :idempotency_key

      def initialize(
        format: "auto",
        quality: 80,
        max_width: nil,
        max_height: nil,
        max_dimension: nil,
        fit: "cover",
        lossless: false,
        strip_metadata: true,
        filename: nil,
        mime_type: nil,
        content_type: nil,
        idempotency_key: nil
      )
        @format          = format.to_s
        @quality         = quality&.clamp(1, 100)
        @max_width       = max_width
        @max_height      = max_height
        @max_dimension   = max_dimension
        @fit             = fit.to_s
        @lossless        = lossless
        @strip_metadata  = strip_metadata
        @filename        = filename
        @mime_type       = mime_type || content_type
        @content_type    = content_type || mime_type
        @idempotency_key = idempotency_key
      end

      def to_h
        {
          format: @format,
          quality: @quality,
          max_width: @max_width,
          max_height: @max_height,
          max_dimension: @max_dimension,
          fit: @fit,
          lossless: @lossless,
          strip_metadata: @strip_metadata
        }.compact
      end
    end
  end
end
