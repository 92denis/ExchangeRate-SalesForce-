({
	getData : function(component,helper) {
		let action = component.get('c.getData');
		action.setCallback(this, function (response) {
			let state = response.getState();

			if (state == 'SUCCESS') {
				let currencyInfo = response.getReturnValue();
				let rates = [];
				for (let key in currencyInfo.rates) {
					rates.push({name: key, value: currencyInfo.rates[key]});
				}
				currencyInfo.rates = rates;
				component.set('v.currencyInfo', currencyInfo);
			}
		});
		$A.enqueueAction(action);
		setInterval(function(){helper.getData(component,helper);}, 600000);
	}
})
