require 'spec_helper'
require 'paystack/objects/verification.rb'
require 'paystack.rb'

public_test_key = "pk_test_2f32c8e5478b41e9f737de5a64c5ab516cd57946"
private_test_key = "sk_test_cec422efd6cc29427383acdb517ce0bd43e6247c"

describe PaystackVerification do

	it "should return a valid verfication object" do
		paystack = Paystack.new(public_test_key, private_test_key)
		verification = PaystackVerification.new(paystack)
		expect(verification.nil?).to eq false
	end

	it "should resolve customer account details" do
		paystack = Paystack.new(public_test_key, private_test_key)
		verification = PaystackVerification.new(paystack)

    account_number = "9010761375" # personal account but no forseen risk
    bank_code = "999992" # bank code for Opay
    resolve_account = verification.resolveAccount(account_number, bank_code)

		account_info =  resolve_account['data']
		expect(account_info.nil?).to eq false
		expect(account_info['account_number']).to eq "9010761375"
    expect(account_info['account_name']).to eq "OLUWAGBAMILA ABIODUN AREMU"
	end

	it "should return object for validateAccount " do
		paystack = Paystack.new(public_test_key, private_test_key)
		verification = PaystackVerification.new(paystack)

		# gotten from paystack docs
		data = {
			"bank_code": "632005",
			"country_code": "ZA",
			"account_number": "0123456789",
			"account_name": "Ann Bron",
			"account_type": "personal",
			"document_type": "identityNumber",
			"document_number": "1234567890123"
		}
    validate_account = verification.validateAccount(data)

		validate_account_data =  validate_account['data']
		expect(validate_account_data.nil?).to eq false
	end

	it "should return object for resolveCardBin " do
		paystack = Paystack.new(public_test_key, private_test_key)
		verification = PaystackVerification.new(paystack)

		bin = "539983" # gotten from paystack docs
    resolve_card_bin = verification.resolveCardBin(bin)

		resolve_card_bin_data =  resolve_card_bin['data']
		expect(resolve_card_bin_data.nil?).to eq false
	end

end
