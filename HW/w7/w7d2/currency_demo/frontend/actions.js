const selectCurrency = function(baseCurrency, rates){
	return {
		type: "SWITCH_CURRENCY",
		baseCurrency: baseCurrency,
		rates: rates
	};
}

// window.selectCurrency = selectCurrency;

export default selectCurrency;
