public class ExchangeRateController {
	@AuraEnabled
	public static CurrencyInfo getData() {

		HttpRequest request = new HttpRequest();
		request.setEndpoint('http://api.ratesapi.io/api/latest');
		request.setMethod('GET');

		Http http = new Http();
		HTTPResponse response = http.send(request);

		CurrencyInfo currencyInfo = (CurrencyInfo) JSON.deserialize(response.getBody(), CurrencyInfo.class);
		return currencyInfo;
	}

	public class CurrencyInfo {
		@AuraEnabled public String base;
		@AuraEnabled public Map<String,Decimal> rates;
	}

}