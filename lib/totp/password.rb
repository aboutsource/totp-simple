module TOTP
  class Password < Struct.new(:secret)

    TIME_STEP = 3

    def generate(now = Time.now.to_i)
      OpenSSL::HMAC.hexdigest(Password.digest, secret, (now/TIME_STEP).to_s)
    end

    # Verify given password by comparison with new generated password
    # Repeat verification 2 times and go back in time to avoid time
    # synchronisation errors. See https://tools.ietf.org/html/rfc6238#section-6
    def verify(password)
      (0..2).each do |step|
        i = Time.now.to_i - (step*TIME_STEP)

        return true if generate(i) == password
      end
      false
    end


    def self.digest
      @@digest ||= OpenSSL::Digest.new('sha256')
    end

  end
end
