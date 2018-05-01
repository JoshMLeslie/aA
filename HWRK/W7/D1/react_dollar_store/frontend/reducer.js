const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state, action) => {
  state = state || initialState;
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return ({
        baseCurrency: action.baseCurrency,
        rates: action.rates
      });
    default:
      return state;
  }
};

export default reducer;
