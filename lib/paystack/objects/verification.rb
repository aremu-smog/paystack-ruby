require 'paystack/objects/base.rb'

class PaystackVerification < PaystackBaseObject
    def resolveAccount(account_number, bank_code)
        return PaystackVerification.resolveAccount(@paystack, account_number, bank_code)
    end

    def validateAccount(args)
        return PaystackVerification.validateAccount(@paystack, args)
    end

    def resolveCardBin(bin)
        return PaystackVerification.resolveCardBin(@paystack, bin)
    end

# => Public Static Methods

    def PaystackVerification.resolveAccount(paystackObj, account_number, bank_code)
        path = "#{API::BANK_PATH}#{API::RESOLVE_PATH}?account_number=#{account_number}&bank_code=#{bank_code}"
        initGetRequest(paystackObj, path)
    end

    def PaystackVerification.validateAccount(paystackObj, data)
        path = "#{API::BANK_PATH}#{API::VALIDATE_PATH}"
        initPostRequest(paystackObj, path, data, true)
    end

    def PaystackVerification.resolveCardBin(paystackObj, bin)
        path = "#{API::DECISION_PATH}/bin/#{bin}"
        initGetRequest(paystackObj, path)
    end
end
