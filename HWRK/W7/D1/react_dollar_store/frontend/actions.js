function selectCurrency (baseCurrency, rates) {
// ( string, obj )

  return ({
    type: "SWITCH_CURRENCY",
    baseCurrency: baseCurrency,
    rates: rates
  });
}

export default selectCurrency;
